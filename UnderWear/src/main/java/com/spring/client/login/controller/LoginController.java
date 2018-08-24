package com.spring.client.login.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.login.service.LoginService;
import com.spring.client.login.vo.LoginVO;

@Controller
@SessionAttributes("login")
@RequestMapping("/login")
public class LoginController {
	Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;

	@ModelAttribute("login")
	public LoginVO login() {
		return new LoginVO();
	}

	/**************************************************************
	 * �α��� �� ó��
	 **************************************************************/
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		logger.info("login.do get ȣ�� ����");
		return "login/login";
	}

	/**************************************************************
	 * �α��� ó�� ���� : �α��� ���н� Ƚ�� ������ �������� ���� ó��
	 *************************************************************/
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav) {
		logger.info("login.do post ȣ�� ����");
		String userId = lvo.getC_id();
		String userPw = lvo.getC_pwd();
		LoginVO loginCheckResult = loginService.loginSelect(userId, userPw);
		// �Է¹��� ���̵�� ��й�ȣ�� DB Ȯ�� �� ��ġ �����Ͱ� �������� ������
		if (loginCheckResult == null) {
			mav.addObject("status", 1);
			mav.setViewName("login/login");
			return mav;
		} else { // ��ġ�ϸ�
			mav.addObject("login", loginCheckResult);
			mav.setViewName("login/login");
			return mav;
		}

	}

	/**************************************************************
	 * �α��� ó�� �޼��� ���� : �α��� ���н� ó�� ���� ����.
	 **************************************************************/
	/*
	 * @RequestMapping(value = "/login.do", method = RequestMethod.POST) public
	 * ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav,
	 * HttpServletRequest request) { logger.info("login.do post ȣ�� ����"); String
	 * userId = lvo.getC_id(); int resultData =
	 * loginService.loginHistoryInsert(lvo); // �켱 ���̵� �����ϴ��� ���� Ȯ�� �۾� ����(1: �������� ����
	 * ��) if (resultData == 1) { mav.addObject("status", 1);
	 * mav.setViewName("login/login"); return mav; } else { LoginVO vo =
	 * loginService.loginHistorySelect(userId); logger.info("�ֱ� �α��� �Ͻ� : " + new
	 * SimpleDateFormat("YYYY-MMdd").format(vo.getLastSuccessedLogin()));
	 * logger.info("retry(�α��� �õ� Ƚ��): " + vo.getRetry()); // �α��� �õ�Ƚ���� 5ȸ�� ������ 30�ʰ�
	 * �α��� ��� if (vo.getRetry() >= 5) { if (new Date().getTime() -
	 * vo.getLastFailedLogin() < 30000) { mav.addObject("status", 6); // 30�ʵ��� �α������
	 * �˸� mav.setViewName("login/login"); return mav; } else { vo.setRetry(0);
	 * vo.setLastFailedLogin(0); loginService.loginHistoryUpdate(vo); } } LoginVO
	 * loginCheckResult = loginService.loginSelect(lvo.getC_id(), lvo.getC_pwd());
	 * // �α����� Ʋ����, �α��� �õ�Ƚ���� 1���� ��Ű��, �α��� ���� �ð��� DB�� ������Ʈ �Ѵ�. if (loginCheckResult
	 * == null) { vo.setRetry(vo.getRetry() + 1); vo.setLastFailedLogin(new
	 * Date().getTime()); loginService.loginHistoryUpdate(vo);
	 * mav.addObject("retry", vo.getRetry()); mav.addObject("status", 1);
	 * mav.setViewName("login/login"); return mav; } // �α����� �����ϸ�, �α��� �õ�Ƚ���� 0��
	 * reset, ���������� �α��� ���� �ð� 0���� reset, // ������ Ŭ���̾�Ʈ IP�� DB�� ������Ʈ,�α��� �����ð� DB�� ������Ʈ
	 * else { vo.setRetry(0); vo.setLastFailedLogin(0); vo.setLastSuccessedLogin(new
	 * Date().getTime()); vo.setClientIp(request.getRemoteAddr());
	 * loginService.loginHistoryUpdate(vo); // session.setAttribute("login",
	 * loginCheckResult); mav.addObject("login", loginCheckResult);
	 * mav.setViewName("login/login"); return mav; } } }*/

	 /************************************************************** 
	 * �α׾ƿ� ó�� �޼���
	 **************************************************************/
	@RequestMapping("/logout.do")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/";
	}
}