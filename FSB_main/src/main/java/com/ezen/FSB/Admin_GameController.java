package com.ezen.FSB;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.FSB.dto.GameDTO;
import com.ezen.FSB.dto.ReviewDTO;
import com.ezen.FSB.dto.TagDTO;
import com.ezen.FSB.dto.ThemeDTO;
import com.ezen.FSB.service.AdminMapper;

@Controller
public class Admin_GameController { // 관리자 - Game Controller

	@Autowired
	AdminMapper adminMapper;
	
//	// 파일 이미지
//	@Resource(name="uploadPath")
//	private String uploadPath;
	
	// 보드게임 목록
	@RequestMapping("/admin_game_list.do")
	public ModelAndView listGame(HttpServletRequest req, @RequestParam Map<String, String> params) {
		
		List<GameDTO> listGame = null;
		
		if(params.get("mode") == null) { // 전체보기
			HttpSession session = req.getSession();
			// 목록 세션 꺼내기/저장
			listGame = (List)session.getAttribute("listGame");
			if(listGame == null) {
				listGame = adminMapper.listGame();
				session.setAttribute("listGame", listGame);
			}
		}else { // 보드게임 찾기 (params.get("mode").equals("find"))
			listGame = adminMapper.findGame(params);
		}
		ModelAndView mav = new ModelAndView("admin/game_list");
		mav.addObject("listGame", listGame);
		return mav;
	}
	
	// 보드게임 등록폼
	@RequestMapping(value="/admin_game_insert.do", method=RequestMethod.GET)
	public ModelAndView insertGame(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		// 보드게임 등록 시 선택할 테마 리스트 세션 꺼내기/저장
		List<ThemeDTO> listTheme = (List)session.getAttribute("listTheme");
		if(listTheme == null) {
			listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
		}
		ModelAndView mav = new ModelAndView("admin/game_insert");
		mav.addObject("listTheme", listTheme);
		return mav;
	}
	
