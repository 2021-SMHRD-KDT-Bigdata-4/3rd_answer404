package kr.co.summary.service;

import org.springframework.stereotype.Service;

import kr.co.summary.domain.MemberVO;

@Service
public interface MemberService {
	
	//회원 가입
	public void signUp(MemberVO memberVO) throws Exception;
	
}
