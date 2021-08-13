package kr.co.summary.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.ScrapVO;

@Service
public interface MemberService {
	
	//Controller가 구현하는 서비스 
	public void signUp(MemberVO memberVO) throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception;
	
	public List<ScrapVO> scrapShow(String member_id,int displayPost,int displayPostEnd) throws Exception;
	
	public int scrapCount() throws Exception;
	
	public void scrapDelete(int scrap_index) throws Exception;

	public void scrapInsert(ScrapVO scrapvo) throws Exception;
}
