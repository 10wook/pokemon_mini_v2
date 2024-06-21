package com.exam.service;

import javax.validation.Valid;

import com.exam.dto.Member;

public interface MemberService {

	Member findByUsername(String userid);
    void saveMember(Member member);
	Member registerNewMember(@Valid Member member);
}
