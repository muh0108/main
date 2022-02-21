package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class DeptController {
	@Resource(name = "deptService")
	private DeptService deptService;
	
	@RequestMapping(value = "deptWrite.do")
	public String addDept() {
		return "dept/deptWrite";
	}
	//Chrome >> http://localhost:9080/dept_project/deptWrite.do
	
	@RequestMapping(value = "/deptWriteSave.do")
	public String deptWriteSave(DeptVO vo) throws Exception {

		deptService.insertDept(vo);
		return "redirect:deptList.do";
	}
	@RequestMapping(value = "/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception {
		List<?> deptList = deptService.selectDeptList(vo);
		model.addAttribute("resultList", deptList);

		return "dept/deptList";
	}
	//Chrome >> http://localhost:9080/dept_project/deptList.do
	@RequestMapping(value = "/deptDetail.do")
	public String selectDeptDetail(int deptno, ModelMap model) throws Exception {
	//21.12.3 add.Detail
		DeptVO vo = deptService.selectDeptDetail(deptno);
		model.addAttribute("deptVO", vo);
		
		return "dept/deptDetail";
	}
	@RequestMapping("/deleteDept.do")
	public String deleteDept(int deptno) throws Exception {
	//21.12.6 add.delete
		int res = deptService.deleteDept(deptno);
		System.out.println("res = "+res);
		return "redirect:deptList.do";
	}
	
	@RequestMapping("/deptModify.do")
	public String deptModify(int deptno, Model model) throws Exception {
	//21.12.6 add.modify
		DeptVO vo = deptService.selectDeptDetail(deptno);
		model.addAttribute("deptVO",vo);
		return "dept/deptModify";
	}
	@RequestMapping("/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception {
		int res = deptService.updateDept(vo);
		System.out.println("res = "+res);
		return "redirect:deptList.do";
	}

}
//21.11.26 
// http://localhost:9080/dept_project/deptWrite.do
// http://localhost:9080/dept_project/deptList.do
