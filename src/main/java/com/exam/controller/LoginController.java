package com.exam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.Member;
import com.exam.service.MemberService;

@Controller
public class LoginController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	MemberService memberService;

	 public LoginController(MemberService memberService) {
	        this.memberService = memberService;
	    }

	@GetMapping(value={"/login"})
	public String showLoginPage() {
		return "loginForm";
	}
	@PostMapping(value={"/login_fail"})
	public String showlogin_failPage() {
		logger.info("logger:showlogin_failPage");
		return "redirect:login";
	}
	
	@GetMapping(value={"/login_success"})
	public String showlogin_successPage() {
		logger.info("logger:showlogin_successPage");
		return "redirect:home";
	}

	@PostMapping("/auth")
    public String processLogin(@RequestParam("userid") String userid,
                               @RequestParam("password") String password,
                               Model model) {
        Member member = memberService.findByUserIdAndPassword(userid, password);
        if (member != null) {
            // 로그인 성공 처리
            model.addAttribute("userid", userid);
            return "redirect:/home"; // 로그인 성공 시 홈 페이지로 리다이렉트
        } else {
            // 로그인 실패 처리
            model.addAttribute("error", "Invalid credentials");
            return "loginForm"; // 다시 로그인 폼으로
        }
    }
}