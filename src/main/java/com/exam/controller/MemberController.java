package com.exam.controller;


import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.Member;
import com.exam.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	MemberService memberService;
	
	@Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("member", new Member());
        return "memberForm";
    }

    @PostMapping("/signup")
    public String registerMember(@Valid @ModelAttribute("Member") Member  Member,
                                 BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "memberForm";
        }

        try {
            Member registered = memberService.registerNewMember(Member);
            model.addAttribute("registeredMember", registered);
            return "redirect:/login";
        } catch (Exception e) {
            model.addAttribute("signupError", e.getMessage());
            return "memberForm";
        }
    }
}













