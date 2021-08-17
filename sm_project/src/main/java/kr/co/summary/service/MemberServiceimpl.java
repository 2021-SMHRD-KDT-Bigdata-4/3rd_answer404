package kr.co.summary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.summary.dao.MemberDAO;
import kr.co.summary.domain.ChartVO;
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

	@Override
	public void scrapInsert(ScrapVO scrapvo) throws Exception {
		dao.scrapInsert(scrapvo);
		
	}
	public void scrapMemoUpdate(ScrapVO scrapvo) throws Exception{
		dao.scrapMemoUpdate(scrapvo);
	}
	public List<ChartVO> showChartFM() throws Exception{
		return dao.showChartFM();
	}
	public List<ChartVO> showChartM() throws Exception{
		return dao.showChartM();
	}
	public List<ChartVO> chartMain() throws Exception{
		return dao.chartMain();
	}
	
	public List<ChartVO> chartkeyword20(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		return dao.chartkeyword20(Keyword1, Keyword2, Keyword3, Keyword4, Keyword5);
	}
	public List<ChartVO> chartkeyword30(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		return dao.chartkeyword30(Keyword1, Keyword2, Keyword3, Keyword4, Keyword5);
	}
	public List<ChartVO> chartkeyword40(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		return dao.chartkeyword40(Keyword1, Keyword2, Keyword3, Keyword4, Keyword5);
	}
	public List<ChartVO> chartkeyword50(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		return dao.chartkeyword50(Keyword1, Keyword2, Keyword3, Keyword4, Keyword5);
	}
	public List<ChartVO> chartkeyword60(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		return dao.chartkeyword60(Keyword1, Keyword2, Keyword3, Keyword4, Keyword5);
	}
}
