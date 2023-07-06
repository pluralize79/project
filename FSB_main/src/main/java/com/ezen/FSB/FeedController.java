package com.ezen.FSB;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.codec.binary.Base64;

import com.ezen.FSB.dto.FeedDTO;
import com.ezen.FSB.dto.Feed_themeDTO;
import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.dto.ProfileDTO;
import com.ezen.FSB.dto.ThemeDTO;
import com.ezen.FSB.service.AdminMapper;
import com.ezen.FSB.service.FeedMapper;
import com.ezen.FSB.service.ProfileMapper;

@Controller
public class FeedController {
	
	@Autowired
	private FeedMapper feedMapper;
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private ProfileMapper profileMapper;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//메인 타임라인
	@RequestMapping(value = "/feed.do")
	public ModelAndView feed(HttpServletRequest req) {
		//이미지 저장 경로 등록
		HttpSession session = req.getSession();
		session.setAttribute("upPath", session.getServletContext().getRealPath("/resources/img"));

		//멤버&프로필 정보 재설정
		MemberDTO mdto = (MemberDTO)session.getAttribute("member");
		//멤버 설정
		int mem_num = mdto.getMem_num();
		mdto = profileMapper.getMember(mem_num);
		//프로필 설정
		ProfileDTO pdto = profileMapper.getProfile(mem_num);
		//팔로우 팔로워 확인
		int[] ff = profileMapper.getFollows(mem_num);
		pdto.setProf_following(ff[0]);
		pdto.setProf_follower(ff[1]);
		session.setAttribute("member", mdto);
		session.setAttribute("profile", pdto);
		
		//타임라인 가져오기
		List<FeedDTO> list = feedMapper.getTimeline(mem_num);
		ModelAndView mav = new ModelAndView("feed/timeLine");
		mav.addObject("listFeed", list);
		
		return mav;
	}
	
	//피드 상세보기
	@ResponseBody
	@RequestMapping(value = "/timeLine_feedView.do")
	public ModelAndView test(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView("feed/feedView");
		String id = (String) map.get("id");
		mav.addObject("id", id);
		
		return mav;
	}
	
	//피드 글쓰기 폼
	@RequestMapping(value = "/feedForm.do")
	public ModelAndView feedForm(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("feed/feedForm");
		
		//prof_open 값 주기 (임시)
		req.setAttribute("prof_open", "open");
		//mav.addObject("prof_open", "open");
		
		//테마 목록받아서 넘겨주기 (+세션에 저장)
		List<ThemeDTO> listTheme = adminMapper.listTheme();
		HttpSession session = req.getSession();
		session.setAttribute("listTheme", listTheme);
		
		return mav;
	}
	
	//피드 등록
	@RequestMapping(value = "/feedFormOk.do")
	public String feedFormOk(@ModelAttribute FeedDTO dto, BindingResult result, @RequestParam Map<String, Object> map, HttpServletRequest req){
		if(result.hasErrors()){} //항상 바인딩 에러 발생할 수 밖에 없음. 처리할 건 딱히 없음.
		
		int feed_num = dto.getFeed_num(); //0이면 새 글, 다른 값이면 임시저장글
		int bp_num = dto.getBp_num(); //0이면 장소 선택 안 함, 다른 값이면 선택
		
		HttpSession session = req.getSession();
		String upPath = (String)session.getAttribute("upPath");
		List<ThemeDTO> listTheme = (List<ThemeDTO>)session.getAttribute("listTheme");
		
		//새 글이라면
		if(feed_num == 0) {
			//이미지 처리
			for(int i=0; i<4; ++i) {
				String imgs = (String) map.get("imgs"+i);
				System.out.println(imgs);
				if(imgs == null) break; //받아온 이미지가 더 없으면 for문 나가기
				
				byte[] imageData = Base64.decodeBase64(imgs.getBytes()); //디코딩
				String fileName = UUID.randomUUID().toString() + ".png"; //랜덤이름 생성
				
				if(i==0) dto.setFeed_img1(fileName);
				if(i==1) dto.setFeed_img2(fileName);
				if(i==2) dto.setFeed_img3(fileName);
				if(i==3) dto.setFeed_img4(fileName);
				
				File file = new File(upPath, fileName);
				//저장공간에 비어있는 파일 생성
				try{
					file.createNewFile();
				}catch(IOException e) {
					e.printStackTrace();
				}
				// 파일에 이미지 출력
				try {
					FileOutputStream fos = new FileOutputStream(file);
					fos.write(imageData);
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			System.out.println(upPath); //콘솔에 확인용 경로 출력
			
			//등록
			feed_num = feedMapper.getNextFeedNum();
			dto.setFeed_num(feed_num);
			if(bp_num == 0) {
				feedMapper.insertFeed_noBP(dto);
			}else {
				feedMapper.insertFeed(dto);
			}
			
			//태그 처리
			String[] list = req.getParameterValues("theme");
			feedMapper.insertFeedTheme(feed_num, list);
			
		}else {
		//임시저장글이라면
			System.out.println("여기왔니");
		}
		
		return "feed/timeLine";
	}
	
	@RequestMapping(value = "/feedSave.do")
	public String feedSave() {
		return "feed/timeLine";
	}
	
	@RequestMapping(value = "/mapSelect.do")
	public String mapSelect() {
		return "feed/mapSelect";
	}
	
	@RequestMapping(value = "/tempList.do")
	public String tempList() {
		return "feed/tempList";
	}
	
}
