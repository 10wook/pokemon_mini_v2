package com.exam.service;

import org.springframework.stereotype.Service;

import com.exam.dto.Member;
import com.exam.mapper.MemberMapper;

@Service
public class MemberServiceImpl 
           implements MemberService{

	MemberMapper memberMapper;
	
	public MemberServiceImpl(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}


	@Override
	public int save(Member mem) {
		return memberMapper.save(mem);
	}


	@Override
	public Member findById(String userid) {
		return memberMapper.findById(userid);
	}

}
