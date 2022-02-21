package egovframework.example.sample.service;

public interface MemberService {
	/**등록*/
	public String insertMember(MemberVO vo) throws Exception;
	public MemberVO loginYn(String mem_uid) throws Exception;
	
}