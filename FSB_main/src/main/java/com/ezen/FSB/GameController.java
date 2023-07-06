package com.ezen.FSB;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

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

import com.ezen.FSB.dto.GameDTO;
import com.ezen.FSB.dto.GameLikeDTO;
import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.dto.ReportDTO;
import com.ezen.FSB.dto.ReviewDTO;
import com.ezen.FSB.dto.TagDTO;
import com.ezen.FSB.dto.ThemeDTO;
import com.ezen.FSB.service.AdminMapper;
import com.ezen.FSB.service.GameMapper;

@Controller
public class GameController {
	
	@Autowired
	private GameMapper gameMapper;
	
	@Autowired
	private AdminMapper adminMapper;
	
	// 게임 리스트
	@RequestMapping("game_list.do")
	public ModelAndView game_list(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("game/game_list");
		List<GameDTO> list = gameMapper.listGame();
		mav.addObject("listGame", list);
		List<ThemeDTO> tlist = adminMapper.listTheme();
		mav.addObject("listTheme", tlist);
		return mav;

	}

	// 검색 시 찾기
	@RequestMapping("game_find.do")
	public ModelAndView game_find(HttpServletRequest req, String searchString) {
		System.out.println(searchString);
		ModelAndView mav = new ModelAndView("game/game_list");

		List<GameDTO> list = gameMapper.findGame(searchString);
		mav.addObject("listGame", list);
		List<ThemeDTO> tlist = adminMapper.listTheme();
		mav.addObject("listTheme", tlist);
		return mav;
	}

	// 상세보기 체크 시 찾기
	@RequestMapping("game_checkFind.do")
	public ModelAndView game_checkFind(@RequestParam(required=false, name="theme") List<String> theme, @RequestParam(required=false, name="game_level") List<String> game_level, @RequestParam(required=false, name="game_player") List<String> game_player) {
//		for(String t : tag) {
//			System.out.println(t);
//		}
//		
//		for(String l : game_level) {
//			System.out.println(l);
//		}
//		
//		for(String p : game_player) {
//			System.out.println(p);
//		}
		
		ModelAndView mav = new ModelAndView("game/game_list");
		// 테마 가져오기
		List<ThemeDTO> tlist = adminMapper.listTheme();
		mav.addObject("listTheme", tlist);
		
		// 승미가 해준 상세보기 검색(코드 뜯어보기)
		List<GameDTO> tlist2 = null;

	    List<GameDTO> resultList = new ArrayList<GameDTO>();
	    Hashtable<Integer, GameDTO> ht = new Hashtable<Integer, GameDTO>();
	    if(theme == null) {
	         
	    } else if (theme.size() != 0) {
	       for(String t : theme) {
	          System.out.println(t);
	          tlist2 = gameMapper.checkListGame1(Integer.parseInt(t));
	          for(GameDTO dto : tlist2) {
	             ht.put(dto.getGame_num(), dto);
	          }
	       }
	    }
	    if(game_player == null) {
	         
	    } else if (game_player.size() != 0) {
	       for(String p : game_player) {
	          System.out.println(p);
	          tlist2 = gameMapper.checkListGame2(Integer.parseInt(p));
	          for(GameDTO dto : tlist2) {
	             ht.put(dto.getGame_num(), dto);
	          }
	       }
	    }
	    if(game_level == null) {
	         
	    } else if (game_level.size() != 0) {
	       for(String l : game_level) {
	          System.out.println(l);
	          tlist2 = gameMapper.checkListGame3(Integer.parseInt(l));
	          for(GameDTO dto : tlist2) {
	             ht.put(dto.getGame_num(), dto);
	          }
	       }
	    }
	      
	    Enumeration enu = ht.keys();
	    while(enu.hasMoreElements()) {
	       int key = (int)enu.nextElement();
	       GameDTO dto = ht.get(key);
	       resultList.add(dto);
	    }
	    mav.addObject("listGame", resultList);
		return mav;
	}

