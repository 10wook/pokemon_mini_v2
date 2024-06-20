package com.exam.service;

import com.exam.dto.Member;

public interface MemberService {

	public int save(Member mem);
	public Member findById(String userid);
}
