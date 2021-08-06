package kr.co.summary.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.summary.dao.MemberDAO;
import kr.co.summary.domain.MemberVO;

@Service
public class MemberServiceimpl implements MemberService{
	
	@Inject
	private MemberDAO dao;
	
	@Override
	public void signUp(MemberVO memberVO) throws Exception{
		dao.signUp(memberVO);
	}
	
	@Override
	public MemberVO memberLogin(MemberVO memberVO) throws Exception {
		return dao.memberLogin(memberVO);
	}
}
