package kr.co.summary.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.co.summary.dao.NewsDAOImpl;
import kr.co.summary.domain.NewsVO;



public class NewsAjaxController implements Controller {

	
	@RequestMapping(value="/news/ajaxlist")
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewsDAOImpl dao = new NewsDAOImpl();
		List<NewsVO> list = dao.newsAjaxList();

		String select = request.getParameter("select");
		System.out.println("호출" + select);

		if (select.equals("1")) {

		} else if (select.equals("2")) {

		} else if (select.equals("3")) {

		} else if (select.equals("4")) {

		}

		// 검색되어 오는 값을 json묶어
		Gson g = new Gson();
		String json = g.toJson(select);

		PrintWriter out = response.getWriter();
		out.print(json);

		return null;
	}

}
