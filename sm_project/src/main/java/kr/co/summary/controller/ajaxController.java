package kr.co.summary.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.summary.domain.NewsVO;
import kr.co.summary.service.NewsService;

/**
 * Servlet implementation class ajaxController
 */
@Controller
@RequestMapping("/ajax/*")
public class ajaxController {
	
	@Inject
	NewsService service;
	
	@RequestMapping(value = "/test")
	public @ResponseBody List<NewsVO> boardListAjax(String data) throws Exception {
		
		System.out.println(data);
		String news_category = data;		
		List<NewsVO> list = service.selectCategory(news_category);	
		System.out.println(list.get(0).getNews_company());
		
		return list;
	}

}
