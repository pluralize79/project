package com.ezen.FSB;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.FSB.dto.BoardDTO;
import com.ezen.FSB.dto.Board_replyDTO;
import com.ezen.FSB.dto.NoticeDTO;
import com.ezen.FSB.dto.ReportDTO;
import com.ezen.FSB.dto.SH_boardDTO;
import com.ezen.FSB.dto.SH_board_replyDTO;
import com.ezen.FSB.service.AdminMapper;
import com.ezen.FSB.service.BoardMapper;

@Controller
public class Admin_BoardController { // 관리자 - 커뮤니티 Controller

	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	BoardMapper boardMapper;
	
	// 커뮤니티 공지글 목록
	@RequestMapping("/admin_board_notice_list.do")
	public ModelAndView listBNotice(@RequestParam Map<String, String> params) {
		String mode = params.get("mode");
		String sort = params.get("sort");
		
		ModelAndView mav = new ModelAndView("admin/board_notice_list");
		
		List<NoticeDTO> listBNotice = null;
		
		if(mode.equals("all")) { // 전체보기
			if(sort.equals("all")) { // 기본 정렬
				listBNotice = adminMapper.listBNotice();
			}else {
				System.out.println("소트");
				listBNotice = adminMapper.sortBNotice(sort);
			}
		}else { // 찾기
			listBNotice = adminMapper.findBNotice(params);
		}
		mav.addObject("listBNotice", listBNotice);
		return mav;
	}
	// 커뮤니티 공지글 상세보기
	@RequestMapping("/admin_board_notice_view.do")
	public ModelAndView getBNotice(@RequestParam int n_num) {
		NoticeDTO dto = adminMapper.getNotice(n_num);
		return new ModelAndView("admin/board_notice_view", "getNotice", dto);
	}
	// 커뮤니티 공지글 수정 폼
	@RequestMapping(value="/admin_board_notice_update.do", method=RequestMethod.GET)
	public ModelAndView updateBNotice(@RequestParam int n_num) {
		NoticeDTO dto = adminMapper.getNotice(n_num);
		return new ModelAndView("admin/board_notice_update", "getNotice", dto);
	}
	// 커뮤니티 공지글 수정 처리
	@RequestMapping(value="/admin_board_notice_update.do", method=RequestMethod.POST)
	public ModelAndView updateOkBNotice(@ModelAttribute NoticeDTO dto, BindingResult result) {
		if(result.hasErrors()) {}
		
		int res = adminMapper.updateNotice(dto);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "게시판 공지글 수정 성공! 해당 게시글 보기 페이지로 이동합니다.");
			mav.addObject("url", "admin_board_notice_view.do?n_num="+dto.getN_num());
		}else {
			mav.addObject("msg", "게시판 공지글 수정 실패! 해당 게시글 수정 페이지로 이동합니다.");
			mav.addObject("url", "admin_board_notice_update.do?n_num="+dto.getN_num());
		}
		return mav;
	}
	// 커뮤니티 공지글 등록 폼
	@RequestMapping(value="/admin_board_notice_insert.do", method=RequestMethod.GET)
	public String insertBNotice() {
		return "admin/board_notice_insert";
	}
	// 커뮤니티 공지글 등록 처리
	@RequestMapping(value="/admin_board_notice_insert.do", method=RequestMethod.POST)
	public ModelAndView insertOkBNotice(@ModelAttribute NoticeDTO dto, BindingResult result) {
		if(result.hasErrors()) {}
		
		int res = adminMapper.insertNotice(dto);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "게시판 공지글 등록 성공! 게시글 목록 페이지로 이동합니다.");
			mav.addObject("url", "admin_board_notice_list.do?mode=all&sort=all");
		}else {
			mav.addObject("msg", "게시판 공지글 등록 실패! 게시글 등록 페이지로 이동합니다.");
			mav.addObject("url", "admin_board_notice_insert.do");
		}
		return mav;
	}
	// 커뮤니티 공지글 삭제 처리
	@RequestMapping("/admin_board_notice_delete.do")
	public ModelAndView deleteBNotice(@RequestParam int n_num) {
		int res = adminMapper.deleteNotice(n_num);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "게시판 공지글 삭제 성공! 게시글 목록 페이지로 이동합니다.");
		}else {
			mav.addObject("msg", "게시판 공지글 삭제 실패! 게시글 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_board_notice_list.do?mode=all&sort=all");
		return mav;
		
	}
	// 게시판 목록
	@RequestMapping("/admin_board_list.do")
	public ModelAndView listBoard(HttpServletRequest req, @RequestParam Map<String, Integer> params, @RequestParam String view) {
		
		ModelAndView mav = null;
		
		if(view.equals("free")) { // 자유
			mav = new ModelAndView("admin/board_list_free");
		}else if(view.equals("anony")) { // 익명
			mav = new ModelAndView("admin/board_list_anony");
		}else { // 중고
			mav = new ModelAndView("admin/board_list_sh");
		}
		
		//페이지 넘버
		int pageSize = 5;
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count;
		if(view.equals("free")) { // 자유
			count = boardMapper.getCountBoard();
		}else if(view.equals("anony")) { // 익명
			count = boardMapper.getCountBoard_anony();
		}else { // 중고
			count = boardMapper.getCountBoard_sh("all");
		}
		params.put("start", startRow);
		params.put("end", endRow);
		
		if (endRow > count)
			endRow = count;
		
		if (count > 0) {
			if(view.equals("free")) { // 자유
				List<BoardDTO> list = adminMapper.listFreeBoard(params);
				mav.addObject("listBoard", list);
			}else if(view.equals("anony")) { // 익명
				List<BoardDTO> list = adminMapper.listAnonyBoard(params);
				mav.addObject("listBoard", list);
			}else { // 중고
				List<SH_boardDTO> list = adminMapper.listSHBoard(params);
				mav.addObject("listBoard", list);
			}
			
			int pageCount = (count / pageSize) + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 2;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;

			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("pageCount", pageCount);
		}
		mav.addObject("count", count);
		
		return mav;
	}
	
	// 게시판 글 삭제
	@RequestMapping("/admin_board_delete.do")
	public ModelAndView deleteBoard(HttpServletRequest req, @RequestParam int board_num, @RequestParam Map<String, String> params) {
		
		ModelAndView mav = new ModelAndView("message");
		// 이미지 경로
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		
		String view = params.get("view"); // 어느 게시판에서 왔는지
		// 받은 img 이름
		String board_img1 = params.get("board_img1");
		String board_img2 = params.get("board_img2");
		String board_img3 = params.get("board_img3");
		String board_img4 = params.get("board_img4");
		// img 로 파일 객체 생성&삭제
		if(board_img1 != null) {
			File file1 = new File(upPath, board_img1);
			if (file1.exists()){
				file1.delete();
				System.out.println("이미지1 삭제 성공");
			}else {
				mav.addObject("msg", "이미지1 삭제 실패! 게시판 목록 페이지로 이동합니다.");
				mav.addObject("url", "admin_board_list.do?view="+view);
				return mav;
			}
		}
		if(board_img2 != null) {
			File file2 = new File(upPath, board_img2);
			if (file2.exists()){
				file2.delete();
				System.out.println("이미지2 삭제 성공");
			}else {
				mav.addObject("msg", "이미지2 삭제 실패! 게시판 목록 페이지로 이동합니다.");
				mav.addObject("url", "admin_board_list.do?view="+view);
				return mav;
			}
		}
		if(board_img3 != null) {
			File file3 = new File(upPath, board_img3);
			if (file3.exists()){
				file3.delete();
				System.out.println("이미지3 삭제 성공");
			}else {
				mav.addObject("msg", "이미지3 삭제 실패! 게시판 목록 페이지로 이동합니다.");
				mav.addObject("url", "admin_board_list.do?view="+view);
				return mav;
			}
		}
		if(board_img4 != null) {
			File file4 = new File(upPath, board_img4);
			if (file4.exists()){
				file4.delete();
				System.out.println("이미지4 삭제 성공");
			}else {
				mav.addObject("msg", "이미지4 삭제 실패! 게시판 목록 페이지로 이동합니다.");
				mav.addObject("url", "admin_board_list.do?view="+view);
				return mav;
			}
		}
		
		// 댓글 삭제 전에 list 미리 뽑기
		List<Board_replyDTO> listR = null;
		List<SH_board_replyDTO> listSHR = null;
		if(view.equals("secondhand")) {
			listSHR = adminMapper.listBoardSHReply(board_num);
		}else {
			listR = adminMapper.listBoardReply(board_num);
		}
		
			if(view.equals("free")||view.equals("anony")) { // 자유 , 익명
				List<Board_replyDTO> list = adminMapper.listBoardReply(board_num);
				if(list.size() != 0) { // 댓글이 있다면
					int res2 = boardMapper.deleteReplyAll(board_num);
					if(res2>0) {
						// DB 삭제
						int res = boardMapper.deleteBoard(board_num);
						if(res>0) {
							mav.addObject("msg", "이미지/게시글/댓글 삭제 성공! 게시판 목록 페이지로 이동합니다.");
						}else {
							mav.addObject("msg", "이미지/댓글 삭제 성공! 게시글 삭제 실패! 게시판 목록 페이지로 이동합니다.");
						}
					}else {
						mav.addObject("msg", "이미지 삭제 성공! 댓글 삭제 실패! 게시판 목록 페이지로 이동합니다.");
					}
				}else { // 댓글이 없다면
					// DB 삭제
					int res = boardMapper.deleteBoard(board_num);
					if(res>0) {
						mav.addObject("msg", "이미지/게시글 삭제 성공! 게시판 목록 페이지로 이동합니다.");
					}else {
						mav.addObject("msg", "이미지 삭제 성공! 게시글 삭제 실패! 게시판 목록 페이지로 이동합니다.");
					}
				}
			}else { // 중고
				List<SH_board_replyDTO> list = adminMapper.listBoardSHReply(board_num);
				if(list.size() != 0) { // 댓글이 있다면
					int res2 = boardMapper.deleteReplyAll_sh(board_num);
					if(res2>0) {
						// DB 삭제
						int res = boardMapper.deleteBoard_sh(board_num);
						if(res>0) {
							mav.addObject("msg", "이미지/게시글/댓글 삭제 성공! 게시판 목록 페이지로 이동합니다.");
						}else {
							mav.addObject("msg", "이미지/댓글 삭제 성공! 게시글 삭제 실패! 게시판 목록 페이지로 이동합니다.");
						}
					}else {
						mav.addObject("msg", "이미지 삭제 성공! 댓글 삭제 실패! 게시판 목록 페이지로 이동합니다.");
					}
				}else { // 댓글이 없다면
					// DB 삭제
					int res = boardMapper.deleteBoard_sh(board_num);
					if(res>0) {
						mav.addObject("msg", "이미지/게시글 삭제 성공! 게시판 목록 페이지로 이동합니다.");
					}else {
						mav.addObject("msg", "이미지 삭제 성공! 게시글 삭제 실패! 게시판 목록 페이지로 이동합니다.");
					}
				}
			}
		// 게시글 신고 처리
		List<ReportDTO> list = null;
		if(view.equals("secondhand")) { // 중고 게시글
			list = adminMapper.listReportBoard_sh(board_num);
		}else { // 익명, 자유 게시글
			list = adminMapper.listReportBoard(board_num);
		}
		if(list.size() >0) { // 신고 내역이 있다면 처리여부 0 -> 1
			if(view.equals("secondhand")) { // 중고 게시글
				int res = adminMapper.checkReportBoard_sh(board_num);
				if(res>0) {
					System.out.println("게시글 신고 처리여부 적용 완료");
				}else {
					System.out.println("게시글 신고 처리여부 적용 실패");
				}
			}else { // 익명, 자유 게시글
				int res = adminMapper.checkReportBoard(board_num);
				if(res>0) {
					System.out.println("게시글 신고 처리여부 적용 완료");
				}else {
					System.out.println("게시글 신고 처리여부 적용 실패");
				}
			}
		}
		// 게시글의 댓글 신고 내역 삭제 처리
		if(view.equals("secondhand")) { // 중고
			for(SH_board_replyDTO dto : listSHR) {
				int br_num = dto.getBr_num();
				System.out.println(br_num);
				adminMapper.delReportBr_sh(br_num);
			}
		}else { // 익명, 자유
			for(Board_replyDTO dto : listR) {
				int br_num2 = dto.getBr_num();
				System.out.println(br_num2);
				adminMapper.delReportBr(br_num2);
			}
		}
		mav.addObject("url", "admin_board_list.do?view="+view);
		return mav;
	}
	// 게시판 글 상세보기
	@RequestMapping("/admin_board_view.do")
	public ModelAndView getBoard(@RequestParam int board_num, @RequestParam String view, @RequestParam String sort) {
		ModelAndView mav = null;
	
		int count = 0;
		
		if(view.equals("secondhand")) { // 중고
			mav = new ModelAndView("admin/board_sh_view");
			SH_boardDTO dto = adminMapper.getBoardSH(board_num);
			mav.addObject("getBoard", dto);
			// 댓글 리스트
			List<SH_board_replyDTO> getBoardReply = null;
			if(sort.equals("report")) { // 신고내역만 보기
				getBoardReply = adminMapper.listBoardSHReplyReport(board_num);
			}else { // 전체 보기
				getBoardReply = adminMapper.listBoardSHReply(board_num);
			}
			mav.addObject("getBoardReply", getBoardReply);
			// 댓글 수
			count = boardMapper.getCountReply_sh(board_num);
			mav.addObject("count", count);
			mav.addObject("view", view);
		}else { // 자유, 익명
			mav = new ModelAndView("admin/board_view");
			System.out.println("자유, 익명");
			BoardDTO dto = adminMapper.getBoard(board_num);
			mav.addObject("getBoard", dto);
			// 댓글 리스트
			List<Board_replyDTO> getBoardReply = null;
			if(sort.equals("report")) { // 신고 내역만 보기
				getBoardReply = adminMapper.listBoardReplyReport(board_num);
			}else { // 전체 보기
				getBoardReply = adminMapper.listBoardReply(board_num);
			}
			mav.addObject("getBoardReply", getBoardReply);
			// 댓글 수
			count = boardMapper.getCountReply(board_num);
			mav.addObject("count", count);
			mav.addObject("view", view);
		}
		return mav;
	}
	// 게시판 댓글 신고내역 보기
	@RequestMapping("/admin_br_report_list.do")
	public ModelAndView listBoardReplyReport (@RequestParam String view, @RequestParam int br_num) {
		
		ModelAndView mav = new ModelAndView("admin/board_report_list");
		List<ReportDTO> list = null;
		if(view.equals("secondhand")) { // 중고의 댓글 신고내역
			list = adminMapper.listReportBr_sh(br_num);
		}else { // 자유, 익명 의 댓글 신고내역
			list = adminMapper.listReportBr(br_num);
		}
		mav.addObject("listReport", list);
		return mav;
	}
	// 게시판 신고내역 보기
	@RequestMapping("/admin_board_report_list.do")
	public ModelAndView listBoardReport (@RequestParam String view, @RequestParam int board_num) {
		
		ModelAndView mav = new ModelAndView("admin/board_report_list");
		List<ReportDTO> list = null;
		if(view.equals("secondhand")) { // 중고 신고내역
			list = adminMapper.listReportBoard_sh(board_num);
		}else { // 익명, 자유 신고내역
			list  = adminMapper.listReportBoard(board_num);
		}
		mav.addObject("listReport", list);
		return mav;
	}
	// 게시글 신고 취소
	@RequestMapping("/admin_board_report_del.do")
	public ModelAndView delBoardReport (@RequestParam String view, @RequestParam int board_num) {
		ModelAndView mav = new ModelAndView("message");
		if(view.equals("secondhand")) { // 중고 신고 취소
			// report 신고 내역에서 지우기
			int res = adminMapper.delReportBoard_sh(board_num);
			if(res>0) {
				// 해당 board_report -> 0
				int res2 = adminMapper.updateReportBoard_sh(board_num);
				if(res2>0) {
					mav.addObject("msg","게시글 신고 내역 삭제/게시글 신고 취소 성공!");
				}else {
					mav.addObject("msg","게시글 신고 내역 삭제 성공! 게시글 신고 취소 실패!");
				}
			}else {
				mav.addObject("msg","게시글 신고 내역 삭제 실패!");
			}
		}else { // 익명, 자유 신고 취소
			// report 신고 내역에서 지우기
			int res = adminMapper.delReportBoard(board_num);
			if(res>0) {
				// 해당 board_report -> 0
				int res2 = adminMapper.updateReportBoard(board_num);
				if(res2>0) {
					mav.addObject("msg","게시글 신고 내역 삭제/게시글 신고 취소 성공!");
				}else {
					mav.addObject("msg","게시글 신고 내역 삭제 성공! 게시글 신고 취소 실패!");
				}
			}else {
				mav.addObject("msg","게시글 신고 내역 삭제 실패!");
			}
		}
		mav.addObject("url", "admin_board_view.do?sort=all&board_num="+board_num+"&view="+view);
		return mav;
	}
	// 게시글 댓글 신고 취소
	@RequestMapping("/admin_br_report_del.do")
	public ModelAndView delBrReport (@RequestParam int br_num, @RequestParam int board_num, @RequestParam String view) {
		ModelAndView mav = new ModelAndView("message");
		
		if(view.equals("secondhand")) { // 중고 게시글 댓글
			// report 신고 내역에서 지우기
			int res = adminMapper.delReportBr_sh(br_num);
			if(res>0) {
				// 해당 br 에서 report -> 0
				int res2 = adminMapper.updateReportBr_sh(br_num);
				if(res2>0) {
					mav.addObject("msg","게시글 신고 내역 삭제/게시글 신고 취소 성공!");
				}else {
					mav.addObject("msg","게시글 신고 내역 삭제 성공! 게시글 신고 취소 실패!");
				}
			}else {
				mav.addObject("msg","게시글 신고 내역 삭제 실패!");
			}
		}else { // 자유, 익명 게시글 댓글
			// report 신고 내역에서 지우기
			int res = adminMapper.delReportBr(br_num);
			if(res>0) {
				// 해당 br 에서 report -> 0
				int res2 = adminMapper.updateReportBr(br_num);
				if(res2>0) {
					mav.addObject("msg","게시글 신고 내역 삭제/게시글 신고 취소 성공!");
				}else {
					mav.addObject("msg","게시글 신고 내역 삭제 성공! 게시글 신고 취소 실패!");	
				}
			}else {
				mav.addObject("msg","게시글 신고 내역 삭제 실패!");	
			}
		}
		mav.addObject("url","admin_board_view.do?sort=all&board_num="+board_num+"&view="+view);
		return mav;
	}
	// 게시판 댓글 삭제
	@RequestMapping("/admin_br_delete.do")
	public ModelAndView deleteBoardReply(@RequestParam int br_num, @RequestParam int board_num, @RequestParam String view) {
		
		ModelAndView mav = new ModelAndView("message");
		if(view.equals("secondhand")) { // 중고 게시판 댓글
			List<ReportDTO> list = adminMapper.listReportBr_sh(br_num);
			if(list.size() >0) { // 신고내역이 있다면
				// 신고 처리여부 0 -> 1
				int res = adminMapper.checkReportBr_sh(br_num);
				if(res>0) {
					System.out.println("신고처리 적용 완료");
				}else {
					System.out.println("신고처리 적용 실패");
				}
			}
			// 댓글 삭제
			int res2 = adminMapper.delBr_sh(br_num);
			if(res2>0) {
				mav.addObject("msg", "해당 댓글 삭제 성공!");
			}else {
				mav.addObject("msg", "해당 댓글 삭제 실패!");
			}
		}else { // 익명, 자유 게시판 댓글
			List<ReportDTO> list = adminMapper.listReportBr(br_num);
			if(list.size()>0) { // 신고내역이 있다면
				// 신고 처리 여부 0 -> 1
				int res = adminMapper.checkReportBr(br_num);
				if(res>0) {
					System.out.println("신고 처리 적용 완료");
				}else {
					System.out.println("신고처리 적용 실패");
				}
			}
			// 댓글 삭제
			int res2 = adminMapper.delBr(br_num);
			if(res2>0) {
				mav.addObject("msg", "해당 댓글 삭제 성공!");
			}else {
				mav.addObject("msg", "해당 댓글 삭제 실패!");
			}
		}
		mav.addObject("url","admin_board_view.do?sort=all&board_num="+board_num+"&view="+view);
		return mav;
	}
}
