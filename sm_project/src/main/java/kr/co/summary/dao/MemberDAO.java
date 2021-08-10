package kr.co.summary.dao;

import java.util.List;

import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.ScrapVO;

public interface MemberDAO{
	
	// 저장 구현
	public void signUp(MemberVO memberVO) throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
	
	public List<ScrapVO> scrapShow(String member_id,int displayPost,int displayPostEnd) throws Exception;
	
	public int scrapCount() throws Exception;
	
	public void scrapDelete(int scrap_index) throws Exception;
}
