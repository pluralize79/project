package com.ezen.FSB;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.service.LoginMapper;
import com.ezen.FSB.service.NaverLoginMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class NaverLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private NaverLoginMapper naverLoginMapper;
	
	@Autowired
	private LoginMapper loginMapper;
	
	// 네이버 로그인 성공 시 
	@RequestMapping(value = "naver_login_ok", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(HttpServletRequest req, Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		
		System.out.println("여기는 naver_login_ok");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
 
        //1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);  //String형식의 json데이터
		
		/** apiResult json 구조
		{"resultcode":"00",
		 "message":"success",
		 "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		**/
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱 
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		//response의 nickname값 파싱
		String name = (String)response_obj.get("name");
		String nickname = (String)response_obj.get("nickname");
		String email = (String)response_obj.get("email");
		String hp = (String)response_obj.get("mobile");
		
		System.out.println(nickname);
		System.out.println(name);
		System.out.println(email);
		System.out.println(hp);
		// 네이버 로그인 할일 230701
		// 1. 네이버 로그아웃 url로 이동시켜서 로그아웃 시켜야함
		// 2. 네이버로 회원가입받아서 db에 저장 시킨 후 홈페이지에서 로그인 시킬지
		// 	   아니면 네이버 아이디 자체로 로그인 시킬지 카카오랑 상의 후 정하기...
		// 3. db에 값을 저장 할 경우 hp 값이 어떻게 넘어 오는지 확인 후 split하기
		// 	  db에 hp1,hp2,hp3으로 저장(not null...)
		// 4. 카카오 핸드폰번호 안받아와서 물어보기...
		String hp2[] = hp.split("-");
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_name(name);
		dto.setMem_nickname(nickname);
		dto.setMem_id(email);
		dto.setMem_hp1(hp);
		int count = naverLoginMapper.checkNaverMember(email);
		System.out.println("체크멤버" + count);
		if (count == 0) {	// 데이터가 없을 때 로그인 받기
			int res = naverLoginMapper.insertNaverMember(dto);
			if (res > 0) {	// 네이버로 회원가입 완료
				//4.파싱 닉네임 세션으로 저장
				session.setAttribute("naverName", name);	//세션 생성
				session.setAttribute("naverNickname", nickname); 
				session.setAttribute("naverEmail", email);
				session.setAttribute("naverHp", hp);
				// 테스트용...
				MemberDTO dto2 = loginMapper.findMember(email);
				System.out.println("dto멤버넘버" + dto2.getMem_num());
				session.setAttribute("login_mem", dto2);
				
				session.setAttribute("mbId", dto.getMem_id());
				req.setAttribute("msg", "로그인 되었습니다.");
				req.setAttribute("url", "user_main.do");
			} else {
				req.setAttribute("msg", "로그인 실패, 관리자에게 문의해주세요.");
				req.setAttribute("url", "user_main.do");
			}
		} else {
			req.setAttribute("msg", "이미 가입된 아이디 입니다.");
			req.setAttribute("url", "user_main.do");
		}
		
		model.addAttribute("result", apiResult);
	     
		return "message";
	}
}
