package kr.co.summary.dao;

import java.util.List;

import kr.co.summary.domain.Criteria;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.SearchCriteria;

public interface NewsDAO {

	// 뉴스작성
	public void newswrite(NewsVO newsVO) throws Exception;
	
	// 뉴스 목록조회
	// newsMapper와 연결되는 코드
	public List<NewsVO> list(SearchCriteria scri) throws Exception;
	
	// 뉴스 상세보기
	public NewsVO detail(int news_index) throws Exception;
	
	// 카테고리 뉴스보기
	public List<NewsVO> categorie(String news_categorie,int displayPost,int displayPostEnd) throws Exception;
	
	// 뉴스 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;

	public int plusCnt(int news_index) throws Exception;

	public int categorieCount(String news_categorie) throws Exception;
	
	public MemberVO detailViewStatistics(String member_id) throws Exception;
	
	public void StatisticsUpdate(String membervo_age_range,String membervo_gender,String news_keyword) throws Exception;

	
}
