package kr.co.summary.controller;

import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.PageMaker;
import kr.co.summary.domain.SearchCriteria;
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

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "news/list";

	}

	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listAll(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");

		model.addAttribute("list", service.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "news/listAll";

	}

	@RequestMapping(value = "/detailView", method = RequestMethod.GET)
	public String detail(NewsVO newsVO, Model model) throws Exception {
		logger.info("detail");
		model.addAttribute("detail", service.detail(newsVO.getNews_index()));

		service.plusCnt(newsVO.getNews_index());

		return "news/detailView";
	}

// 큰 카테고리중 경제카테고리 
	// 페이지네이션을 적용
	// econo_category 로 경제 눌렀을때 open되게 바꿈.
	@RequestMapping(value = "/econo_category", method = RequestMethod.GET)
	public String econolist(NewsVO newsVO, Model model) throws Exception {
		logger.info("categorie");
		model.addAttribute("categorie", service.categorie(newsVO.getNews_categorie()));

		return "news/econo_category";

	}
}
