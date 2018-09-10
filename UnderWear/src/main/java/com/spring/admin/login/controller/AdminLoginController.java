package com.spring.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.admin.login.service.AdminLoginService;
import com.spring.admin.login.vo.AdminLoginVO;
import com.spring.client.login.service.LoginService;
import com.spring.client.login.vo.LoginVO;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	Logger logger = Logger.getLogger(AdminLoginController.class);
	@Autowired
	private AdminLoginService adminloginService;

	/*@ModelAttribute("login")
	public LoginVO login() {
		return new LoginVO();
	}*/

	/**************************************************************
	 * 로그인 폼 처리
	 **************************************************************/
	@RequestMapping(value = "/login/adminlogin.do", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("adminlogin.do get 호출 성공");
		return "admin/login/adminlogin";
	}

	/**************************************************************
	 * 로그인 처리 참고 : 로그인 실패시 횟수 제한을 제어하지 않은 처리
	 *************************************************************/
	@RequestMapping(value = "/login/adminlogin.do", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute AdminLoginVO lvo, ModelAndView mav, HttpSession session) {
		logger.info("adminlogin.do post 호출 성공");
		logger.info(lvo.getUserId());
		logger.info(lvo.getUserPw());
		String userId = lvo.getUserId();
		String userPw = lvo.getUserPw();
		AdminLoginVO loginCheckResult = adminloginService.loginSelect(userId, userPw);
		// 입력받은 아이디와 비밀번호로 DB 확인 시 일치 데이터가 존재하지 않으면
		if (loginCheckResult == null) {
			mav.addObject("status", 1);
			mav.setViewName("admin/login/adminlogin");
			return mav;
		} else { // 일치하면
			session.setAttribute("adminlogin",loginCheckResult);
			/*mav.addObject("login", loginCheckResult);*/
			mav.setViewName("admin/login/adminlogin");
			return mav;
		}

	}

	/**************************************************************
	 * 로그인 처리 메서드 참고 : 로그인 실패시 처리 내용 포함.
	 **************************************************************/
	/*
	 * @RequestMapping(value = "/login.do", method = RequestMethod.POST) public
	 * ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav,
	 * HttpServletRequest request) { logger.info("login.do post 호출 성공"); String
	 * userId = lvo.getC_id(); int resultData =
	 * loginService.loginHistoryInsert(lvo); // 우선 아이디가 존재하는지 먼저 확인 작업 진행(1: 존재하지 않을
	 * 때) if (resultData == 1) { mav.addObject("status", 1);
	 * mav.setViewName("login/login"); return mav; } else { LoginVO vo =
	 * loginService.loginHistorySelect(userId); logger.info("최근 로그인 일시 : " + new
	 * SimpleDateFormat("YYYY-MMdd").format(vo.getLastSuccessedLogin()));
	 * logger.info("retry(로그인 시도 횟수): " + vo.getRetry()); // 로그인 시도횟수가 5회가 넘으면 30초간
	 * 로그인 잠금 if (vo.getRetry() >= 5) { if (new Date().getTime() -
	 * vo.getLastFailedLogin() < 30000) { mav.addObject("status", 6); // 30초동안 로그인잠금
	 * 알림 mav.setViewName("login/login"); return mav; } else { vo.setRetry(0);
	 * vo.setLastFailedLogin(0); loginService.loginHistoryUpdate(vo); } } LoginVO
	 * loginCheckResult = loginService.loginSelect(lvo.getC_id(), lvo.getC_pwd());
	 * // 로그인이 틀리면, 로그인 시도횟수를 1증가 시키고, 로그인 실패 시간을 DB에 업데이트 한다. if (loginCheckResult
	 * == null) { vo.setRetry(vo.getRetry() + 1); vo.setLastFailedLogin(new
	 * Date().getTime()); loginService.loginHistoryUpdate(vo);
	 * mav.addObject("retry", vo.getRetry()); mav.addObject("status", 1);
	 * mav.setViewName("login/login"); return mav; } // 로그인이 성공하면, 로그인 시도횟수를 0로
	 * reset, 마지막으로 로그인 실패 시간 0으로 reset, // 성공한 클라이언트 IP를 DB에 업데이트,로그인 성공시간 DB에 업데이트
	 * else { vo.setRetry(0); vo.setLastFailedLogin(0); vo.setLastSuccessedLogin(new
	 * Date().getTime()); vo.setClientIp(request.getRemoteAddr());
	 * loginService.loginHistoryUpdate(vo); // session.setAttribute("login",
	 * loginCheckResult); mav.addObject("login", loginCheckResult);
	 * mav.setViewName("login/login"); return mav; } } }*/

	 /************************************************************** 
	 * 로그아웃 처리 메서드
	 **************************************************************/
	@RequestMapping("/adminlogout.do")
	public String logout(/*SessionStatus sessionStatus*/HttpSession session, HttpServletRequest request) {
		/*sessionStatus.setComplete();*/
		session.invalidate(); //세션값 반납
		session = request.getSession(true);
		return "redirect:/";
	}
}
