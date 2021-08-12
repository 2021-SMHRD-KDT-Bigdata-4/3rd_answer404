package kr.co.summary.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.summary.dao.NewsDAO;
import kr.co.summary.domain.Criteria;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.SearchCriteria;


// 구현부인 NewsServiceImpl를 작성
@Service
public class NewsServiceImpl implements NewsService{

	@Inject
	private NewsDAO dao;

	@Override
	public void newswrite(NewsVO newsVO) throws Exception {
		dao.newswrite(newsVO);
	}
	
	// 카테고리별 뉴스
	public List<NewsVO> categorie(String news_categorie,int displayPost,int displayPostEnd) throws Exception{
			return dao.categorie(news_categorie,displayPost,displayPostEnd);
		}
	
	// 뉴스 상세보기
	@Override
	public NewsVO detail(int news_index) throws Exception {
		return dao.detail(news_index);
	}

	//  여기서dao.list(); 는 dao에있는 list()함수를 호출해서 반환하겠다는 것
	// 뉴스 목록 조회
	@Override
	public List<NewsVO> list(SearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}
	// 뉴스 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}

	
	@Override
	public int plusCnt(int news_index) throws Exception {
		
		return dao.plusCnt(news_index);
	}

	@Override
	public int categorieCount(String news_categorie) throws Exception {
		return dao.categorieCount(news_categorie);
	}
	
	public MemberVO detailViewStatistics(String member_id) throws Exception{		
		return dao.detailViewStatistics(member_id);
	}
	
	public void StatisticsUpdate(String membervo_age_range,String membervo_gender,String news_keyword) throws Exception{
		dao.StatisticsUpdate(membervo_age_range,membervo_gender,news_keyword);
	}
	
}
