package egovframework.example.sample.service;

import java.util.List;

public interface CodeService {
	/**등록*/
	public String insertCode(CodeVO vo) throws Exception;
	/**목록*/
	public List<?> selectCodeList(CodeVO vo) throws Exception;
	/**카운트*/
	public int selectCodeCount(CodeVO vo) throws Exception;
	
	public int codeDelete(int code) throws Exception;
	
}