package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;
	
	//등록
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return memberDAO.insertMember(vo);
	}

	@Override
	public MemberVO loginYn(String mem_uid) throws Exception {
		
		return memberDAO.loginYn(mem_uid);
	}

}