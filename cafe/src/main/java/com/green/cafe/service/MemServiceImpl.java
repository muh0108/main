package com.green.cafe.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.cafe.dao.MemDao;
import com.green.cafe.dto.MemDto;


@Service("MemService")
public class MemServiceImpl implements MemService{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int loginYn(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		MemDao dao = sqlSession.getMapper(MemDao.class);
		ArrayList<MemDto> dtos = dao.loginYn(param);
		
		int re = -1;
		if(!dtos.isEmpty()) {
			if (dtos.get(0).getMem_pw().equals(param.get("mem_pw"))) {
				re=1;
				System.out.println("로그인 성공!");
				
			} else {
				re=0;
				System.out.println("비밀번호 불일치 -> 입력값 : "+param.get("mem_pw"));
				System.out.println("입력해야할 비밀번호 : "+dtos.get(0).getMem_pw());
			}
		}else {
			 System.out.println("존재하지 않는 회원입니다.");
		}
		return re;
	}

	@Override
	public void register(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		MemDao dao = sqlSession.getMapper(MemDao.class);
		dao.register(param);
	}

	@Override
	public ArrayList<MemDto> memberView(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		MemDao dao = sqlSession.getMapper(MemDao.class);
		ArrayList<MemDto> dtos = dao.memberView(param);
		return dtos;
	}

	@Override
	public void updateInfo(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		MemDao dao = sqlSession.getMapper(MemDao.class);
		dao.updateInfo(param);
	}

	@Override
	public void checkInfo(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		
		MemDao dao = sqlSession.getMapper(MemDao.class);
		dao.checkInfo(param);
	}

	@Override
	public void deleteMember(HashMap<String, String> param) {
		// TODO Auto-generated method stub
		MemDao dao = sqlSession.getMapper(MemDao.class);
		dao.deleteMember(param);
	}
	
}
