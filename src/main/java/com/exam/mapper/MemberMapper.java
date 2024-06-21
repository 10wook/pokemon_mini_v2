package com.exam.mapper;

import java.util.Map;

import javax.validation.Valid;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.Member;

@Mapper
public interface MemberMapper {
	 Member findByUserIdAndPassword(Map<String, String> params);
	Member findByUsername(String userid);
	int insertMember(Member member);
	Member registerNewMember(@Valid Member member);
}
