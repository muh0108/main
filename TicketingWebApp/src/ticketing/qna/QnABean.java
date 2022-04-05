package ticketing.qna;

import java.sql.Timestamp;

public class QnABean {
	private int p_code;
	private int q_no; //������ȣ
	private String q_writer; //������
	private String q_content; //��������
	private Timestamp q_date; //��������
	private int q_ref; 		//�� �׷�
	private int q_step=0;   //�� ��ġ
	private int q_level=0;	//�亯����
	public static int pageSize = 10; //���������� 10���� �����ֱ� ���� ����
	public static int pageCount = 1; //������ ���� ī��Ʈ , ������(�÷�)�� ���� ���� �þ
	public static int pageNum = 1; 	 //������ ��ȣ
	
	public static String pageNumber(int limit,int p_code) {
		//������ ��ϵ��� ����� �ִ� �޼ҵ�
		String str = "";
		int temp = (pageNum -1) % limit; 
		int startPage = pageNum - temp; 
		
		if((startPage-limit) > 0) { 
			str = "<a href='qna_main.jsp?p_code="+p_code+"&pageNum="+(startPage-1)+"'>[����]</a>&nbsp;&nbsp;";
		}
		for(int i= startPage; i<(startPage+limit); i++) { 
			if(i == pageNum) {
				str+="<b>["+i+"]</b>&nbsp;&nbsp;";
			}else {
				str+="<a href='qna_main.jsp?p_code="+p_code+"&pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;"; 
			}
			if(i>=pageCount) { 
				break;
			}
		}
			if((startPage + limit) <= pageCount) {
				str += "<a href ='qna_main.jsp?p_code="+p_code+"&pageNum="+(startPage+limit)+"'>[����]</a>";
			}
		return str;
	}
	public int getP_code() {
		return p_code;
	}

	public void setP_code(int p_code) {
		this.p_code = p_code;
	}
	
	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public Timestamp getQ_date() {
		return q_date;
	}

	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}

	public int getQ_ref() {
		return q_ref;
	}

	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}

	public int getQ_step() {
		return q_step;
	}

	public void setQ_step(int q_step) {
		this.q_step = q_step;
	}

	public int getQ_level() {
		return q_level;
	}

	public void setQ_level(int q_level) {
		this.q_level = q_level;
	}

	
	
	
}
