package com.green.cafe.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.green.cafe.dto.MemDto;


public interface MemDao {
	public ArrayList<MemDto> loginYn(HashMap<String, String> param);
	public ArrayList<MemDto> memberView(HashMap<String, String> param);
	public void register(HashMap<String, String> param);
	public void updateInfo(HashMap<String, String> param);
	public void checkInfo(HashMap<String, String> param);
	public void deleteMember(HashMap<String, String> param);
}
