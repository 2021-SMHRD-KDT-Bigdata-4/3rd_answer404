package kr.co.summary.controller;

import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.summary.domain.MemberVO;
import kr.co.summary.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

//처리순서 컨트롤러 -> 서비스 -> DAO ->서비스 -> 컨트롤러
private static final org.slf4j.Logger logger =  LoggerFactory.getLogger(NewsController.class);

	
	@Inject
	MemberService memberservice;
	
	@RequestMapping(value = "/test")
	public void test(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
	
		Enumeration se = session.getAttributeNames();
	
		while (se.hasMoreElements()) {
	
		String getse = se.nextElement() + "";
	
		System.err.println("@@@@@@@ session : " + getse + " : " + session.getAttribute(getse));
	
		}

	}
	
	//get요청과 post요청이 분리되어있음
	@RequestMapping(value="/signUp" ,method = RequestMethod.GET)
	public String getsignUp() throws Exception{
		logger.info("get signUp");
		
		return "member/signUp";			
	}
	
	@RequestMapping(value = "/signUp",method = RequestMethod.POST)
	public String signUp(MemberVO memberVO) throws Exception{
		logger.info("post signUp");
		memberservice.signUp(memberVO);
		
		return "redirect:/news/list";
		//return null;
	}
	
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String memberLogin(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("Login");
		
		HttpSession session = req.getSession();
		MemberVO login = memberservice.memberLogin(memberVO);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/news/list";
		//return null;
	}
	
	@RequestMapping(value = "/logout")
	public String memberLogout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/news/list";
	}
	@RequestMapping("myPage")
	public String myPage() throws Exception{
		logger.info("myPage");
		
		return "member/myPage";			
	}

}
