package com.ezen.FSB;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.service.LoginMapper;
import com.fasterxml.jackson.databind.JsonNode;

import net.nurigo.java_sdk.api.Message;

@Controller
public class LoginController {

	@Autowired
	private LoginMapper loginMapper;

	@Autowired
	private JavaMailSender mailSender;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

/**
 * Simply selects the home view to render by returning its name.
 */


	@RequestMapping("/login.do") //로그인 인덱스로 이동
	public String login(HttpSession session, HttpServletRequest req) {
	
	//========================카카오url보내기========
	String kakaoUrl = KakaoController.getAuthorizationUrl(session);
	req.setAttribute("kakao_url", kakaoUrl);
	
	// 네이버 URL 보내기
	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	System.out.println("네이버:" + naverAuthUrl);
	req.setAttribute("naver_url", naverAuthUrl);
		
	return "login/login";
	}
	
	@RequestMapping("/login_ok.do") //로그인시!
	public ModelAndView login_ok(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView("message");
		
		//일반 로그인
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		String saveId = req.getParameter("saveId");
		
		String dbPass = loginMapper.loginMember(id);
		String loginAct = null;
		
		if (dbPass.equals(passwd)) {
			loginAct = "ok"; //데이터베이스 패스워드 = 입력한 패스워드
		}else {
			loginAct = "wrongPw"; //데이터베이스 패스워드 != 입력패스워드
		}
	
		List<MemberDTO> id_exist = loginMapper.idMember(id); //없는 아이디 일 때
		if (id_exist==null) {
			loginAct = "wrongId";
		}
		
		String msg = null, url = null;
		
		switch(loginAct) {
		case "ok" :
			Cookie ck = new Cookie("saveId", id);
			if (saveId != null){
				ck.setMaxAge(24*60*60);
			}else {
				ck.setMaxAge(0);
			}
			resp.addCookie(ck);
			
			MemberDTO login_mem = loginMapper.findMember(id); //멤버 dto에서 그 아이디를 가진 사람 꺼내오기!
			
			HttpSession session = req.getSession();
			session.setAttribute("member", login_mem); // 다원 디티오 통째 추가 
			session.setAttribute("login_mem", login_mem);
			session.setAttribute("mem_num", login_mem.getMem_num()); // 다도미 추가
	         session.setAttribute("mem_nickname", login_mem.getMem_nickname()); // 다도미 추가
			session.setAttribute("mbId", login_mem.getMem_id());
			session.setAttribute("mbName", login_mem.getMem_name());
			session.setAttribute("loginOk", loginAct); //장바구니 구매같은거 누를때 -> 유리
			msg = login_mem.getMem_name() + "님, 로그인 되었습니다.";
			url = "user_main.do";
			break;
		case "wrongId" :
			msg = "없는 아이디 입니다. 다시 입력해 주세요.";
			url = "login.do";
			break;
		case "wrongPw" :
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요.";
			url =  "login.do";
			break;
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
	
		return mav;
	}
	
	 @RequestMapping(value = "/kakao.do", produces = "application/json")
		public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			ModelAndView mav = new ModelAndView("message");
			// 결과값을 node에 담아줌
			JsonNode node = KakaoController.getAccessToken(code);
			// accessToken에 사용자의 로그인한 모든 정보가 들어있음
			
			System.out.println(code);
			JsonNode accessToken = node.get("access_token");
			// 사용자의 정보
			JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
			String kemail = null;
			String kname = null;
			String kgender = null;
			String kbirthday = null;
			String kage = null;
			String kimage = null;
			// 유저정보 카카오에서 가져오기 Get properties
			JsonNode properties = userInfo.path("properties");
			JsonNode kakao_account = userInfo.path("kakao_account");
			kemail = kakao_account.path("email").asText();
			kname = properties.path("nickname").asText();
			kimage = properties.path("profile_image").asText();
			kgender = kakao_account.path("gender").asText();
			kbirthday = kakao_account.path("birthday").asText();
			kage = kakao_account.path("age_range").asText();
			session.setAttribute("kemail", kemail);
			session.setAttribute("kname", kname);
			session.setAttribute("kimage", kimage);
			session.setAttribute("kgender", kgender);
			session.setAttribute("kbirthday", kbirthday);
			session.setAttribute("kage", kage);					
			
			mav.setViewName("user/user_main");
		
			return mav;
		}// end kakaoLogin()
	
	
	@RequestMapping("/logout.do") // 로그아웃
	public String logout(HttpSession session) {
		
		return "login/logout";
	}
	
