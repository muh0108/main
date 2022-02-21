package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.MemberVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("memberDAO")
public class MemberDAO  extends EgovAbstractDAO{
	/**등록*/
	public String insertMember(MemberVO vo) throws Exception {
		return (String) insert("memberDAO.insertMember", vo);
	}
	/**로그인*/
	public MemberVO loginYn(String mem_uid) throws Exception{
		return (MemberVO) select("memberDAO.login",mem_uid);
	}
}