package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO")
public class CodeDAO  extends EgovAbstractDAO{
	/**등록*/
	public String insertCode(CodeVO vo) throws Exception {
		return (String) insert("codeDAO.insertCode", vo);
	}
	/**목록*/
	public List<?> selectCodeList(CodeVO vo) throws Exception{

		return list("codeDAO.selectCodeList", vo);
	}
	public int selectCodeCount(CodeVO vo) throws Exception{
		// TODO Auto-generated method stub
		return (int) select("codeDAO.selectCodeCount", vo);
	}
	public int codeDelete(int code) throws Exception{
		// TODO Auto-generated method stub
		return delete("codeDAO.codeDelete",code);
	}
}