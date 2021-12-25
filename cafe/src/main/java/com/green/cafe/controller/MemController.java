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
	
	@RequestMapping("/login") //�α�����
	public String login() {
		System.out.println("@@@### LOGIN()");
		
		return "member/login";
	}
	
	@RequestMapping("/loginYn") //�α��� ó�� -> MemServiceImpl.java
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
	
	@RequestMapping("/register") //ȸ������
	public String register() {
		System.out.println("@@@### register");
		
		return "member/register";
	}
	
	@RequestMapping("/registerOk") //���̺� insert -> MemServiceImpl.java
	public String registerOk(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### registerOk");
		service.register(param);
		
		System.out.println("ȸ����ϿϷ�->�α��� �������� �̵��˴ϴ�.");
		return "redirect:login";
	}
	
	@RequestMapping("/updateInfo") //ȸ������ ���� ��
	public String updateInfo(@RequestParam HashMap<String, String> param,Model model) {
		System.out.println("@@@### updateInfo");
		ArrayList<MemDto> dtos = service.memberView(param); 
		model.addAttribute("memberView",dtos);//ȸ�����̵�� ��ü ������ ��ȸ�ϱ� ���� �ѱ�
		return "member/updateInfo";
	}
	
	@RequestMapping("/updateInfoOk") //ȸ������ ���� ó�� update -> MemServiceImpl.java
	public String updateInfoOk(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### updateInfoOk");
		service.updateInfo(param);
		
		System.out.println("ȸ������ �����Ϸ�");
		ArrayList<MemDto> dtos = service.memberView(param);
		model.addAttribute("memberView",dtos);
		return "member/login_ok";//���� ���� �� login_ok�� ��
	}
	
	@RequestMapping("/checkInfo") //ȸ������ ��ȸ 
	public String checkInfo(@RequestParam HashMap<String, String> param,Model model) {
		System.out.println("@@@### checkInfo");
		ArrayList<MemDto> dtos = service.memberView(param);
		model.addAttribute("memberView",dtos);//ȸ�����̵�� ��ü ������ ��ȸ�ϱ� ���� �ѱ�
		return "member/checkInfo";
	}
	
	@RequestMapping("/deleteMember") //ȸ��Ż��
	public String deleteMember(@RequestParam HashMap<String, String> param, Model model) {
		System.out.println("@@@### deleteMember");
		service.deleteMember(param);
		
		System.out.println("ȸ��Ż��Ϸ�");
		return "redirect:login";
	}
	
}
