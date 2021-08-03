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
	public void signUp(MemberVO membervo) throws Exception{
		System.out.println("2");
		dao.signUp(membervo);
	}
}
