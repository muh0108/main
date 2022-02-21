package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.EmpVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("empDAO")
public class EmpDAO  extends EgovAbstractDAO{
	/**등록*/
	public String insertEmp(EmpVO vo) throws Exception {
		return (String) insert("empDAO.insertEmp", vo);
	}
	/**목록*/
	public List<?> selectEmpList(EmpVO vo) throws Exception{
		// TODO Auto-generated method stub
		return list("empDAO.selectEmpList", vo);
	}
	/**조회*/
	public EmpVO selectEmpDetail(int empno) throws Exception {
		//21.12.3 add.Detail
			return (EmpVO) select("empDAO.selectEmpDetail", empno);
	}
	/**삭제*/
	public int deleteEmp(int empno) throws Exception {
		return delete("empDAO.deleteEmp", empno);
	}
	/**수정*/
	public int updateEmp(EmpVO vo) {
		// TODO Auto-generated method stub
		return update("empDAO.updateEmp",vo);
	}
}