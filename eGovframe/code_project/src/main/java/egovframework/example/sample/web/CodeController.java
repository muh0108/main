package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Controller
public class CodeController {
	@Resource(name = "codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "codeWrite.do")
	public String codeWrite() {
		return "code/codeWrite";
	}
	//Chrome >> http://localhost:9080/code_project/codeWrite.do
	
	@RequestMapping(value = "/codeWriteSave.do")
	public String codeWriteSave(CodeVO vo) throws Exception {
		//insert : 이상이 없으면 null값
		//update, delete : 갯수(return값을 int로 받음)
		String res = codeService.insertCode(vo);
		if(res == null) {
			System.out.println("저장완료");
		}else {
			System.out.println("저장실패");
		}
		return "redirect:codeList.do";
	}
	@RequestMapping(value = "/codeList.do")
	public String selectCodeList(CodeVO vo, ModelMap model) throws Exception {
		int total = codeService.selectCodeCount(vo);
		List<?> codeList = codeService.selectCodeList(vo);
		model.addAttribute("resultList", codeList);
		model.addAttribute("resultTotal", total);

		return "code/codeList";
	}
	//Chrome >> http://localhost:9080/code_project/codeList.do
	//codeDelete.do
	@RequestMapping(value = "/codeDelete.do")
	public String codeDelete(int code) throws Exception{
		int res = codeService.codeDelete(code);
		System.out.println("res : "+res);
		return "redirect:codeList.do";
	}
}
//21.11.26 
//Chrome >> http://localhost:9080/code_project/codeWrite.do
