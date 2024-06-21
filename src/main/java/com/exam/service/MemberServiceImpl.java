package com.exam.service;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.exam.dto.Member;
import com.exam.mapper.MemberMapper;
import com.exam.service.MemberService;
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
	    public int saveMember(Member member) {
	      return memberMapper.insertMember(member);
	    }

	    @Override
	    public Member registerNewMember(Member member) {
	        if (memberMapper.findByUsername(member.getUserid()) != null) {
	            throw new RuntimeException("Username already exists");
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
		 
		 @Override
		    public Member findByUserIdAndPassword(String userid, String password) {
		        Map<String, String> params = new HashMap<>();
		        params.put("userid", userid);
		        params.put("password", password);
		        return memberMapper.findByUserIdAndPassword(params);
		    }
}
