package egovframework.example.sample.service;

import java.sql.Timestamp;

public class EmpVO {
//21.11.29 
//21.12.3 add.(job, mgr, hiredate, sal, comm)
	/**사원번호*/
	private int empno;
	
	/**사원이름*/
	private String ename;
	
	/**직업*/
	private String job;
	
	/**매니저*/
	private int mgr;
	
	/**입사일*/
	private Timestamp hiredate;
	
	/**급여*/
	private int sal;

	/**커미션*/
	private int comm;
	
	/**부서번호*/
	private int deptno;
	
	
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	public Timestamp getHiredate() {
		return hiredate;
	}

	public void setHiredate(Timestamp hiredate) {
		this.hiredate = hiredate;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getComm() {
		return comm;
	}

	public void setComm(int comm) {
		this.comm = comm;
	}


	public int getEmpno() {
		return empno;
	}

	public void setEmpno(int empno) {
		this.empno = empno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	
	
}