	@RequestMapping("/kakaologout.do") // 로그아웃
	public String kakaologout() {
		return "user_main";
	}
	
	@RequestMapping("/close.do") // 창 닫기
	public String close() {
		return "closewindow";
	}
	
	
	
	
	//================아이디, 비밀번호 찾기 part=========================
	
	@RequestMapping("/find.do") // 아이디찾기, 비밀번호 찾기
	public String login_search(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		req.setAttribute("mode", mode);
		return "login/find";
	}
	
	 //======================================================핸드폰 인증
	 
	
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {
		 
	      String api_key = "NCSCQCQXSUQESJJK";
	      String api_secret = "PMQ2DPRZO4V7UKLAC8LTOULURXYSLNJ5";
	      Message coolsms = new Message(api_key, api_secret);
	
	      
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);    
	        params.put("from", "010-3208-0509");   
	        params.put("type", "SMS");
	        params.put("text", "[flyingsuperboard] 인증번호 ["+numStr+"] 을 입력하세요");
	        params.put("app_version", "test app 1.2"); // application name and version
	
	        try {
	            JSONObject obj = (JSONObject)coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (Exception e) {
	            System.out.println(e.getMessage());
	            
	        }
	}
	 	
	
	
	@RequestMapping("/sendSMS.do") //jsp 페이지 넘긴 mapping 값
	@ResponseBody    
	public ModelAndView sendSMS(@RequestParam Map<String, String> params, HttpServletRequest req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String name = params.get("name");
		String phoneNumber = params.get("phoneNumber");
		String id = params.get("id");
		
		Random rand  = new Random(); //랜덤숫자 생성하기 !!
		String numStr = "";
		for(int i=0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr+=ran;
		}
		
		certifiedPhoneNumber(phoneNumber, numStr); 
		req.setAttribute("name", name);
		req.setAttribute("phoneNumber", phoneNumber);
		req.setAttribute("numStr", numStr);
		
		if(id!=null) { //비밀번호 찾기라면
			MemberDTO id_find = loginMapper.findId(name);
			String id_ok = id_find.getMem_id();
			if(id_find.getAllHp().equals(phoneNumber)&&id_ok.equals(id)) {
				
				req.setAttribute("id", id);
				mav.setViewName("/login/find_phone");
				return mav;
			}
		}
		mav.addObject("mode", "id");
		mav.setViewName("/login/find_phone");
		return mav;
		//여기까지 이름 번호 넘어옴
	}
	
	@RequestMapping("/sendSMS_ok.do")    
	public String sms_ok(@RequestParam Map<String, String> params, HttpServletRequest req) {
		String name = params.get("name");
		String phoneNumber = params.get("phoneNumber");
		String id = params.get("id");
		String numberok = params.get("numberok");
		String numStr = params.get("numStr");
		
		System.out.println("생성된숫자: "+numStr);
		System.out.println("입력한숫자: "+numberok);
	
		
		if(numberok.equals(numStr)) {
				if(id==null) {
				req.setAttribute("name", name);
				req.setAttribute("phoneNumber", phoneNumber);
				req.setAttribute("numStr", numStr);	
				req.setAttribute("numberok", numberok);
				req.setAttribute("mode", "id");
				System.out.println("id= "+id);
				return "login/find_phone_id";
				
				}else {
					req.setAttribute("name", name);
					req.setAttribute("phoneNumber", phoneNumber);
					req.setAttribute("numStr", numStr);	
					req.setAttribute("numberok", numberok);
					req.setAttribute("id", id);
					System.out.println("id= "+id);
					return "login/find_phone_id";
				}
			//여기까지 이름 넘어옴 
		}
		return null;
	}
	
	@RequestMapping("/find_phone_ok.do")  //아이디찾기 창
	public String find_phone_ok(HttpServletRequest req) {
		System.out.println("오고있니");;
		String name = (String)req.getParameter("name");
		String phoneNumber = (String)req.getParameter("phoneNumber");
		
		MemberDTO id_find = loginMapper.findId(name);
		System.out.println(phoneNumber);
		System.out.println(id_find.getAllHp());
		
		System.out.println(id_find.getMem_name());
		if(id_find.getAllHp().equals(phoneNumber)) {
			String id = id_find.getMem_id();
			req.setAttribute("id", id);
			
			req.setAttribute("joindate", id_find.getMem_regdate());
			System.out.println(id+id_find.getMem_regdate());
			return "login/find_phone_ok";
		}
		return "login/find_phone_ok";
	}
	
