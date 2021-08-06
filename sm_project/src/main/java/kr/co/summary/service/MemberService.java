package kr.co.summary.service;

import org.springframework.stereotype.Service;

import kr.co.summary.domain.MemberVO;

@Service
public interface MemberService {
	
	//Controller가 구현하는 서비스 
	public void signUp(MemberVO memberVO) throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
	
}
