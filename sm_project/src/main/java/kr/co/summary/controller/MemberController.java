package kr.co.summary.controller;

import javax.inject.Inject;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.summary.domain.MemberVO;
import kr.co.summary.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

private static final org.slf4j.Logger logger =  LoggerFactory.getLogger(NewsController.class);
	
	@Inject
	MemberService memberservice;
	
	@RequestMapping(value="/signUp" ,method = RequestMethod.GET)
	public String getsignUp() throws Exception{
		logger.info("get signUp");
		
		return "member/signUp";			
	}
	
	@RequestMapping(value = "/signUp",method = RequestMethod.POST)
	public String signUp(MemberVO membervo) throws Exception{
		logger.info("post signUp");
		memberservice.signUp(membervo);
		
		//return "news/list";
		return null;
	}

}