	// 보드게임 등록처리
	@RequestMapping(value="/admin_game_insert.do", method=RequestMethod.POST)
	public ModelAndView insertOkGame(@RequestParam Map<String, String> params, HttpServletRequest req, @ModelAttribute GameDTO dto, BindingResult result) {
		// img 데이터 없는 오류로, 초기값 설정
		if(result.hasErrors()) {
			dto.setGame_img("0"); 
		}
		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("game_img");
		String game_img = mf.getOriginalFilename();

		// 파일명 중복 방지
		UUID uuid = UUID.randomUUID();
		game_img = uuid.toString() + "_" +game_img;
		
		// 파일 객체 생성, 업로드
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		System.out.println(upPath);
		File file = new File(upPath, game_img);
		try {
			mf.transferTo(file);
		}catch(IOException e) {
			e.printStackTrace();
			System.out.println("file 업로드 오류 발생");
		}
		// 파일 이름 dto 세팅
		dto.setGame_img(game_img);
		
		// 해당 보드게임이 가질 등록번호(seq.nextval)
		int num = adminMapper.maxGameNum();
		dto.setGame_num(num);
		
		// insert
		int res = adminMapper.insertGame(dto);
		
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			// 등록한 보드게임 목록 세션에 업데이트
			List<GameDTO> listGame = adminMapper.listGame();
			session.setAttribute("listGame", listGame);
			
			int maxThemeNum = adminMapper.maxThemeNum(); // 현재 등록되어있는 theme 의 max (for문 범위 확인)
			
			boolean isNull = true;
			for(int i=1; i<maxThemeNum+1; ++i) {
				if(params.get("tag"+i) != null) {
					isNull = false;
					break;
				}
			}
			if(isNull) { // 선택한 tag 가 없는 경우
				mav.addObject("msg", "게임 등록 성공! 게임 목록 페이지로 이동합니다.");
				mav.addObject("url", "admin_game_list.do");
			}else { // 선택한 tag 가 있는 경우
				// 지금 등록한 game_num 찾기
				TagDTO tdto = new TagDTO();
				tdto.setGame_num(num);
				// 태그 등록
				for(int i=1; i<maxThemeNum+1; ++i) {
					if(params.get("tag"+i) != null) {
						tdto.setTheme_num(i);
						int res2 = adminMapper.insertGameTag(tdto);
						if(res2<0) {
							mav.addObject("msg", "게임 등록 성공! 태그 등록 실패! 게임 목록 페이지로 이동합니다.");
							mav.addObject("url", "admin_game_list.do");
							return mav;
						}
					}
				}
				mav.addObject("msg", "게임 등록 성공! 태그 등록 성공! 게임 목록 페이지로 이동합니다.");
				mav.addObject("url", "admin_game_list.do");
			}
		}else {
			mav.addObject("msg", "게임 등록 실패! 게임 등록 페이지로 이동합니다.");
			mav.addObject("url", "admin_game_insert.do");
		}
		return mav;
	}
	
	// 보드게임 상세보기
	@RequestMapping("/admin_game_view.do")
	public ModelAndView getGame(HttpServletRequest req, @RequestParam int game_num, @RequestParam String mode) {
		ModelAndView mav = new ModelAndView("admin/game_view");
		// game_num 의 gameDTO
		GameDTO dto = adminMapper.getGame(game_num);
		mav.addObject("getGame", dto);
		// 전체 themeList
		HttpSession session = req.getSession();
		List<ThemeDTO> listTheme = (List)session.getAttribute("listTheme");
		if(listTheme == null) {
			listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
		}
		mav.addObject("listTheme",listTheme);
		// game_num 을 가지고 있는 tagDTO
		List<TagDTO> tagList = adminMapper.getGameTagList(game_num);
		mav.addObject("getGameTagList", tagList);
		
		// 한줄평 보기
		List<ReviewDTO> reviewList = null;
		if(mode.equals("all")) { // 전체 한줄평
			reviewList = adminMapper.getGameReview(game_num);
		}else if(mode.equals("report")) { // 신고된 한줄평
			reviewList = adminMapper.getGameReviewReport(game_num);
		}
		mav.addObject("getGameReviewList", reviewList);
		
		// 총 리뷰 수
		int reviewCount = adminMapper.getGameReviewCount(game_num);
		mav.addObject("reviewCount", reviewCount);
		if(reviewCount >0) {
			// 별점 평균 구하기
			int sum = adminMapper.getGameReviewStar(game_num);
			double starrating = (double)(sum*1.0)/reviewCount;
			starrating = Math.round(starrating*100)/100.0;
			mav.addObject("starrating", starrating);
		}
		return mav;
	}
	
	// 보드게임 상세보기 - 한줄평 삭제
	@RequestMapping("/admin_game_review_delete.do")
	public ModelAndView deleteReview(@RequestParam int review_num, @RequestParam int game_num) {
		ModelAndView mav = new ModelAndView("message");
		int res = adminMapper.deleteGameReview(review_num);
		// 결과
		if(res>0) {
			mav.addObject("msg", "한줄평 삭제 성공!");
		}else {
			mav.addObject("msg", "한줄평 삭제 실패!");
		}
		// 페이지 이동
		if(game_num != 0) { // 보드게임 상세보기 - 한줄평 삭제
			mav.addObject("url", "admin_game_view.do?mode=all&game_num="+game_num);
		}else { // 보드게임 한줄평 신고 내역
			mav.addObject("url", "admin_game_reportList.do?mode=all&sort=all");
		}
		return mav;
	}
	// 보드게임 한줄평 신고 취소 처리
	@RequestMapping("/admin_game_review_update.do")
	public ModelAndView updateReview(@RequestParam int review_num, @RequestParam(required=false) int game_num) {
		ModelAndView mav = new ModelAndView("message");
		// review_num 의 review_report '0' 으로 초기화
		int res = adminMapper.updateReviewReport(review_num);
		if(res>0) {
			mav.addObject("msg", "신고취소 처리 성공!");
		}else {
			mav.addObject("msg", "신고취소 처리 실패!");
		}
		if(game_num == 0) { // 보드게임 한줄평 신고목록
			mav.addObject("url", "admin_game_reportList.do?mode=all&sort=all");
		}else { // 보드게임 상세보기
			mav.addObject("url", "admin_game_view.do?game_num="+game_num+"&mode=all");
		}
		return mav;
	}
	
	
	// 보드게임 삭제
	@RequestMapping("/admin_game_delete.do")
	public ModelAndView deleteGame(HttpServletRequest req, @RequestParam Map<String, String> params) {
		ModelAndView mav = new ModelAndView("message");
		int res = adminMapper.deleteGame(Integer.parseInt(params.get("game_num")));
		if(res>0) {
			HttpSession session = req.getSession();
			String upPath = session.getServletContext().getRealPath("/resources/img");
			// 삭제한 보드게임 목록 세션에 업데이트
			List<GameDTO> listGame = adminMapper.listGame();
			session.setAttribute("listGame", listGame);
			
			// game_num 이 가지고 있는 tagDTO 있는지 확인
			List<TagDTO> listTag = adminMapper.getGameTagList(Integer.parseInt(params.get("game_num")));
			if(listTag.size() != 0) { // 가지고 있던 tag 가 있는 경우
				// 해당 보드게임 등록된 태그 삭제
				int res2 = adminMapper.deleteGameTag(Integer.parseInt(params.get("game_num")));
				if(res2>0) { // 태그 삭제 성공
					// 파일 삭제
					File file = new File(upPath, params.get("game_img"));
					if(file.exists()) { // 파일이 존재하면
						file.delete();
						List<ReviewDTO> listReview = adminMapper.getGameReview(Integer.parseInt(params.get("game_num")));
						if(listReview.size() != 0) { // 리뷰가 있는 경우
							int res3 = adminMapper.deleteGameReview2(Integer.parseInt(params.get("game_num")));
							if(res3>0) {
								mav.addObject("msg", "게임 삭제/태그 삭제/파일 삭제/한줄평 삭제 성공! 게임 목록 페이지로 이동합니다.");
							}else {
								mav.addObject("msg", "게임 삭제/태그 삭제/파일 삭제 성공! 한줄평 삭제 실패! 게임 목록 페이지로 이동합니다.");
							}
						}else { // 리뷰가 없는 경우
							mav.addObject("msg", "게임 삭제/태그 삭제/파일 삭제 성공! 게임 목록 페이지로 이동합니다.");
						}
					}else { // 파일이 없으면
						List<ReviewDTO> listReview = adminMapper.getGameReview(Integer.parseInt(params.get("game_num")));
						if(listReview.size() != 0) { // 리뷰가 있는 경우
							int res3 = adminMapper.deleteGameReview2(Integer.parseInt(params.get("game_num")));
							if(res3>0) {
								mav.addObject("msg", "게임 삭제/태그 삭제/한줄평 삭제 성공! 파일 삭제 실패! 게임 목록 페이지로 이동합니다.");
							}else {
								mav.addObject("msg", "게임 삭제/태그 삭제 성공! 파일 삭제/한줄평 삭제 실패! 게임 목록 페이지로 이동합니다.");
							}
						}else {
							mav.addObject("msg", "게임 삭제/태그 삭제 성공! 파일 삭제 실패! 게임 목록 페이지로 이동합니다.");
						}
					}
				}else { // 태그 삭제 실패
					// 파일 삭제
					File file = new File(upPath, params.get("game_img"));
					if(file.exists()) { // 파일이 존재하면
						file.delete();
						List<ReviewDTO> listReview = adminMapper.getGameReview(Integer.parseInt(params.get("game_num")));
						if(listReview.size() != 0) { // 리뷰가 있는 경우
							int res3 = adminMapper.deleteGameReview2(Integer.parseInt(params.get("game_num")));
							if(res3>0) {
								mav.addObject("msg", "게임 삭제/파일 삭제/한줄평 삭제 성공! 태그 삭제 실패! 게임 목록 페이지로 이동합니다.");
							}else {
								mav.addObject("msg", "게임 삭제/파일 삭제 성공! 태그 삭제/한줄평 삭제 실패! 게임 목록 페이지로 이동합니다.");
							}
						}else {
							mav.addObject("msg", "게임 삭제/파일 삭제 성공! 태그 삭제 실패! 게임 목록 페이지로 이동합니다.");
						}
					}else { // 파일이 없으면
						List<ReviewDTO> listReview = adminMapper.getGameReview(Integer.parseInt(params.get("game_num")));
						if(listReview.size() != 0) { // 리뷰가 있는 경우
							int res3 = adminMapper.deleteGameReview2(Integer.parseInt(params.get("game_num")));
							if(res3>0) {
								mav.addObject("msg", "게임 삭제/한줄평 삭제 성공! 파일 삭제/태그 삭제 실패! 게임 목록 페이지로 이동합니다.");
							}else {
								mav.addObject("msg", "게임 삭제 성공! /파일 삭제/태그 삭제/한줄평 삭제 실패! 게임 목록 페이지로 이동합니다.");
							}
						}else {
							mav.addObject("msg", "게임 삭제 성공! 파일 삭제/태그 삭제 실패! 게임 목록 페이지로 이동합니다.");
						}
					}
				}
			}else { // 가지고 있던 tag 가 없는 경우
				// 파일 삭제
				File file = new File(upPath, params.get("game_img"));
				if(file.exists()) { // 파일이 존재하면
					file.delete();
					List<ReviewDTO> listReview = adminMapper.getGameReview(Integer.parseInt(params.get("game_num")));
					if(listReview.size() != 0) { // 리뷰가 있는 경우
						int res3 = adminMapper.deleteGameReview2(Integer.parseInt(params.get("game_num")));
						if(res3>0) {
							mav.addObject("msg", "게임 삭제/파일 삭제/한줄평 삭제 성공! 게임 목록 페이지로 이동합니다.");
						}else {
							mav.addObject("msg", "게임 삭제/파일 삭제 성공! 한줄평 삭제 실패! 게임 목록 페이지로 이동합니다.");
						}
					}else {
						mav.addObject("msg", "게임 삭제/파일 삭제 성공! 게임 목록 페이지로 이동합니다.");
					}
				}else { // 파일이 없으면
					List<ReviewDTO> listReview = adminMapper.getGameReview(Integer.parseInt(params.get("game_num")));
					if(listReview.size() != 0) { // 리뷰가 있는 경우
						int res3 = adminMapper.deleteGameReview2(Integer.parseInt(params.get("game_num")));
						if(res3>0) {
							mav.addObject("msg", "게임삭제/한줄평 삭제 성공! 파일 삭제 실패! 게임 목록 페이지로 이동합니다.");
						}else {
							mav.addObject("msg", "게임 삭제 성공! 파일 삭제/한줄평 삭제 실패! 게임 목록 페이지로 이동합니다.");
						}
					}else {
						mav.addObject("msg", "게임삭제 성공! 파일 삭제 실패! 게임 목록 페이지로 이동합니다.");
					}
				}
			}
		}else {
			mav.addObject("msg", "게임 삭제 실패! 게임 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_game_list.do");
		return mav;
	}
	
	// 보드게임 수정 폼
	@RequestMapping(value="/admin_game_update.do", method=RequestMethod.GET)
	public ModelAndView updateGame(HttpServletRequest req, @RequestParam int game_num) {
		ModelAndView mav = new ModelAndView("admin/game_update");
		// game_num 의 gameDTO
		GameDTO gdto = adminMapper.getGame(game_num);
		mav.addObject("getGame", gdto);
		// 전체 themeList
		HttpSession session = req.getSession();
		List<ThemeDTO> listTheme = (List)session.getAttribute("listTheme");
		if(listTheme == null) {
			listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
		}
		mav.addObject("listTheme",listTheme);
		// game_num 을 가지고 있는 tagDTO
		List<TagDTO> tagList = adminMapper.getGameTagList(game_num);
		mav.addObject("getGameTagList", tagList);
		return mav;
	}
	
	// 보드게임 수정 처리
	@RequestMapping(value="/admin_game_update.do", method=RequestMethod.POST)
	public ModelAndView updateOkGame(@RequestParam Map<String, String> params, HttpServletRequest req, @ModelAttribute GameDTO dto, BindingResult result) {
		// img 가 없는 오류로 초기값 설정
		if(result.hasErrors()) {
			dto.setGame_img("0"); 
		}
		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("game_img");
		String game_img = mf.getOriginalFilename();
		
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		
		// 파일명 중복 방지
		UUID uuid = UUID.randomUUID();
		game_img = uuid.toString() + "_" +game_img;
		
		if(!mf.isEmpty()) { // 이미지 수정 하는 경우
			// 파일 객체 생성, 업로드
			File file = new File(upPath, game_img);
			try {
				mf.transferTo(file);
			}catch(IOException e) {
				e.printStackTrace();
				System.out.println("file 수정중 오류 발생");
			}
			// 파일 이름 dto 세팅
			dto.setGame_img(game_img);
			// 이전 파일 지우기
			File file01 = new File(upPath, params.get("game_img2"));
			if(file01.exists()) { // 파일이 존재하면
				file01.delete();
			}
		}else { // 이미지 수정 하지 않는 경우
			// 파일 이름만 dto 세팅
			dto.setGame_img(params.get("game_img2"));
		}
		
		// update
		int res = adminMapper.updateGame(dto);
		
		ModelAndView mav = new ModelAndView("message");
		if(res>0) { // gameDTO 수정 성공
			// 수정한 보드게임 목록 세션에 업데이트
			List<GameDTO> listGame = adminMapper.listGame();
			session.setAttribute("listGame", listGame);

			int maxThemeNum = adminMapper.maxThemeNum(); // 현재 등록되어있는 theme 의 max (for문 범위 확인)
			
			List<TagDTO> listTag = adminMapper.getGameTagList(dto.getGame_num());
			if(listTag.size() != 0) { // 가지고 있던 tag 가 있는 경우
				// 현재 등록되어 있는 게임 tag 지우기
				int res2 = adminMapper.deleteGameTag(dto.getGame_num());
				if(res2>0) { // 기존 태그 삭제 성공
					// 선택한 태그가 있는 지 확인
					boolean isNull = true;
					for(int i=1; i<maxThemeNum+1; ++i) {
						if(params.get("tag"+i) != null) {
							isNull = false;
							break;
						}
					}
					if(isNull) { // 수정용 tag 를 선택하지 않은 경우
						mav.addObject("msg", "게임 수정 / 기존 태그 삭제 성공! 게임 목록 페이지로 이동합니다.");
						mav.addObject("url", "admin_game_list.do");
						return mav;
					}else { // 수정용 tag 를 선택한 경우
						// tagDTO 새로 등록
						TagDTO tdto = new TagDTO();
						tdto.setGame_num(dto.getGame_num()); // game_num 으로 우선 세팅
						for(int i=1; i<maxThemeNum+1; ++i) {
							if(params.get("tag"+i) != null) {
								tdto.setTheme_num(i);
								int res3 = adminMapper.insertGameTag(tdto);
								if(res3<0) {
									mav.addObject("msg", "게임 수정 / 기존 태그 삭제 성공! 태그 등록 실패! 게임 목록 페이지로 이동합니다.");
									mav.addObject("url", "admin_game_list.do");
									return mav;
								}
							}
						}
						mav.addObject("msg", "게임 수정/기존태그 삭제/태그 등록 성공! 게임 목록 페이지로 이동합니다.");
						mav.addObject("url", "admin_game_list.do");
						return mav;
					}
				}else { // 기존 태그 삭제 실패
					mav.addObject("msg", "게임 수정 성공! 기존 태그 삭제 실패! 게임 목록 페이지로 이동합니다.");
					mav.addObject("url", "admin_game_list.do");
					return mav;
				}
			}else { // 가지고 있던  tag 가 없는 경우
				// 선택한 태그가 있는 지 확인
				boolean isNull = true;
				for(int i=1; i<maxThemeNum+1; ++i) {
					if(params.get("tag"+i) != null) {
						isNull = false;
						break;
					}
				}
				if(isNull) { // 수정용 tag 를 선택하지 않은 경우
					mav.addObject("msg", "게임 수정  성공! 게임 목록 페이지로 이동합니다.");
					mav.addObject("url", "admin_game_list.do");
					return mav;
				}else { // 수정용 tag 를 선택한 경우
					// tagDTO 새로 등록
					TagDTO tdto = new TagDTO();
					tdto.setGame_num(dto.getGame_num()); // game_num 으로 우선 세팅
					for(int i=1; i<maxThemeNum+1; ++i) {
						if(params.get("tag"+i) != null) {
							tdto.setTheme_num(i);
							int res3 = adminMapper.insertGameTag(tdto);
							if(res3<0) {
								mav.addObject("msg", "게임 수정 성공! 태그 등록 실패! 게임 목록 페이지로 이동합니다.");
								mav.addObject("url", "admin_game_list.do");
								return mav;
							}
						}
					}
					mav.addObject("msg", "게임 수정/태그 등록 성공! 게임 목록 페이지로 이동합니다.");
					mav.addObject("url", "admin_game_list.do");
					return mav;
				}
			}
		}else { // gameDTO 수정 실패
			mav.addObject("msg","게임 수정 실패! 게임 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_game_list.do");
		return mav;
	}
	
	// 보드게임 한줄평 신고내역
	@RequestMapping("/admin_game_reportList.do")
	public ModelAndView reportListGame(@RequestParam Map<String, String> params) {
		String mode = params.get("mode"); // all, find
		String sort = params.get("sort"); // 정렬
		
		List<ReviewDTO> listReview = null;
		
		if(mode.equals("all")) { // 기본 보기
			if(sort.equals("all")) {// 기본 정렬
				listReview = adminMapper.listReviewReport();
			}else if(sort.equals("game_num_asc")) {
				listReview = adminMapper.listReviewReport1();
			}else if(sort.equals("game_num_desc")) {
				listReview = adminMapper.listReviewReport2();
			}else if(sort.equals("regdate_asc")) {
				listReview = adminMapper.listReviewReport3();
			}else if(sort.equals("regdate_desc")) {
				listReview = adminMapper.listReviewReport4();
			}
		}else if(mode.equals("find")) { // 찾기
			listReview = adminMapper.findReviewReport(params);
		}

		return new ModelAndView("admin/game_report_list", "listReview", listReview);
	}
	
	// 보드게임 테마 목록
	@RequestMapping("/admin_theme_list.do")
	public ModelAndView listTheme(HttpServletRequest req, @RequestParam int theme_num) {
		// 전체 themeList
		HttpSession session = req.getSession();
		
		ModelAndView mav = new ModelAndView("admin/theme_list");
		
		List<ThemeDTO> listTheme = (List)session.getAttribute("listTheme");
		if(listTheme == null) {
			listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
		}
		mav.addObject("listTheme", listTheme);
		
		// mode 가 view 일 때 (해당 테마가 등록된 게임 목록)
		List<GameDTO> listThemeGame = null;
		if(theme_num != 0) {
			listThemeGame = adminMapper.findThemeGame(theme_num);
			mav.addObject("listThemeGame", listThemeGame);
		}
		return mav;
	}
	
	// 보드게임 테마 수정폼
	@RequestMapping(value="/admin_theme_update.do", method=RequestMethod.GET)
	public ModelAndView updateTheme(HttpServletRequest req, @RequestParam int theme_num) {
		ThemeDTO dto = adminMapper.getTheme(theme_num);
		
		return new ModelAndView("admin/theme_update", "getTheme", dto);
	}
	// 보드게임 테마 수정 처리
	@RequestMapping(value="/admin_theme_update.do", method=RequestMethod.POST)
	public ModelAndView updateOkTheme(HttpServletRequest req, @ModelAttribute ThemeDTO dto, BindingResult result) {
		
		int res = adminMapper.updateTheme(dto);
		
		ModelAndView mav = new ModelAndView("closeWindow");
		if(res>0) {
			mav.addObject("msg", "테마 수정 성공!");
			// 수정된 theme 리스트로 세션 저장
			HttpSession session = req.getSession();
			List<ThemeDTO> listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
		}else {
			mav.addObject("msg", "테마 수정 실패!");
		}
		return mav;
	}
	
	// 보드게임 테마 등록폼
	@RequestMapping(value="/admin_theme_insert.do", method=RequestMethod.GET)
	public ModelAndView insertTheme(HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		ModelAndView mav = new ModelAndView("admin/theme_insert");
		
		List<ThemeDTO> listTheme = (List)session.getAttribute("listTheme");
		if(listTheme == null) {
			listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
		}
		mav.addObject("listTheme", listTheme);
		return mav;
	}
	// 보드게임 테마 등록 처리
	@RequestMapping(value="/admin_theme_insert.do", method=RequestMethod.POST)
	public ModelAndView insertTheme(HttpServletRequest req, String theme_name) {
		HttpSession session = req.getSession();
		
		ModelAndView mav = new ModelAndView("message");
		
		int res = adminMapper.insertTheme(theme_name);
		if(res>0) {
			// 등록한 테마 리스트 세션에 업데이트
			List<ThemeDTO> listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
			
			mav.addObject("msg", "테마 등록 성공! 테마 목록 페이지로 이동합니다.");
			mav.addObject("url", "admin_theme_list.do?theme_num=0");
		}else {
			mav.addObject("msg", "테마 등록 실패! 테마 등록 페이지로 이동합니다.");
			mav.addObject("url", "admin_theme_insert.do");
		}
		return mav;
	}
	// 보드게임 테마 삭제 처리
	@RequestMapping("/admin_theme_delete.do")
	public ModelAndView deleteTheme(HttpServletRequest req, int theme_num) {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView("message");
		
		// themeDTO 삭제
		int res = adminMapper.deleteTheme(theme_num);
		if(res>0) { // themeDTO 삭제 성공
			// 삭제한 테마 리스트 세션에 업데이트
			List<ThemeDTO> listTheme = adminMapper.listTheme();
			session.setAttribute("listTheme", listTheme);
			
			// 해당 테마를 가지고 있는 , tagDTO 확인
			List<TagDTO> listTag = adminMapper.listThemeTag(theme_num);
			if(listTag.size() == 0) { // 가지고 있는 tagDTO 가 없는 경우
				mav.addObject("msg", "테마 DB 삭제 성공! 테마 목록 페이지로 이동합니다.");
			}else { // 가지고 있는 tagDTO 가 있는 경우
				//해당 테마를 가지고 있는, tagDTO 삭제 (보드게임 테마)
				int res2 = adminMapper.deleteThemeTag(theme_num);
				if(res2>0) { // tagDTO 삭제 성공
					mav.addObject("msg", "테마 DB/태그 DB 삭제 성공! 테마 목록 페이지로 이동합니다.");
				}else { // tagDTO 삭제 실패
					mav.addObject("msg", "테마 DB 삭제 성공! 태그 DB 삭제 실패! 테마 목록 페이지로 이동합니다.");
				}
			}
		}else {
			mav.addObject("msg", "테마 DB 삭제 실패! 테마 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_theme_list.do?theme_num=0");
		return mav;
	}
	
}
