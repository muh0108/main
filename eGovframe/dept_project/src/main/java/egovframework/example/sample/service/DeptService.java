package egovframework.example.sample.service;

import java.util.List;

public interface DeptService {
	/**등록*/
	public String insertDept(DeptVO vo) throws Exception;
	/**목록*/
	public List<?> selectDeptList(DeptVO vo) throws Exception;
	/**조회*/
	public DeptVO selectDeptDetail(int deptno) throws Exception;
	/**삭제 */
	public int deleteDept(int deptno) throws Exception;
	/**수정 */
	public int updateDept(DeptVO vo);
}
//21.11.26 