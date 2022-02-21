package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("deptDAO")
public class DeptDAO  extends EgovAbstractDAO{
	/**등록*/
	public String insertDept(DeptVO vo) throws Exception {
		return (String) insert("deptDAO.insertDept", vo);
	}
	/**목록*/
	public List<?> selectDeptList(DeptVO vo) throws Exception{
		// TODO Auto-generated method stub
		return list("deptDAO.selectDeptList", vo);
	}
	/**조회*/
	public DeptVO selectDeptDetail(int deptno) throws Exception {
	//21.12.3 add.Detail
		return (DeptVO) select("deptDAO.selectDeptDetail", deptno);
	}
	/**삭제 */
	public int deleteDept(int deptno) throws Exception {
		return delete("deptDAO.deleteDept", deptno);
	}
	/**수정*/
	public int updateDept(DeptVO vo) {
		// TODO Auto-generated method stub
		return update("deptDAO.updateDept",vo);
	}
}
//21.11.26 