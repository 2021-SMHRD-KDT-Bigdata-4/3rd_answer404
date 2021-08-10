package kr.co.summary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.summary.dao.MemberDAO;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.ScrapVO;

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
	
	@Override
	public List<ScrapVO> scrapShow(String member_id,int displayPost,int displayPostEnd) throws Exception{
		return dao.scrapShow(member_id,displayPost,displayPostEnd);
	}
	
	public int scrapCount() throws Exception{
		return dao.scrapCount();
	}
	
	public void scrapDelete(int scrap_index) throws Exception{
		dao.scrapDelete(scrap_index);
	}
	
}
