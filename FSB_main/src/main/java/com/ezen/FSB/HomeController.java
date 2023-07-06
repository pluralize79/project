package com.ezen.FSB;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "user/user_main";
	}

	// 사용자 메인
	@RequestMapping("user_main.do")
	public ModelAndView user_main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("user/user_main");
		
		// ** 로그인 오류
		// 아이디가 틀리고 비밀번호가 맞으면 null 500 오류
		
		return mav;
	}

	// 관리자 메인
	@RequestMapping("admin_main.do")
	public String admin_main() {
		return "admin/admin_main";
	}
	
}

