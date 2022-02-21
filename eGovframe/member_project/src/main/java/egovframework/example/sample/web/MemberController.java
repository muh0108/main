package egovframework.example.sample.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.MemberService;
import egovframework.example.sample.service.MemberVO;

@Controller
public class MemberController {
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping(value = "login.do")
	public String login() {
		return "member/login";
	}
	//Chrome >> http://localhost:9080/member_project/login.do
	
	@RequestMapping(value = "/register.do")
	public String register() throws Exception {

		return "member/register";
	}
	
	@RequestMapping(value = "/registerOk.do")
	public String registerOk(MemberVO vo) throws Exception {

		memberService.insertMember(vo);
		return "member/login";
	}
	
	
	@RequestMapping(value = "/loginYn.do")
	public String loginYn(String mem_uid,String mem_pwd, ModelMap model) throws Exception {
		MemberVO vo = memberService.loginYn(mem_uid);
		model.addAttribute("memberVO",vo);
		
		if(vo.getMem_pwd().equals(mem_pwd)) {
			return "member/login_ok";
		}
		return "redirect:login";
	}

}
//http://localhost:9080/member_project/login.do