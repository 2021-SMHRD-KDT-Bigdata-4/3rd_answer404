package kr.co.summary.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.summary.domain.ChartVO;
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
	
	public void scrapMemoUpdate(ScrapVO scrapvo) throws Exception;
	
	public List<ChartVO> chartMain() throws Exception;
	public List<ChartVO> showChartFM() throws Exception;
	public List<ChartVO> showChartM() throws Exception;
	public List<ChartVO> chartkeyword20(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception;
	public List<ChartVO> chartkeyword30(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception;
	public List<ChartVO> chartkeyword40(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception;
	public List<ChartVO> chartkeyword50(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception;
	public List<ChartVO> chartkeyword60(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception;
}
