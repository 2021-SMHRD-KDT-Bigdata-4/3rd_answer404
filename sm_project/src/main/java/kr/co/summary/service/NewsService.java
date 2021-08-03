package kr.co.summary.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.summary.domain.Criteria;
import kr.co.summary.domain.NewsVO;

//NewsDAO와 연결되는 NewsService를작성
@Service
public interface NewsService {

	// 뉴스작성
	public void newswrite(NewsVO newsVO) throws Exception;
	
	
	// 뉴스 목록 조회
	public List<NewsVO> list(Criteria cri) throws Exception;
	
	// 뉴스 상세보기
	public NewsVO detail(int news_index) throws Exception;
	
	
	// 뉴스 총 갯수
	public int listCount() throws Exception;
}
