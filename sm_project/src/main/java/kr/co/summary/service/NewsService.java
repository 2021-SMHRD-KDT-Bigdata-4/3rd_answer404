package kr.co.summary.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.summary.domain.Criteria;
import kr.co.summary.domain.DictionaryVO;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.SearchCriteria;
import kr.co.summary.domain.StatisticsVO;

//NewsDAO와 연결되는 NewsService를작성
@Service
public interface NewsService {

	// 뉴스작성
	public void newswrite(NewsVO newsVO) throws Exception;
	
	
	// 뉴스 목록 조회
	public List<NewsVO> list(SearchCriteria scri) throws Exception;
	
	// 뉴스 상세보기
	public NewsVO detail(int news_index) throws Exception;
	
	
	// 뉴스 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 카테고리별 뉴스
	public List<NewsVO> category(String news_category,int displayPost,int displayPostEnd) throws Exception;
	
	// 조회수 +1
	public int plusCnt(int news_index) throws Exception;


	public int categoryCount(String news_category) throws Exception;
	
	public MemberVO detailViewStatistics(String member_id) throws Exception;	
	
	public void StatisticsUpdate(String membervo_age_range,String membervo_gender,String news_keyword) throws Exception;
	
	public List<NewsVO> selectCategory(String news_category) throws Exception;
	
	public List<NewsVO> countStatistics() throws Exception;

	public DictionaryVO searchDic(DictionaryVO dictionaryVO) throws Exception;
	
	public List<StatisticsVO> countStatisticmaleUp() throws Exception;
	public List<StatisticsVO> countStatisticmaleDown() throws Exception;
	public List<StatisticsVO> countStatisticfemaleUp() throws Exception;
	public List<StatisticsVO> countStatisticfemaleDown() throws Exception;
	public List<StatisticsVO> countStatistic20() throws Exception;
	public List<StatisticsVO> countStatistic30() throws Exception;
	public List<StatisticsVO> countStatistic40() throws Exception;
	public List<StatisticsVO> countStatistic50() throws Exception;
	public List<StatisticsVO> countStatistic60() throws Exception;
	public List<StatisticsVO> countStatistictotalUp() throws Exception;
	public List<StatisticsVO> countStatistictotalDown() throws Exception;


	public List<NewsVO> categoryStatistictitle(String news_category) throws Exception;

	public List<StatisticsVO> categoryStatisticUp(String news_category) throws Exception;

	public List<StatisticsVO> categoryStatisticDown(String news_category) throws Exception;
	
	
}
