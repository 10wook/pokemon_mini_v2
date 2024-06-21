package com.exam.service;

import java.util.Map;

import javax.validation.Valid;

import com.exam.dto.Member;

public interface MemberService {
	Member findByUserIdAndPassword(String userid, String password);
	Member findByUsername(String userid);
    int saveMember(Member member);
	Member registerNewMember(@Valid Member member);
}
