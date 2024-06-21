package com.exam.mapper;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.Member;

@Mapper
public interface MemberMapper {

	Member findByUsername(String userid);
	void insertMember(Member member);
	Member registerNewMember(@Valid Member member);
}