	// 이름 순, 인원 순, 별점 순, 좋아요 순 정렬
	@RequestMapping("game_sort.do")
	public ModelAndView game_sort(String sort) {
		ModelAndView mav = new ModelAndView();
		if (sort.equals("game_name")) {
			List<GameDTO> list = gameMapper.sortGame1(sort);
			mav.setViewName("game/game_list");
			mav.addObject("listGame", list);
		} else if (sort.equals("game_player")) {
			List<GameDTO> list = gameMapper.sortGame2(sort);
			mav.setViewName("game/game_list");
			mav.addObject("listGame", list);
		} else if (sort.equals("game_starrating")) {
			List<GameDTO> list = gameMapper.sortGame3(sort);
			mav.setViewName("game/game_list");
			mav.addObject("listGame", list);
		} else {
			// 좋아요 데이터 설정 후 다시 체크하기(지금은 데이터가 없어서 누르면 500)
			List<GameDTO> list = gameMapper.sortGame4(sort);
			mav.setViewName("game/game_list");
			mav.addObject("listGame", list);
		}
		List<ThemeDTO> tlist = adminMapper.listTheme();
		mav.addObject("listTheme", tlist);
		return mav;
	}
	
	// 게임 상세보기
	@RequestMapping("game_view.do")
	public ModelAndView game_view(HttpServletRequest req, int game_num, String sort) {
		System.out.println("안녕 게임넘버" + game_num);
		ModelAndView mav = new ModelAndView();
			
		// 게임 상세정보
		GameDTO dto = gameMapper.getGame(game_num);
			
		// 좋아요 총 개수
		int likeCount = gameMapper.gameLikeCount(game_num);
		mav.addObject("likeCount", likeCount);
//		if (likeCount != 0) {
//			dto.setGame_like(likeCount);
			// gameDTO에 game_like update하기
//			Map<String, Integer> params3 = new HashMap<>();
//			params3.put("game_like", likeCount);
//			params3.put("game_num", game_num);
//			int likeUpdate = gameMapper.gameLikeUpdate(params3);
//		}
			
		mav.addObject("getGame", dto);
			
		// 게임 좋아요를 누른 회원이면 빨간하트, 누르지 않은 회원이면 빈 하트 표현
		HttpSession session = req.getSession();
		MemberDTO dto2 = (MemberDTO)session.getAttribute("login_mem");
		int mem_num;
		if (dto2 == null) {	// 로그인을 안했을 떄
			mem_num = 0;
		} else {	// 로그인 시 멤버 넘버 가져오기
			mem_num = dto2.getMem_num();
		}

		Map<String, Integer> params2 = new HashMap<>();
		params2.put("game_num", game_num);
		params2.put("mem_num", mem_num);
			
		List<GameLikeDTO> likeDTO = gameMapper.likeCheckMem(params2);
		if(likeDTO.size() > 0) {	// size가 0보다 크면 빨간하트
			mav.addObject("like", 1);
		} else {					// 빈하트
			mav.addObject("like", 0);
		}
			
			
		// 게임 태그 가져오기
		List<ThemeDTO> tlist = adminMapper.listTheme();
		mav.addObject("listTheme", tlist);
		List<TagDTO> tagList = gameMapper.gameTag(game_num);
		mav.addObject("gameTag", tagList);

			
		// 게임 상세보기에서의 한줄평 별점 평균
		int count = gameMapper.getCount(game_num);

		if (count != 0) {
		int reviewAvg = gameMapper.reviewAvg(game_num);
		System.out.println("평균 어딨니" + reviewAvg);
			mav.addObject("reviewAvg", reviewAvg);
			mav.addObject("count", count);
		}
			
		// 한줄평 보기(페이지 번호 같이, 최신 순/오래된 순/별점 높은 순/별점 낮은 순 정렬 같이)
		int pageSize = 15;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
//		int count = gameMapper.getCount(game_num);
		if (endRow > count)
			endRow = count;
		Map<String, Integer> params = new HashMap<>();
		params.put("start", startRow);
		params.put("end", endRow);
		params.put("game_num", game_num);
		List<ReviewDTO> list = null;
		if (count > 0) {
			if (sort.equals("review_regdate1")) {
				list = gameMapper.sortReview1(params);
			} else if (sort.equals("review_regdate2")) {
				list = gameMapper.sortReview2(params);
			} else if (sort.equals("review_starrating1")) {
				list = gameMapper.sortReview3(params);
			} else if (sort.equals("review_starrating2")){
				list = gameMapper.sortReview4(params);
			} else {	// sort = "all"
				list = gameMapper.listReview(params);
			}
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;

			if (endPage > pageCount)
				endPage = pageCount;
			mav.addObject("startPage", startPage);
			mav.addObject("count", count);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("pageCount", pageCount);
			mav.addObject("listReview", list);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		mav.addObject("rowNum", rowNum);
		mav.setViewName("game/game_view");
		mav.addObject("game_num", game_num);
		return mav;
	}
		
	// 게임 좋아요 기능
	@ResponseBody
	@RequestMapping(value = "gameLike.do")
	public ModelAndView gameLike(HttpServletRequest req, int game_num) {
		HttpSession session = req.getSession();
		MemberDTO dto2 = (MemberDTO)session.getAttribute("login_mem");
		GameLikeDTO dto = new GameLikeDTO();

		System.out.println("ajax게임번호" + game_num);
		dto.setMem_num(dto2.getMem_num());
		dto.setGame_num(game_num);
		
		ModelAndView mav = new ModelAndView();
		int res = gameMapper.GameLike(dto);
		System.out.println(res);
		if (res > 0) {
			GameDTO dto3 = new GameDTO();
			int likeCount = gameMapper.gameLikeCount(game_num);
			dto3.setGame_likeCount(likeCount);
			// gameDTO에 game_likeCount update하기
			Map<String, Integer> params = new HashMap<>();
			params.put("game_likeCount", dto3.getGame_likeCount());
			params.put("game_num", game_num);
			int likeUpdate = gameMapper.gameLikeUpdate(params);
		}
		mav.addObject("like", 1);
		
		return mav;
	}
	
	// 게임 좋아요 해제 기능
	@ResponseBody
	@RequestMapping(value = "gameLikeDelete.do")
	public ModelAndView gameLikeDelete(HttpServletRequest req, int game_num) {
		HttpSession session = req.getSession();
		MemberDTO dto2 = (MemberDTO)session.getAttribute("login_mem");
		GameLikeDTO dto = new GameLikeDTO();
		
		System.out.println("ajax게임번호delete" + game_num);

		Map<String, Integer> params = new HashMap<>();
		params.put("game_num", game_num);
		params.put("mem_num", dto2.getMem_num());
		ModelAndView mav = new ModelAndView();
		int res = gameMapper.gameLikeDelete(params);
		if (res > 0) {
			GameDTO dto3 = new GameDTO();
			int likeCount = gameMapper.gameLikeCount(game_num);
			System.out.println("delete의 likeCount" + likeCount);
			dto3.setGame_likeCount(likeCount);
			// gameDTO에 game_like update하기
			Map<String, Integer> params2 = new HashMap<>();
			params2.put("game_likeCount", dto3.getGame_likeCount());
			params2.put("game_num", game_num);
			int likeUpdate = gameMapper.gameLikeUpdate(params2);
		}
		return mav;
	}

	// 한줄평 등록
	@RequestMapping("review_input.do")
	public ModelAndView review_input(HttpServletRequest req, @ModelAttribute ReviewDTO dto, BindingResult result)
			throws Exception {
		if (result.hasErrors()) {
		}
		
		HttpSession session = req.getSession();
		MemberDTO dto2 = (MemberDTO)session.getAttribute("login_mem");
		// MemberDTO에 있는 Mem_num으로 ReviewDTO에 넣어주기
		dto.setMem_num(dto2.getMem_num());
		
		String review_starrating = req.getParameter("review_starrating");
		/* System.out.println(review_starrating); */
		ModelAndView mav = new ModelAndView("message");
		System.out.println("제발 와주세요" + dto.getGame_num());

		int res = gameMapper.insertReview(dto);
		/* System.out.println(res); */
		if (res > 0) {
			mav.addObject("msg", "한줄평이 등록되었습니다.");
			mav.addObject("url", "game_view.do?game_num=" + dto.getGame_num() + "&sort=all");
			mav.addObject("review_starrating", Integer.parseInt(review_starrating));
		} else {
			mav.addObject("msg", "한줄평 등록 실패, 다시 입력해 주세요");
			mav.addObject("url", "game_view.do?game_num=" + dto.getGame_num() + "&sort=all");
		}
		return mav;
	}

	// 한줄평 삭제
	@RequestMapping("review_delete.do")
	public ModelAndView review_delete(HttpServletRequest req, int review_num, int game_num) {
		ModelAndView mav = new ModelAndView("message");
		System.out.println(review_num);
		System.out.println("넘버야 넘어와"+ game_num);
		int res = gameMapper.deleteReview(review_num);
		if (res > 0) {
			mav.addObject("msg", "한줄평이 삭제되었습니다.");
			mav.addObject("url", "game_view.do?game_num=" + game_num + "&sort=all");
		} else {
			mav.addObject("msg", "한줄평 삭제 실패, 관리자에게 문의해 주세요");
			mav.addObject("url", "game_view.do?game_num=" + game_num + "&sort=all");
		}
		return mav;
	}

	// 한줄평 신고(jsp)
	@RequestMapping("report.do")
	public ModelAndView report(HttpServletRequest req, int game_num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("넘버야 왔니?" + game_num);
		int pageSize = 15;
		String pageNum = req.getParameter("pageNum");
		System.out.println(pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = gameMapper.getCount(game_num);
		if (endRow > count)
			endRow = count;
		Map<String, Integer> params = new HashMap<>();
		params.put("start", startRow);
		params.put("end", endRow);
		params.put("game_num", game_num);
		List<ReviewDTO> list = null;
		if (count > 0) {
			list = gameMapper.listReview(params);
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;

			if (endPage > pageCount)
				endPage = pageCount;
			mav.addObject("startPage", startPage);
			mav.addObject("count", count);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("pageCount", pageCount);
			mav.addObject("listReview", list);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		mav.addObject("rowNum", rowNum);
		mav.setViewName("game/report");
		mav.addObject("game_num", game_num);
		return mav;
	}

	// 한줄평 신고
	@RequestMapping("review_report.do")
	public ModelAndView review_report(HttpServletRequest req, @ModelAttribute ReportDTO dto, int review_num, int review_report) {
		System.out.println("신고 review_num" + review_num);
		ModelAndView mav = new ModelAndView("closeWindow");
//		System.out.println(dto.getReview_num());
//		System.out.println(dto.getReview_report());
		HttpSession session = req.getSession();
		MemberDTO dto2 = (MemberDTO)session.getAttribute("login_mem");
		dto.setMem_num(dto2.getMem_num());
		dto.setReport_content(review_report);
		dto.setReport_target(review_num);
		dto.setReport_mode("보드게임한줄평");
		int reportDTO = gameMapper.GameReviewReport(dto);
		int res = gameMapper.updateReviewReport(review_num);
		if (res > 0) {
			mav.addObject("msg", "신고되었습니다.");
			mav.addObject("url", "game_view.do");
		} else {
			mav.addObject("msg", "신고 실패, 관리자에게 문의해 주세요");
			mav.addObject("url", "game_view.do");
		}
		return mav;
	}

	// 게임 테마태그
	@RequestMapping("game_tag.do")
	public String game_tag() {
		return "game/game_tag";
	}
}
