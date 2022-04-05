package ticketing.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class MemberDBBean {
	private static MemberDBBean instance = new MemberDBBean();
	
	public static MemberDBBean getInstance() {
		return instance;
	}
	
	// getConnection(): DBCP�κ��� Ŀ�ؼ� ��ü�� ���� �޼ҵ�
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// insertMember(): ȸ�������� ���� �޼ҵ�
	public int insertMember(MemberBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?)";
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pwd());
			pstmt.setString(3, HanConv.toKorean(member.getMember_name()));
			pstmt.setString(4, member.getMember_email());
			pstmt.setTimestamp(5, member.getMember_regdate());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// confirmID(): ȸ������ �� �ߺ� ���̵����� Ȯ���ϴ� �޼ҵ�
	public int confirmID(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT member_id FROM MEMBER WHERE member_id = ?";
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re = 1; // �ߺ� ���̵� ����
			} else {
				re = -1; // �ߺ� ���̵� ����
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// memberCheck(): �α��� �� ���̵�� ��й�ȣ�� Ȯ���ϴ� �޼ҵ�
	public int memberCheck(String id, String pwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT member_pwd FROM MEMBER WHERE member_id = ?";
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // ���̵�� ��ġ�ϴ� ������ ����
				if (rs.getString("member_pwd").equals(pwd)) {
					re = 1; // �α��� ����
				} else {
					re = 0; // ��й�ȣ ����
				}
			} else {
				re = -1; // �ش� ���̵� ����
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// getMember(): ���̵� ��ġ�ϴ� ȸ���� ������ ������ �޼ҵ�
	public MemberBean getMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER WHERE member_id = ?";
		MemberBean member = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberBean();
				member.setMember_id(rs.getString("member_id"));
				member.setMember_pwd(rs.getString("member_pwd"));
				member.setMember_name(rs.getString("member_name"));
				member.setMember_email(rs.getString("member_email"));
				member.setMember_regdate(rs.getTimestamp("member_regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return member;
	}
	
	// updateMember(): ȸ�� ���� ���� �� ����ϴ� �޼ҵ�
	public int updateMember(MemberBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER SET member_pwd = ?, member_name = ?, member_email = ? WHERE member_id = ?";
		int re = -1;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_pwd());
			pstmt.setString(2, member.getMember_name());
			pstmt.setString(3, member.getMember_email());
			pstmt.setString(4, member.getMember_id());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	// deleteMember(): ȸ�� Ż�� �� ����ϴ� �޼ҵ�
	public int deleteMember(String id, String pwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			conn = getConnection();
			sql = "SELECT member_pwd FROM MEMBER WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // �ش� ���̵� ���� ȸ�� ����
				String deletePwd = rs.getString("member_pwd");
				if (deletePwd.equals(pwd)) {
					sql = "DELETE FROM MEMBER WHERE member_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					re = pstmt.executeUpdate();
				} else { // ���̵� ��й�ȣ�� ��ġ���� ����.
					re = 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
}