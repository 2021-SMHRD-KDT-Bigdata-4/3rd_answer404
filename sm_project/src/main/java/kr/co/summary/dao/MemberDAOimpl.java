package kr.co.summary.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.summary.domain.ChartVO;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.ScrapVO;

@Repository
public class MemberDAOimpl implements MemberDAO {
	
	@Inject //디비를 넘나들 sqlsession 가져오기
	private SqlSession sqlSession;
	
	//memberDAO 인터페이스를 구현해놓은 memberDAOimpl
	@Override
	public void signUp(MemberVO memberVO) throws Exception{
		//insert 문을 사용하여 데이터베이스에 새로운 회원 등록
		sqlSession.insert("memberMapper.memberInsert", memberVO);
	}
	
	@Override
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		//한명의 회원을 로그인 세션으로 올리기 위한 selectOne
		return sqlSession.selectOne("memberMapper.memberLogin", memberVO);
	}
	
	@Override
	public List<ScrapVO> scrapShow(String member_id,int displayPost,int displayPostEnd){
		HashMap data = new HashMap();
		data.put("member_id", member_id);
		data.put("displayPost", displayPost);
		data.put("displayPostEnd", displayPostEnd);
		/*
		 * System.out.println(data.get("member_id"));
		 * System.out.println(data.get("displayPost"));
		 * System.out.println(data.get("displayPostEnd"));
		 */
		return sqlSession.selectList("memberMapper.scrapShow", data);
	}
	
	public int scrapCount() throws Exception{
		return sqlSession.selectOne("memberMapper.scrapCount");
	}
	
	public void scrapDelete(int scrap_index) throws Exception{
		sqlSession.delete("memberMapper.scrapDelete",scrap_index);
	}

	@Override
	public void scrapInsert(ScrapVO scrapvo) throws Exception {
		sqlSession.insert("memberMapper.scrapInsert",scrapvo);
		
	}
	public void scrapMemoUpdate(ScrapVO scrapvo) throws Exception{

		sqlSession.update("memberMapper.scrapMemoUpdate",scrapvo);
	}
	public List<ChartVO> showChartFM() throws Exception{
		return sqlSession.selectList("memberMapper.showChartFM");
	}
	public List<ChartVO> showChartM() throws Exception{
		return sqlSession.selectList("memberMapper.showChartM");
	}
	public List<ChartVO> chartMain() throws Exception{
		return sqlSession.selectList("memberMapper.chartMain");
	}
	
	public List<ChartVO> chartkeyword20(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		HashMap data = new HashMap();
		data.put("Keyword1", Keyword1);
		data.put("Keyword2", Keyword2);
		data.put("Keyword3", Keyword3);
		data.put("Keyword4", Keyword4);
		data.put("Keyword5", Keyword5);
		return sqlSession.selectList("memberMapper.chartkeyword20",data);
	}
	public List<ChartVO> chartkeyword30(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		HashMap data = new HashMap();
		data.put("Keyword1", Keyword1);
		data.put("Keyword2", Keyword2);
		data.put("Keyword3", Keyword3);
		data.put("Keyword4", Keyword4);
		data.put("Keyword5", Keyword5);
		return sqlSession.selectList("memberMapper.chartkeyword30",data);
	}
	public List<ChartVO> chartkeyword40(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		HashMap data = new HashMap();
		data.put("Keyword1", Keyword1);
		data.put("Keyword2", Keyword2);
		data.put("Keyword3", Keyword3);
		data.put("Keyword4", Keyword4);
		data.put("Keyword5", Keyword5);
		return sqlSession.selectList("memberMapper.chartkeyword40",data);
	}
	public List<ChartVO> chartkeyword50(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		HashMap data = new HashMap();
		data.put("Keyword1", Keyword1);
		data.put("Keyword2", Keyword2);
		data.put("Keyword3", Keyword3);
		data.put("Keyword4", Keyword4);
		data.put("Keyword5", Keyword5);
		return sqlSession.selectList("memberMapper.chartkeyword50",data);
	}
	public List<ChartVO> chartkeyword60(String Keyword1,String Keyword2,String Keyword3,String Keyword4,String Keyword5) throws Exception{
		HashMap data = new HashMap();
		data.put("Keyword1", Keyword1);
		data.put("Keyword2", Keyword2);
		data.put("Keyword3", Keyword3);
		data.put("Keyword4", Keyword4);
		data.put("Keyword5", Keyword5);
		return sqlSession.selectList("memberMapper.chartkeyword60",data);
	}
}
