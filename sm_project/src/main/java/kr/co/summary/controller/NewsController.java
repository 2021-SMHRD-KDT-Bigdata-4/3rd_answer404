package kr.co.summary.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.summary.domain.DictionaryVO;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.PageMaker;
import kr.co.summary.domain.SearchCriteria;
import kr.co.summary.domain.StatisticsVO;
import kr.co.summary.service.NewsService;

@Controller
@RequestMapping("/news/*")
public class NewsController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(NewsController.class);

	@Inject
	NewsService service;

	// 게시판 글 작성 화면
	@RequestMapping(value = "/news/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("writeView");

	}

	// 뉴스게시판 목록 조회
	// NewsController로 들어와서 URL은 /list으로 정하고
	// 오라클 -> 다오 -> 서비스 -> 컨트롤러로 가져온 데이터들을 jsp에 뿌려주는 작업을 해야한다!
	// model은 데이터를 담을 그릇이고 addAttribute("list",service.list())는 service.list()에 담긴
	// 데이터를 "list"라는 이름으로 담을거다!
	// 라고생각하면된다
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		System.out.println("call");

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		// 통계용 최신 + 조회수 코드 올리기
		List<NewsVO> countStatisticslist = service.countStatistics();
		model.addAttribute("countStatisticslist", countStatisticslist);
		
		List<StatisticsVO> staticmaleUp = service.countStatisticmaleUp();
		List<StatisticsVO> staticmaleDown = service.countStatisticmaleDown();
		List<StatisticsVO> staticfemaleUp = service.countStatisticfemaleUp();
		List<StatisticsVO> staticfemaleDown = service.countStatisticfemaleDown();
		List<StatisticsVO> static20 = service.countStatistic20();
		List<StatisticsVO> static30 = service.countStatistic30();
		List<StatisticsVO> static40 = service.countStatistic40();
		List<StatisticsVO> static50 = service.countStatistic50();
		List<StatisticsVO> static60 = service.countStatistic60();
		List<StatisticsVO> statictotalUp = service.countStatistictotalUp();
		List<StatisticsVO> statictotalDown = service.countStatistictotalDown();
		
		model.addAttribute("staticmaleUp", staticmaleUp);
		model.addAttribute("staticmaleDown", staticmaleDown);
		model.addAttribute("staticfemaleUp", staticfemaleUp);
		model.addAttribute("staticfemaleDown", staticfemaleDown);
		model.addAttribute("static20", static20);
		model.addAttribute("static30", static30);
		model.addAttribute("static40", static40);
		model.addAttribute("static50", static50);
		model.addAttribute("static60", static60);
		model.addAttribute("statictotalUp", statictotalUp);
		model.addAttribute("statictotalDown", statictotalDown);
		

		return "news/list";

	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listAll(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");

		model.addAttribute("list", service.list(scri));
		System.out.println("이거슨서치인거시여!"+scri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "news/listAll";

	}
	

	@RequestMapping(value = "/searchDic", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public  @ResponseBody String searchDic(Model model, @ModelAttribute("dictionaryVO") DictionaryVO dictionaryVO) throws Exception {
		logger.info("searchDic");
		
		System.out.println(dictionaryVO);
		
		DictionaryVO SearchdictionaryVO = service.searchDic(dictionaryVO);
		String result = SearchdictionaryVO.getDictionary_object_mean();
		String result1 = URLEncoder.encode(result,"UTF-8");
		System.out.println(result);
		return result;
		
	}
	

	@RequestMapping(value = "/detailView", method = RequestMethod.GET)
	public String detail(NewsVO newsVO, Model model) throws Exception {
		logger.info("detail");
		
		service.plusCnt(newsVO.getNews_index());
		model.addAttribute("detail", service.detail(newsVO.getNews_index()));
		


		return "news/detailView";
	}
	
	 @RequestMapping(value = "/detailViewStatistics", method = RequestMethod.GET)
	   public String detailViewStatistics(NewsVO newsVO,String member_id, Model model) throws Exception {
	      logger.info("detail");
	      
	      service.plusCnt(newsVO.getNews_index());
	      NewsVO newsvo =service.detail(newsVO.getNews_index());
	      model.addAttribute("detail", newsvo);
	      
	      //-----------------------------------------------------------------------------
	      String keyword = newsvo.getNews_keyword();
	      System.out.println("뉴스VO에는이게담겨있음"+newsVO);
	      
	      MemberVO membervo = new MemberVO();
	      
	      membervo = service.detailViewStatistics(member_id); // 멤버 아이디로 age-range랑, gender를 가져와 준다.
	      String membervo_age_range= membervo.getMember_age_range();
	      String membervo_gender = membervo.getMember_gender();
	      
	      System.out.println("뉴스keyword->"+keyword);
	      String[] keywordSplit = keyword.split(".");
	      for(int i=0; i< keywordSplit.length; i++) {
	         service.StatisticsUpdate(membervo_age_range, membervo_gender, keywordSplit[i]);
	      }
	      
	      return "news/detailView";
	   }

	
	

// 큰 카테고리중 경제카테고리  detailViewStatistics
	// 페이지네이션을 적용
	// econo_category 로 경제 눌렀을때 open되게 바꿈.
	@RequestMapping(value = "/econo_category", method = RequestMethod.GET)
	public String econolist(String news_category, int pagingNum, Model model) throws Exception {
		logger.info("category");
		System.out.println("여기까지 요청처리 잘됨1    "+news_category+"    "+pagingNum);
		int count = service.categoryCount(news_category);
		
		model.addAttribute("count", count);// 전체 게시물의 수
		model.addAttribute("category", news_category);
		
		System.out.println("여기까지 요청처리 잘됨2"+news_category+"    "+pagingNum);
		
		int postNum = 9; //[한페이지당 보여줄 게시물 수] 
		int displayPost = (pagingNum -1) * postNum +1; //현제 페이지 첫번째 게시물 인덱스
		int displayPostEnd =  pagingNum * postNum; //현재 페이지 마지막 게시물 인덱스
		
		model.addAttribute("news_category", service.category(news_category,displayPost,displayPostEnd));
		
		int pageNum = (int)Math.ceil((double)count/postNum); //총 페이징 번호 갯수
		model.addAttribute("pageNum",pageNum);
		//------------------------------ 페이징 번호 구현 -------------------------------------
		
		int pageNum_cnt =10; // 한번에 표시할 페이징 번호 갯수
		
		int endPageNum = (int)(Math.ceil((double)pagingNum / (double)pageNum_cnt) * pageNum_cnt);
		
		System.out.println("------------------"+endPageNum+"------------------");
		// endPageNum 표시되는 페이징 마지막 수 ex)) 4페이지라면 10을
		int startPageNum =1;
		if(endPageNum>= pageNum_cnt) {
			startPageNum = endPageNum - (pageNum_cnt -1);
		}
		
		// startPageNum 표시되는 페이징 처음 수 ex)) 10까지 페이징이 표시된다면  1을
		
		
		// 마지막 번호 재계산 ex 이전까지는 12가 끝이여도 11~20까지 표시해줌
		//여기서 endPageNum처리를 끝내면 실제로 12값이 저장됨
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		if(endPageNum > endPageNum_tmp) {
			 endPageNum = endPageNum_tmp;
		}
		System.out.println("------------------"+count+"------------------");
		System.out.println("------------------"+pageNum_cnt+"------------------");
		System.out.println("------------------"+endPageNum_tmp+"------------------");
		System.out.println("------------------"+endPageNum+"------------------");
		
		// 이전 이후버튼 구현용 판별기
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);

		// 이전 및 다음 
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		// 현재 페이지
		model.addAttribute("select", pagingNum);
		
		System.out.println("pageNum   "+postNum);
		System.out.println("postNum   "+postNum);
		System.out.println("startPageNum   "+startPageNum);
		System.out.println("endPageNum   "+endPageNum);
		System.out.println("prev   "+prev);
		System.out.println("next   "+next);
		System.out.println("select   "+pagingNum);
		
		
		List<NewsVO> categoryStatistictitle = service.categoryStatistictitle(news_category);
		List<StatisticsVO> categoryStatisticUp= service.categoryStatisticUp(news_category);
		List<StatisticsVO> categoryStatisticDown= service.categoryStatisticDown(news_category);
		
		model.addAttribute("categoryStatistictitle", categoryStatistictitle);
		model.addAttribute("categoryStatisticUp", categoryStatisticUp);
		model.addAttribute("categoryStatisticDown", categoryStatisticDown);
		
		return "news/econo_category";

	}	
		
		// 사회 카테고리
		// 큰 카테고리중 경제카테고리  detailViewStatistics
			// 페이지네이션을 적용
			// econo_category 로 경제 눌렀을때 open되게 바꿈.
			@RequestMapping(value = "/society_category", method = RequestMethod.GET)
			public String socilist(String news_category, int pagingNum, Model model) throws Exception {
				logger.info("category");
				System.out.println("여기까지 요청처리 잘됨1    "+news_category+"    "+pagingNum);
				int count = service.categoryCount(news_category);
				
				model.addAttribute("count", count);// 전체 게시물의 수
				model.addAttribute("category", news_category);
				
				System.out.println("여기까지 요청처리 잘됨2"+news_category+"    "+pagingNum);
				
				int postNum = 9; //[한페이지당 보여줄 게시물 수] 
				int displayPost = (pagingNum -1) * postNum +1; //현제 페이지 첫번째 게시물 인덱스
				int displayPostEnd =  pagingNum * postNum; //현재 페이지 마지막 게시물 인덱스
				
				model.addAttribute("news_category", service.category(news_category,displayPost,displayPostEnd));
				
				int pageNum = (int)Math.ceil((double)count/postNum); //총 페이징 번호 갯수
				model.addAttribute("pageNum",pageNum);
				//------------------------------ 페이징 번호 구현 -------------------------------------
				
				int pageNum_cnt =10; // 한번에 표시할 페이징 번호 갯수
				
				int endPageNum = (int)(Math.ceil((double)pagingNum / (double)pageNum_cnt) * pageNum_cnt);
				
				System.out.println("------------------"+endPageNum+"------------------");
				// endPageNum 표시되는 페이징 마지막 수 ex)) 4페이지라면 10을
				int startPageNum =1;
				if(endPageNum>= pageNum_cnt) {
					startPageNum = endPageNum - (pageNum_cnt -1);
				}
				
				// startPageNum 표시되는 페이징 처음 수 ex)) 10까지 페이징이 표시된다면  1을
				
				
				// 마지막 번호 재계산 ex 이전까지는 12가 끝이여도 11~20까지 표시해줌
				//여기서 endPageNum처리를 끝내면 실제로 12값이 저장됨
				int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
				if(endPageNum > endPageNum_tmp) {
					 endPageNum = endPageNum_tmp;
				}
				System.out.println("------------------"+count+"------------------");
				System.out.println("------------------"+pageNum_cnt+"------------------");
				System.out.println("------------------"+endPageNum_tmp+"------------------");
				System.out.println("------------------"+endPageNum+"------------------");
				
				// 이전 이후버튼 구현용 판별기
				boolean prev = startPageNum == 1 ? false : true;
				boolean next = endPageNum * pageNum_cnt >= count ? false : true;
				
				// 시작 및 끝 번호
				model.addAttribute("startPageNum", startPageNum);
				model.addAttribute("endPageNum", endPageNum);

				// 이전 및 다음 
				model.addAttribute("prev", prev);
				model.addAttribute("next", next);
				
				// 현재 페이지
				model.addAttribute("select", pagingNum);
				
				System.out.println("pageNum   "+postNum);
				System.out.println("postNum   "+postNum);
				System.out.println("startPageNum   "+startPageNum);
				System.out.println("endPageNum   "+endPageNum);
				System.out.println("prev   "+prev);
				System.out.println("next   "+next);
				System.out.println("select   "+pagingNum);
				
				List<NewsVO> categoryStatistictitle = service.categoryStatistictitle(news_category);
				List<StatisticsVO> categoryStatisticUp= service.categoryStatisticUp(news_category);
				List<StatisticsVO> categoryStatisticDown= service.categoryStatisticDown(news_category);
				
				model.addAttribute("categoryStatistictitle", categoryStatistictitle);
				model.addAttribute("categoryStatisticUp", categoryStatisticUp);
				model.addAttribute("categoryStatisticDown", categoryStatisticDown);
				
				return "news/society_category";
			}
			

			// 정치 카테고리
			// 큰 카테고리중 경제카테고리  detailViewStatistics
				// 페이지네이션을 적용
				// econo_category 로 경제 눌렀을때 open되게 바꿈.
				@RequestMapping(value = "/politics_category", method = RequestMethod.GET)
				public String polilist(String news_category, int pagingNum, Model model) throws Exception {
					logger.info("category");
					System.out.println("여기까지 요청처리 잘됨1    "+news_category+"    "+pagingNum);
					int count = service.categoryCount(news_category);
					
					model.addAttribute("count", count);// 전체 게시물의 수
					model.addAttribute("category", news_category);
					
					System.out.println("여기까지 요청처리 잘됨2"+news_category+"    "+pagingNum);
					
					int postNum = 9; //[한페이지당 보여줄 게시물 수] 
					int displayPost = (pagingNum -1) * postNum +1; //현제 페이지 첫번째 게시물 인덱스
					int displayPostEnd =  pagingNum * postNum; //현재 페이지 마지막 게시물 인덱스
					
					model.addAttribute("news_category", service.category(news_category,displayPost,displayPostEnd));
					
					int pageNum = (int)Math.ceil((double)count/postNum); //총 페이징 번호 갯수
					model.addAttribute("pageNum",pageNum);
					//------------------------------ 페이징 번호 구현 -------------------------------------
					
					int pageNum_cnt =10; // 한번에 표시할 페이징 번호 갯수
					
					int endPageNum = (int)(Math.ceil((double)pagingNum / (double)pageNum_cnt) * pageNum_cnt);
					
					System.out.println("------------------"+endPageNum+"------------------");
					// endPageNum 표시되는 페이징 마지막 수 ex)) 4페이지라면 10을
					int startPageNum =1;
					if(endPageNum>= pageNum_cnt) {
						startPageNum = endPageNum - (pageNum_cnt -1);
					}
					
					// startPageNum 표시되는 페이징 처음 수 ex)) 10까지 페이징이 표시된다면  1을
					
					
					// 마지막 번호 재계산 ex 이전까지는 12가 끝이여도 11~20까지 표시해줌
					//여기서 endPageNum처리를 끝내면 실제로 12값이 저장됨
					int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
					if(endPageNum > endPageNum_tmp) {
						 endPageNum = endPageNum_tmp;
					}
					System.out.println("------------------"+count+"------------------");
					System.out.println("------------------"+pageNum_cnt+"------------------");
					System.out.println("------------------"+endPageNum_tmp+"------------------");
					System.out.println("------------------"+endPageNum+"------------------");
					
					// 이전 이후버튼 구현용 판별기
					boolean prev = startPageNum == 1 ? false : true;
					boolean next = endPageNum * pageNum_cnt >= count ? false : true;
					
					// 시작 및 끝 번호
					model.addAttribute("startPageNum", startPageNum);
					model.addAttribute("endPageNum", endPageNum);

					// 이전 및 다음 
					model.addAttribute("prev", prev);
					model.addAttribute("next", next);
					
					// 현재 페이지
					model.addAttribute("select", pagingNum);
					
					System.out.println("pageNum   "+postNum);
					System.out.println("postNum   "+postNum);
					System.out.println("startPageNum   "+startPageNum);
					System.out.println("endPageNum   "+endPageNum);
					System.out.println("prev   "+prev);
					System.out.println("next   "+next);
					System.out.println("select   "+pagingNum);
					
					List<NewsVO> categoryStatistictitle = service.categoryStatistictitle(news_category);
					List<StatisticsVO> categoryStatisticUp= service.categoryStatisticUp(news_category);
					List<StatisticsVO> categoryStatisticDown= service.categoryStatisticDown(news_category);
					
					model.addAttribute("categoryStatistictitle", categoryStatistictitle);
					model.addAttribute("categoryStatisticUp", categoryStatisticUp);
					model.addAttribute("categoryStatisticDown", categoryStatisticDown);
					
					return "news/politics_category";

				}
				
				// IT/과학 카테고리
				// 큰 카테고리중 경제카테고리  detailViewStatistics
					// 페이지네이션을 적용
					// econo_category 로 경제 눌렀을때 open되게 바꿈.
					@RequestMapping(value = "/itscience_category", method = RequestMethod.GET)
					public String itsciencelist(String news_category, int pagingNum, Model model) throws Exception {
						logger.info("category");
						System.out.println("여기까지 요청처리 잘됨1    "+news_category+"    "+pagingNum);
						int count = service.categoryCount(news_category);
						
						model.addAttribute("count", count);// 전체 게시물의 수
						model.addAttribute("category", news_category);
						
						System.out.println("여기까지 요청처리 잘됨2"+news_category+"    "+pagingNum);
						
						int postNum = 9; //[한페이지당 보여줄 게시물 수] 
						int displayPost = (pagingNum -1) * postNum +1; //현제 페이지 첫번째 게시물 인덱스
						int displayPostEnd =  pagingNum * postNum; //현재 페이지 마지막 게시물 인덱스
						
						model.addAttribute("news_category", service.category(news_category,displayPost,displayPostEnd));
						
						int pageNum = (int)Math.ceil((double)count/postNum); //총 페이징 번호 갯수
						model.addAttribute("pageNum",pageNum);
						//------------------------------ 페이징 번호 구현 -------------------------------------
						
						int pageNum_cnt =10; // 한번에 표시할 페이징 번호 갯수
						
						int endPageNum = (int)(Math.ceil((double)pagingNum / (double)pageNum_cnt) * pageNum_cnt);
						
						System.out.println("------------------"+endPageNum+"------------------");
						// endPageNum 표시되는 페이징 마지막 수 ex)) 4페이지라면 10을
						int startPageNum =1;
						if(endPageNum>= pageNum_cnt) {
							startPageNum = endPageNum - (pageNum_cnt -1);
						}
						
						// startPageNum 표시되는 페이징 처음 수 ex)) 10까지 페이징이 표시된다면  1을
						
						
						// 마지막 번호 재계산 ex 이전까지는 12가 끝이여도 11~20까지 표시해줌
						//여기서 endPageNum처리를 끝내면 실제로 12값이 저장됨
						int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
						if(endPageNum > endPageNum_tmp) {
							 endPageNum = endPageNum_tmp;
						}
						System.out.println("------------------"+count+"------------------");
						System.out.println("------------------"+pageNum_cnt+"------------------");
						System.out.println("------------------"+endPageNum_tmp+"------------------");
						System.out.println("------------------"+endPageNum+"------------------");
						
						// 이전 이후버튼 구현용 판별기
						boolean prev = startPageNum == 1 ? false : true;
						boolean next = endPageNum * pageNum_cnt >= count ? false : true;
						
						// 시작 및 끝 번호
						model.addAttribute("startPageNum", startPageNum);
						model.addAttribute("endPageNum", endPageNum);

						// 이전 및 다음 
						model.addAttribute("prev", prev);
						model.addAttribute("next", next);
						
						// 현재 페이지
						model.addAttribute("select", pagingNum);
						
						System.out.println("pageNum   "+postNum);
						System.out.println("postNum   "+postNum);
						System.out.println("startPageNum   "+startPageNum);
						System.out.println("endPageNum   "+endPageNum);
						System.out.println("prev   "+prev);
						System.out.println("next   "+next);
						System.out.println("select   "+pagingNum);
						
						List<NewsVO> categoryStatistictitle = service.categoryStatistictitle(news_category);
						List<StatisticsVO> categoryStatisticUp= service.categoryStatisticUp(news_category);
						List<StatisticsVO> categoryStatisticDown= service.categoryStatisticDown(news_category);
						
						model.addAttribute("categoryStatistictitle", categoryStatistictitle);
						model.addAttribute("categoryStatisticUp", categoryStatisticUp);
						model.addAttribute("categoryStatisticDown", categoryStatisticDown);
						
						return "news/itscience_category";

					}
}
