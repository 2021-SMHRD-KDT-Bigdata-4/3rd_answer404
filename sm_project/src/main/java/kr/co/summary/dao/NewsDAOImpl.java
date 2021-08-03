package kr.co.summary.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.summary.domain.Criteria;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.SearchCriteria;

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
	
	

}
