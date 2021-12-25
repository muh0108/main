package com.green.cafe.dto;

import java.sql.Timestamp;

public class MemDto {
	String mem_id;
	String mem_pw;
	String mem_name;
	String mem_tel;
	String mem_email;
	Timestamp mem_regdate;
	int mem_level;
	
	
	
	
	public MemDto() {}

	public MemDto(String mem_id, String mem_pw, String mem_name,String mem_tel,
				  String mem_email,Timestamp mem_regdate, int mem_level) {
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_tel=mem_tel;
		this.mem_email=mem_email;
		this.mem_regdate=mem_regdate;
		this.mem_level=mem_level;
	}
	
	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public Timestamp getMem_regdate() {
		return mem_regdate;
	}

	public void setMem_regdate(Timestamp mem_regdate) {
		this.mem_regdate = mem_regdate;
	}

	public int getMem_level() {
		return mem_level;
	}

	public void setMem_level(int mem_level) {
		this.mem_level = mem_level;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pwd(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
}
