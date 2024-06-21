package com.exam.service;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.exam.dto.Member;
import com.exam.mapper.MemberMapper;

@Service
public class MemberServiceImpl 
           implements MemberService{

	MemberMapper memberMapper;
	  @Autowired
	    public MemberServiceImpl(MemberMapper memberMapper) {
	        this.memberMapper = memberMapper;
	   
	    }
	    @Override
	    public Member findByUsername(String userid) {
	        return memberMapper.findByUsername(userid);
	    }

	    @Override
	    public void saveMember(Member member) {
	        memberMapper.insertMember(member);
	    }

	    @Override
	    public Member registerNewMember(Member member) {
	        if (memberMapper.findByUsername(member.getUserid()) != null) {
	            throw new RuntimeException("Username already exists");
	        }

	        if (!member.getPassword().equals(member.getConfirmPassword())) {
	            throw new RuntimeException("Passwords do not match");
	        }
	        memberMapper.insertMember(member);
	        return member;
	        
	    }
		 @PostMapping("/signup")
		    public String registerMember(@Valid @ModelAttribute("Member") Member member,
		                                 BindingResult bindingResult, Model model) {
		        if (bindingResult.hasErrors()) {
		            return "memberForm";
		        }
		        try {
		            Member registered = memberMapper.registerNewMember(member);
		            model.addAttribute("registeredMember", registered);
		            return "redirect:/login";
		        } catch (Exception e) {
		            model.addAttribute("signupError", e.getMessage());
		            return "memberForm";
		        }
		    }
}
