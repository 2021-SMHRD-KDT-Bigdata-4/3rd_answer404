package kr.co.summary.dao;

import kr.co.summary.domain.MemberVO;

public interface MemberDAO{
	
	// 저장 구현
	public void signUp(MemberVO memberVO) throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
}