	@RequestMapping("/find_pw.do") // 핸드폰으로 찾기 비밀번호 재설정 창
	public String find_pw(@RequestParam Map<String, String> params, HttpServletRequest req) {
		String id = params.get("id");
		req.setAttribute("id", id);
		return "login/find_pw_ok";
	}
	
	@RequestMapping("/pw_re_ok.do") // 비밀번호 일치시 재설정
	public String message_close(@RequestParam Map<String, String> params, HttpServletRequest req) {
		String passwd  = params.get("passwd");
		String passwd2  = params.get("passwd2");
		String id = params.get("id");
		System.out.println("id= "+id);
		System.out.println("passwd= "+passwd);
		System.out.println("passwd2= "+passwd2);
		MemberDTO dto = loginMapper.findMember(id);
		dto.setMem_passwd(passwd);
		int res = loginMapper.changePw(dto);
		req.setAttribute("msg", "변경되었습니다.");	
		return "message_close";
	}
	
	//============이메일로 인증하기===========================
		
		@RequestMapping(value = "/sendEmail.do")
		public ModelAndView sendEmail(@RequestParam String email, @RequestParam Map<String, String> params, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
			
			ModelAndView mv = new ModelAndView();
			String name = params.get("name");
			MemberDTO vo = loginMapper.findMember(email);
			//System.out.println(vo.getMem_name());	
			if(vo != null) {
			Random r = new Random();
			int num = r.nextInt(999999); // 랜덤난수설정
			
			System.out.println(num);
			System.out.println("name= "+name);
			
			if (num != 0 ) {
				session.setAttribute("email", vo.getMem_id());
	
				String setfrom = "flyingsuperboard1004@gmail.com"; 
				String tomail = email; //받는사람
				String title = "[flyingsuperboard] 이메일 인증 번호"; 
				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
						+ "flyingsuperboard 이메일 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
	 
				try { 
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
	
					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content); 
	
					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
				if (name==null) {
			   
				mv.setViewName("/login/find_email");
				mv.addObject("num", num);
				mv.addObject("email", email);
				mv.addObject("mode", "id");
				return mv;
				} else {
					mv.setViewName("/login/find_email");
					mv.addObject("num", num);
					mv.addObject("name", name);
					mv.addObject("email", email);
					mv.addObject("mode", "passwd");
					return mv;
				}
			}else {
				mv.addObject("msg", "입력하신 메일은 존재하지 않습니다.");
				mv.setViewName("/message_close");
				return mv;
			}
		
		}else {
			mv.addObject("msg", "입력하신 메일은 존재하지 않습니다.");
			mv.setViewName("/message_close");
			return mv;
		}
		}
	
		@RequestMapping(value = "/sendEmail_ok.do", method = RequestMethod.POST)
		public String sendEmail_ok(@RequestParam(value="email_injeung") String email_injeung,
					@RequestParam(value = "num") String num, @RequestParam Map<String, String> params, HttpServletRequest req) throws IOException{
				String email = params.get("email");
				String name = params.get("name");
				
				if(email_injeung.equals(num)) {
					if(name==null) {
					String id= email;
					MemberDTO dto = loginMapper.findMember(id);
					String id2 = dto.getMem_id();
					
					req.setAttribute("id", id2);			
					req.setAttribute("joindate", dto.getMem_regdate());
					req.setAttribute("mode", "id");
					return "login/find_phone_ok";
					
					}else {
						String id2= email;
						MemberDTO dto = loginMapper.findMember(id2);
						String id = dto.getMem_id();
		
						req.setAttribute("id", id);
						req.setAttribute("mode", "passwd");
						return "/login/find_pw_ok";
					}
				}
				else {
					return "login/find_phone_ok";
				}
		} //이메일 인증번호 확인
		
		@RequestMapping("/find_email_pw.do") // 이메일로 찾기 비밀번호 재설정 창
		public String find_pw(HttpServletRequest req) {
			String id = (String)req.getAttribute("id2");
			req.setAttribute("id", id);
			return "login/find_pw_ok";
		}
				
	
	}
