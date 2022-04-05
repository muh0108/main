package ticketing.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class ManagerDBBean {
	private static ManagerDBBean instance = new ManagerDBBean();
	
	public static ManagerDBBean getInstance() {
		return instance;
	}
	
	// getConnection(): DBCP�κ��� Ŀ�ؼ� ��ü�� ���� �޼ҵ�
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	// insertManager(): ȸ�������� ���� �޼ҵ�
		public int insertManager(ManagerBean manager) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO MANAGER VALUES(?, ?, ?, ?)";
			int re = -1;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, manager.getManager_id());
				pstmt.setString(2, manager.getManager_pwd());
				pstmt.setString(3, HanConv.toKorean(manager.getManager_name()));
				pstmt.setTimestamp(4, manager.getManager_regdate());
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
			String sql = "SELECT manager_id FROM MANAGER WHERE manager_id = ?";
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
		
		// managerCheck(): �α��� �� ���̵�� ��й�ȣ�� Ȯ���ϴ� �޼ҵ�
		public int managerCheck(String id, String pwd) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT manager_pwd FROM MANAGER WHERE manager_id = ?";
			int re = -1;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) { // ���̵�� ��ġ�ϴ� ������ ����
					if (rs.getString("manager_pwd").equals(pwd)) {
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
		
		// getManager(): ���̵� ��ġ�ϴ� ȸ���� ������ ������ �޼ҵ�
		public ManagerBean getManager(String id) throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM MANAGER WHERE manager_id = ?";
			ManagerBean manager = null;
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					manager = new ManagerBean();
					manager.setManager_id(rs.getString("manager_id"));
					manager.setManager_pwd(rs.getString("manager_pwd"));
					manager.setManager_name(rs.getString("manager_name"));
					manager.setManager_regdate(rs.getTimestamp("manager_regdate"));
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
			return manager;
		}
		
			//2021-10-22  ������������ ȸ������ �޼ҵ�
				public int deleteMember(String id) throws Exception {
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
								sql = "DELETE FROM MEMBER WHERE member_id = ?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, id);
								re = pstmt.executeUpdate();
							} else {
								// �ش� ���̵� ����
								re = 0;
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
