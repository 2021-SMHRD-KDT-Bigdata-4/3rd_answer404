package kr.co.summary.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.summary.domain.DictionaryVO;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.SearchCriteria;
import kr.co.summary.domain.StatisticsVO;

@Repository
public class NewsDAOImpl implements NewsDAO{
	
	@Inject
	private SqlSession sqlSession;

	// 뉴스작성
	public void newswrite(NewsVO newsVO) throws Exception {

		sqlSession.insert("newsMapper.insert",newsVO);
		
	}
	// 뉴스 상세보기
	@Override
	public NewsVO detail(int news_index) throws Exception {
		
		return sqlSession.selectOne("newsMapper.detail",news_index);
	}
	
	// 카테고리별 뉴스
	public List<NewsVO> category(String news_category,int displayPost,int displayPostEnd) throws Exception{
			HashMap data = new HashMap();
			data.put("news_category", news_category);
			data.put("displayPost", displayPost);
			data.put("displayPostEnd", displayPostEnd);
		
			return sqlSession.selectList("newsMapper.category",data);
		}
	
	// 뉴스 목록 조회
	// 구현부인 NewsDAOImpl에서는 인터페이스 newsDAO에 정의된 멤버들을 클래스 대신 구현해야한다.
	// return sqlSession.selectList("newsMapper.list"); 이것은 newsMapper.xml 에서 mapper의 namespace가 newsMapper이고
	// 그중에 id가 list인것을 가져와라 라고 생각하면된다.
	@Override
	public List<NewsVO> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("newsMapper.listpage",scri);

	}
	// 뉴스 총 개수

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectOne("newsMapper.listCount",scri);
	}
	
	@Override
	public int plusCnt(int news_index) throws Exception {
		
		return sqlSession.update("newsMapper.plusCnt",news_index);
	}
	
	@Override
	public int categoryCount(String news_category) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("newsMapper.categoryCount",news_category);
	}
	
	public MemberVO detailViewStatistics(String member_id) throws Exception{
		return sqlSession.selectOne("newsMapper.detailViewStatistics",member_id);
	}


	public void StatisticsUpdate(String membervo_age_range,String membervo_gender,String news_keyword) throws Exception{
		
		HashMap data = new HashMap();
		data.put("membervo_age_range", membervo_age_range);
		data.put("membervo_gender", membervo_gender);
		data.put("news_keyword", news_keyword);
		
		sqlSession.insert("newsMapper.StatisticsUpdate",data);
		
	}
	
	// 카테고리 ajax 
	@Override
	public List<NewsVO> selectCategory(String news_category) throws Exception {
		return sqlSession.selectList("newsMapper.selectCategory",news_category);
	}	

	public List<NewsVO> countStatistics() throws Exception{
		return sqlSession.selectList("newsMapper.countStatistics");
	}
	@Override
	public DictionaryVO searchDic(DictionaryVO dictionaryVO) throws Exception{
		return sqlSession.selectOne("newsMapper.searchDic", dictionaryVO);
	}
	
	public List<StatisticsVO> countStatisticmaleUp() throws Exception{
		return sqlSession.selectList("newsMapper.countStatisticmaleUp");
	}
	public List<StatisticsVO> countStatisticmaleDown() throws Exception {
		return sqlSession.selectList("newsMapper.countStatisticmaleDown");
	}
	public List<StatisticsVO> countStatisticfemaleUp() throws Exception{
		return sqlSession.selectList("newsMapper.countStatisticfemaleUp");
	}
	public List<StatisticsVO> countStatisticfemaleDown() throws Exception {
		return sqlSession.selectList("newsMapper.countStatisticfemaleDown");
	}
	public List<StatisticsVO> countStatistic20() throws Exception {
		return sqlSession.selectList("newsMapper.countStatistic20");
	}
	public List<StatisticsVO> countStatistic30() throws Exception {
		return sqlSession.selectList("newsMapper.countStatistic30");
	}
	public List<StatisticsVO> countStatistic40() throws Exception {
		return sqlSession.selectList("newsMapper.countStatistic40");
	}
	public List<StatisticsVO> countStatistic50() throws Exception {
		return sqlSession.selectList("newsMapper.countStatistic50");
	}
	public List<StatisticsVO> countStatistic60() throws Exception {
		return sqlSession.selectList("newsMapper.countStatistic60");
	}
	public List<StatisticsVO> countStatistictotalUp() throws Exception {
		return sqlSession.selectList("newsMapper.countStatistictotalUp");
	}
	public List<StatisticsVO> countStatistictotalDown() throws Exception {
		return sqlSession.selectList("newsMapper.countStatistictotalDown");
	}
	@Override
	public List<NewsVO> categoryStatistictitle(String news_category) throws Exception {
		return sqlSession.selectList("newsMapper.categoryStatistictitle",news_category);
	}
	@Override
	public List<StatisticsVO> categoryStatisticUp(String news_category) throws Exception {
		return sqlSession.selectList("newsMapper.categoryStatisticUp",news_category);
	}
	@Override
	public List<StatisticsVO> categoryStatisticDown(String news_category) throws Exception {
		return sqlSession.selectList("newsMapper.categoryStatisticDown",news_category);
	}
	

}
