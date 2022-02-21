package egovframework.example.sample.service;

import java.util.List;

public interface EmpService {
	/**등록*/
	public String insertEmp(EmpVO vo) throws Exception;
	/**목록*/
	public List<?> selectEmpList(EmpVO vo) throws Exception;
	/**조회*/
	public EmpVO selectEmpDetail(int empno) throws Exception;
	/**삭제 */
	public int deleteEmp(int empno) throws Exception;
	/**수정 */
	public int updateEmp(EmpVO vo);
}