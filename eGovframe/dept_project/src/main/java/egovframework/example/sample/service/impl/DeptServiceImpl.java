package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Service("deptService")
public class DeptServiceImpl implements DeptService{
	
	@Resource(name = "deptDAO")
	private DeptDAO deptDAO;
	
	//등록
	@Override
	public String insertDept(DeptVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return deptDAO.insertDept(vo);
	}
	
	//목록
	@Override
	public List<?> selectDeptList(DeptVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return deptDAO.selectDeptList(vo);
	}
	
	//조회
	@Override
	public DeptVO selectDeptDetail(int deptno) throws Exception {
		// TODO Auto-generated method stub
		return deptDAO.selectDeptDetail(deptno);
	}
	
	//삭제
	@Override
	public int deleteDept(int deptno) throws Exception {
		// TODO Auto-generated method stub
		
		return deptDAO.deleteDept(deptno);
	}
	
	//수정
	@Override
	public int updateDept(DeptVO vo) {
		// TODO Auto-generated method stub
		return deptDAO.updateDept(vo);
	}
}
//21.11.26 