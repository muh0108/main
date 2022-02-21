package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.EmpService;
import egovframework.example.sample.service.EmpVO;

@Controller
public class EmpController {
	@Resource(name = "empService")
	private EmpService empService;
	
	@RequestMapping(value = "empWrite.do")
	public String addEmp() {
		return "emp/empWrite";
	}
	@RequestMapping(value = "/empWriteSave.do")
	public String empWriteSave(EmpVO vo)
			throws Exception {

		empService.insertEmp(vo);
		return "redirect:empList.do";
	}
	//Chrome >> http://localhost:9080/emp_project/empWrite.do
	
	@RequestMapping(value = "/empList.do")
	public String selectEmpList(EmpVO vo, ModelMap model) throws Exception {
		List<?> empList = empService.selectEmpList(vo);
		model.addAttribute("resultList", empList);
		
		return "emp/empList";
	}
	//Chrome >> http://localhost:9080/emp_project/empList.do
	
	@RequestMapping(value = "/empDetail.do")
	public String selectEmpDetail(int empno, ModelMap model) throws Exception {
		EmpVO vo = empService.selectEmpDetail(empno);
		model.addAttribute("empVO", vo);
		
		return "emp/empDetail";
	}
	@RequestMapping("/deleteEmp.do")
	public String deleteEmp(int empno) throws Exception {
		int res = empService.deleteEmp(empno);
		System.out.println("res = "+res);
		return "redirect:empList.do";
	}
	
		@RequestMapping("/empModify.do")
	public String empModify(int empno, Model model) throws Exception {
		EmpVO vo = empService.selectEmpDetail(empno);
		model.addAttribute("empVO",vo);
		return "emp/empModify";
	}
	@RequestMapping("/empModifySave.do")
	public String updateEmp(EmpVO vo) throws Exception {
		int res = empService.updateEmp(vo);
		System.out.println("res = "+res);
		return "redirect:empList.do";
	}
}
// http://localhost:9080/emp_project/empWrite.do
// http://localhost:9080/emp_project/empList.do
