package com.green.cafe.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.cafe.dto.MemDto;
import com.green.cafe.service.MemService;


@Controller
@RequestMapping("/member")
public class MemController {
	
	@Autowired
	private MemService service;
	
	@RequestMapping("/login") //로그인폼
	public String login() {
		System.out.println("@@@### LOGIN()");
		
		return "member/login";
	}
	
	@RequestMapping("/loginYn") //로그인 처리 -> MemServiceImpl.java
	public String loginYn(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### loginYN()");
		
		int re = service.loginYn(param);
		
		if(re==1) {
			ArrayList<MemDto> dtos = service.memberView(param);
			model.addAttribute("memberView",dtos);
			return "member/login_ok";
		}
		return "redirect:login";
	}
	
	@RequestMapping("/register") //회원가입
	public String register() {
		System.out.println("@@@### register");
		
		return "member/register";
	}
	
	@RequestMapping("/registerOk") //테이블 insert -> MemServiceImpl.java
	public String registerOk(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### registerOk");
		service.register(param);
		
		System.out.println("회원등록완료->로그인 페이지로 이동됩니다.");
		return "redirect:login";
	}
	
	@RequestMapping("/updateInfo") //회원정보 수정 폼
	public String updateInfo(@RequestParam HashMap<String, String> param,Model model) {
		System.out.println("@@@### updateInfo");
		ArrayList<MemDto> dtos = service.memberView(param); 
		model.addAttribute("memberView",dtos);//회원아이디로 전체 정보를 조회하기 위해 넘김
		return "member/updateInfo";
	}
	
	@RequestMapping("/updateInfoOk") //회원정보 수정 처리 update -> MemServiceImpl.java
	public String updateInfoOk(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### updateInfoOk");
		service.updateInfo(param);
		
		System.out.println("회원정보 수정완료");
		ArrayList<MemDto> dtos = service.memberView(param);
		model.addAttribute("memberView",dtos);
		return "member/login_ok";//정보 수정 후 login_ok로 가
	}
	
	@RequestMapping("/checkInfo") //회원정보 조회 
	public String checkInfo(@RequestParam HashMap<String, String> param,Model model) {
		System.out.println("@@@### checkInfo");
		ArrayList<MemDto> dtos = service.memberView(param);
		model.addAttribute("memberView",dtos);//회원아이디로 전체 정보를 조회하기 위해 넘김
		return "member/checkInfo";
	}
	
	@RequestMapping("/deleteMember") //회원탈퇴
	public String deleteMember(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### deleteMember");
		service.deleteMember(param);
		
		System.out.println("회원탈퇴완료");
		return "redirect:login";
	}
	
}
