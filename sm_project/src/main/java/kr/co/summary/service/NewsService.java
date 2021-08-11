package kr.co.summary.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.summary.domain.Criteria;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.SearchCriteria;

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
	public List<NewsVO> categorie(String news_categorie,int displayPost,int displayPostEnd) throws Exception;
	
	// 조회수 +1
	public int plusCnt(int news_index) throws Exception;


	public int categorieCount(String news_categorie) throws Exception;
	
		
	
	
}
