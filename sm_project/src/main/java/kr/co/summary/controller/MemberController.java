package kr.co.summary.controller;

import java.util.Enumeration;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.summary.domain.ChartVO;
import kr.co.summary.domain.MemberVO;
import kr.co.summary.domain.NewsVO;
import kr.co.summary.domain.ScrapVO;
import kr.co.summary.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

//처리순서 컨트롤러 -> 서비스 -> DAO ->서비스 -> 컨트롤러
private static final org.slf4j.Logger logger =  LoggerFactory.getLogger(NewsController.class);

	
	@Inject
	MemberService memberservice;
	
	//-------------------- MemberTest로 호출보내면 세션에 뭐들어있는지 보임---------------
	@RequestMapping(value = "/test")
	public void test(HttpServletRequest request) throws Exception {
		logger.info("session check");
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
	
	@RequestMapping(value="/login" ,method = RequestMethod.GET)
	public String login() throws Exception{
		logger.info("get signUp");
		
		return "member/login";			
	}
	
	@RequestMapping(value="/loginSuccess" ,method = RequestMethod.GET)
	public String loginSuccess() throws Exception{
		logger.info("loginSuccess");
		
		return "member/loginSuccess";			
	}
	
	//마이페이지 구현 list1이라 안쓸거같음
		@RequestMapping("myPage")
		public String myPage() throws Exception{
			logger.info("myPage");
			
			return "member/myPage";			
		}
	
	//---------------------------위쪽은 페이지 전환용 아래는 서비스 추가--------------------------------------
	//요거슨회원가입
	@RequestMapping(value = "/signUp",method = RequestMethod.POST)
	public String signUp(MemberVO memberVO) throws Exception{
		logger.info("post signUp");
		memberservice.signUp(memberVO);
		
		return "redirect:/member/login";
		//return null;
	}
	//로그인 처리
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String memberLogin(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("Login");
		
		HttpSession session = req.getSession();
		MemberVO login = memberservice.memberLogin(memberVO);
		
		String msg = "msg";
		
		
		if(login == null) {
			//로그인 실패처리 
			session.setAttribute("member", null);
			session.setAttribute("msg", msg);	
		}else {
			//로그인 성공처리
			session.setAttribute("msg", null);
			session.setAttribute("member", login);
		}
		
		return "redirect:/member/loginSuccess";
		//return null;
	}
	//로그아웃 구현
	@RequestMapping(value = "/logout")
	public String memberLogout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/news/list";
	}
	
	@RequestMapping("scrapDelete")
	public String scrapDelete(String member_id,int scrap_index) throws Exception{
		logger.info("scrapDelete");
		memberservice.scrapDelete(scrap_index);
		
		return "redirect:/member/scrap?member_id="+member_id+"&&pagingNum="+1;
	}
	
	@RequestMapping("scrapMemoUpdate")	
	public String scrapMemoUpdate(ScrapVO scrapvo) throws Exception{
		logger.info("scrapMemoUpdate");
		System.out.println(scrapvo);
		
		memberservice.scrapMemoUpdate(scrapvo);
		
		return "redirect:/member/scrap?member_id="+scrapvo.getMember_id()+"&&pagingNum="+1;
	}
	
	//상세페이지에서 스크랩버튼 눌렀을때 insert 
	@RequestMapping("scrapInsert")	
	public String scrapInsert(ScrapVO scrapvo) throws Exception{
		logger.info("scrapInsert");
				//System.out.println(newsvo.getNews_title());
				System.out.println("---------------------");
				System.out.println(scrapvo);				
				System.out.println("scrapinsert");
				memberservice.scrapInsert(scrapvo);
		return "redirect:/member/scrap?member_id="+scrapvo.getMember_id()+"&&pagingNum="+1;
	}
	
	//스크랩햇던것들을 전부 보여주기 +페이징
	@RequestMapping("scrap")
	public String scrap(Model model, String member_id, @RequestParam("pagingNum") int pagingNum) throws Exception{
		
		logger.info("scrap");
		// @RequestParam 으로 받아온 paingNum은 현재 보여줄 페이지번호에 해당
		//게시물수 카운트
		
	
		
		int count = memberservice.scrapCount();
		model.addAttribute("count", count);
		
		int postNum = 6; //[한페이지 게시물 수] 
		int displayPost = (pagingNum -1) * postNum +1; //0부터 시작  1 => 
		int displayPostEnd =  pagingNum * postNum; //6으로 끝남
		// 컨트롤러 -> 서비스 -> DAO ->Mapper ->DAO ->서비스 -> 컨트롤러
		
		List<ScrapVO> list = memberservice.scrapShow(member_id,displayPost,displayPostEnd);
		
		model.addAttribute("list", list); // 객체바인딩->ModelAndView->Model(*)
		
		int pageNum = (int)Math.ceil((double)count/postNum); //전체게시물수/페이징할 수-페이징표시 번호수
		model.addAttribute("pageNum",pageNum);
		//------------------------------ 페이징 번호 구현 -------------------------------------
		
		int pageNum_cnt =10; // 한번에 표시할 페이징 번호 갯수
		int endPageNum = (int)(Math.ceil((double)pagingNum / (double)pageNum_cnt) * pageNum_cnt);
		System.out.println("------------------"+endPageNum+"------------------");
		// endPageNum 표시되는 페이징 마지막 수 ex)) 4페이지라면 10을
		int startPageNum =1;
		if(endPageNum>=10) {
			startPageNum = endPageNum - (pageNum_cnt -1);
		}
		System.out.println(startPageNum);
		// startPageNum 표시되는 페이징 처음 수 ex)) 10까지 페이징이 표시된다면  1을
		
		
		// 마지막 번호 재계산 ex 이전까지는 12가 끝이여도 11~20까지 표시해줌
		//여기서 endPageNum처리를 끝내면 실제로 12값이 저장됨
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		if(endPageNum > endPageNum_tmp) {
			 endPageNum = endPageNum_tmp;
		}
		
		
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
		
		return "member/scrap";	
		
		
	}
	
	//-------------------------- 차트 구현  리턴 안적으면 자기알아서 요청이름.jsp로 간다
	@RequestMapping("showChart")	
	public void showChart(Model model) throws Exception{
		//1개만 테스트
		List<ChartVO> corechartlistFM = memberservice.showChartFM();
		List<ChartVO> corechartlistM = memberservice.showChartM();
		System.out.println(corechartlistFM);
		System.out.println(corechartlistM);
		model.addAttribute("corechartlistFM", corechartlistFM);
		model.addAttribute("corechartlistM", corechartlistM);
	}

}
