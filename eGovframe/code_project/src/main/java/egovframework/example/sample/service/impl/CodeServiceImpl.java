package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Service("codeService")
public class CodeServiceImpl implements CodeService{
	
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;

	@Override
	public String insertCode(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return codeDAO.insertCode(vo);
	}

	@Override
	public List<?> selectCodeList(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.selectCodeList(vo);
	}

	@Override
	public int selectCodeCount(CodeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.selectCodeCount(vo);
	}

	@Override
	public int codeDelete(int code) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.codeDelete(code);
	}
	
}