package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.EmpService;
import egovframework.example.sample.service.EmpVO;

@Service("empService")
public class EmpServiceImpl implements EmpService{
	
	@Resource(name = "empDAO")
	private EmpDAO empDAO;
	
	/**등록*/
	@Override
	public String insertEmp(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return empDAO.insertEmp(vo);
	}

	/**목록*/
	@Override
	public List<?> selectEmpList(EmpVO vo) throws Exception {
		// TODO Auto-generated method stub
		return empDAO.selectEmpList(vo);
	}
	
	/**조회*/
	@Override
	public EmpVO selectEmpDetail(int empno) throws Exception {
		// TODO Auto-generated method stub
		return empDAO.selectEmpDetail(empno);
	}

	/**삭제 */
	@Override
	public int deleteEmp(int empno) throws Exception {
		return empDAO.deleteEmp(empno);
	}

	/**수정 */
	@Override
	public int updateEmp(EmpVO vo) {
		// TODO Auto-generated method stub
		return empDAO.updateEmp(vo);
	}
}