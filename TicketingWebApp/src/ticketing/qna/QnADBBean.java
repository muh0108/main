package ticketing.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class QnADBBean {
private static QnADBBean instance = new QnADBBean();
	
	public static QnADBBean getInstance() {
		return instance; // qnaDBBean�� ��ü�� �Է¹���.
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	public int insertQnA(QnABean QnA, int p_code) {
        //���� �߰��ϴ� �޼ҵ�
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = "";
		int number=1;
		int re=-1;
		
		int q_no = QnA.getQ_no();
		int ref = QnA.getQ_ref(); // �亯���� ��ȣ�� ���
		int step = QnA.getQ_step(); // �亯���̸� ���� 1�� ����
		int level = QnA.getQ_level(); //�亯���� �޸��� 1 ����

		try {
			con = getConnection();
			sql = "select max(q_no) from qna"; 
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) +1; // ���� ���� ����̱� ������ +1	
			}
			
			if(q_no != 0) { //id�� 0�� �ƴϸ� ��۷� ��
				sql="update qna set q_step=q_step+1 where q_ref=? and q_step > ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step =step+1;
				level=level+1;
				
			}else { // ����� �ƴ� �� (�۾����϶�)
				ref=number; // ref�� �� ��ȣ�� ���� ��.
				step=0; 
				level=0;
			}
			
			sql = "insert into qna(performance_p_code,q_no, q_writer, q_content, q_date, "
								  + " q_ref, q_step, q_level)"
								  + " values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//pstmt�� ����
			pstmt.setInt(1, p_code);
			pstmt.setInt(2, number); //�߰� 
			pstmt.setString(3, HanConv.toKorean(QnA.getQ_writer()));
			pstmt.setString(4, HanConv.toKorean(QnA.getQ_content()));
			pstmt.setTimestamp(5, QnA.getQ_date());
			pstmt.setInt(6,ref);
			pstmt.setInt(7,step);
			pstmt.setInt(8,level);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return 1;
	}
	public ArrayList<QnABean> listQnA(String pageNumber,int p_code){
		// ����Ʈ�� �߰��ϴ� �޼ҵ�
		Connection con=null;
		Statement stmt = null; 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet pageSet = null; 	//��������ȣ�� �ޱ�����
		
		ArrayList<QnABean> QnAList = new ArrayList<QnABean>();
		
		int dbCount = 0; 			//������ ��ȣ�ǰ����� �ޱ����� ����
		int absoultePage = 1; 		//����� ������
		
		try {
			con = getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pageSet = stmt.executeQuery("select count(*) from QnA where performance_p_code="+p_code);
			
			if(pageSet.next()) { // dbcount�� �� ������ ����
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % QnABean.pageSize == 0) {
				QnABean.pageCount = dbCount / QnABean.pageSize;
			}else {
				QnABean.pageCount = dbCount / QnABean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				QnABean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (QnABean.pageNum -1) * QnABean.pageSize +1;
				//������ 
			}
			String sql = "select * from QnA where performance_p_code=? order by q_ref desc, q_step asc"; 
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
			pstmt.setInt(1, p_code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rs.absolute(absoultePage); 
				int count = 0;
				
				while (count<QnABean.pageSize) {
					QnABean QnA = new QnABean();
					QnA.setP_code(rs.getInt(1));
					QnA.setQ_no(rs.getInt(2));
					QnA.setQ_writer(rs.getString(3));
					QnA.setQ_content(rs.getString(4));
					QnA.setQ_date(rs.getTimestamp(5));
					QnA.setQ_ref(rs.getInt(6));
					QnA.setQ_step(rs.getInt(7));
					QnA.setQ_level(rs.getInt(8));
					QnAList.add(QnA); 
					
					if(rs.isLast()) {
						break;
					}else {
						rs.next();
					}
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();	
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return QnAList;
	}
	
	public QnABean getQnA(int p_code,int q_no) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		QnABean QnA =null;
		
		try {
		con = getConnection();
		sql ="select * from QnA where performance_p_code=? and q_no =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, p_code);
		pstmt.setInt(2, q_no);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			QnA = new QnABean();
			QnA.setP_code(rs.getInt(1));
			QnA.setQ_no(rs.getInt(2));
			QnA.setQ_writer(rs.getString(3));
			QnA.setQ_content(rs.getString(4));
			QnA.setQ_date(rs.getTimestamp(5));
			QnA.setQ_ref(rs.getInt(6));
			QnA.setQ_step(rs.getInt(7));
			QnA.setQ_level(rs.getInt(8));
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return QnA;
	}
	public int deleteQnA(int q_no,String q_writer,String login_id) throws Exception {
		//id�� pwd�� �޾� �����ϴ� �޼ҵ�
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "";
		int re= -1; // ���� ������ re
		
		try {
			con = getConnection();
			sql="select q_writer from QnA where q_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			rs = pstmt.executeQuery();
			System.out.println("DB::deleteQnA / q_no=" + q_no);
			if(rs.next()) {
				q_writer = rs.getString(1); 
				
				if (!login_id.equals(q_writer)) {//�����ʴ�
					re =0;
					
				}else {
					//���� �� �������� ����
					sql="delete QnA where q_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, q_no);
					
					pstmt.executeUpdate();
					re= 1;
				}
			}
			
		}catch( Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	public int editQnA(QnABean QnA,String login_id) {
		// QnA�� �޾Ƽ� �����ϴ� �޼ҵ�
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "";
		int re= -1; // ���� ������ re
		String writer ="";
		
		try {
			con = getConnection();
			sql="select q_writer from QnA where q_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, QnA.getQ_no());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				writer = rs.getString(1);
				if(login_id==null){ //��ȸ��
					re = 2;
				}else if(!writer.equals(login_id)) {
					re = 0; 
				}else {
					sql ="update QnA set q_content=? where q_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.toKorean(QnA.getQ_content()));
					pstmt.setInt(2, QnA.getQ_no());
					pstmt.executeUpdate();
					re=1; //���������� ������Ʈ���� ��,
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con!=null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
}
