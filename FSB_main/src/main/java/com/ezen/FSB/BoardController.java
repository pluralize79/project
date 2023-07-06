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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.FSB.dto.BoardDTO;
import com.ezen.FSB.dto.Board_replyDTO;
import com.ezen.FSB.dto.GameDTO;
import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.dto.NoticeDTO;
import com.ezen.FSB.dto.ReportDTO;
import com.ezen.FSB.dto.SH_boardDTO;
import com.ezen.FSB.dto.SH_board_replyDTO;
import com.ezen.FSB.dto.ThemeDTO;
import com.ezen.FSB.service.BoardMapper;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardMapper boardMapper;

	@Resource(name = "uploadPath")
	private String upPath;
	
	
	
	//자유게시판 리스트 
	@RequestMapping("/board_free.do")
	public ModelAndView board_free_list(HttpServletRequest req, java.util.Map<String, Integer> params) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		session.setAttribute("upPath", session.getServletContext().getRealPath("resources/images"));
		//공지사항 리스트 
		String mode = req.getParameter("mode");
		List<NoticeDTO> nlist =boardMapper.nlistBoard(mode);
		
		//페이지 넘버
		int pageSize = 10;
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = boardMapper.getCountBoard();
		params.put("start", startRow);
		params.put("end", endRow);

		if (endRow > count)
			endRow = count;
		List<BoardDTO> list = null;
		if (count > 0) {
			list = boardMapper.listBoard(params);
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
		mav.addObject("nlistBoard", nlist);
		mav.addObject("listBoard", list);
		mav.setViewName("board/list_free");
		return mav;
	}
	

	//익명게시판 리스트 
	@RequestMapping("/board_anony.do")
	public ModelAndView boardAnony(HttpServletRequest req, java.util.Map<String, Integer> params) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		session.setAttribute("upPath", session.getServletContext().getRealPath("resources/images"));
		
		//공지사항 리스트 
				String mode = req.getParameter("mode");
				List<NoticeDTO> nlist =boardMapper.nlistBoard(mode);
		
		//페이지 넘버
		int pageSize = 10;

		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = boardMapper.getCountBoard_anony();
		
		params.put("start", startRow);
		params.put("end", endRow);
		params.put("mode", 1);
		
		if (endRow > count)
			endRow = count;
		List<BoardDTO> list = null;

		if (count > 0) {
			list =boardMapper.listBoard(params);
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
		mav.addObject("listBoard", list);
		mav.addObject("nlistBoard", nlist);
		mav.setViewName("board/list_anony");
		return mav;
	}
	//자유게시판 작성, 익명 게시판 글작성
	@RequestMapping(value = "/write_board.do", method = RequestMethod.GET)
	public ModelAndView writeFormBoard(HttpServletRequest req, String mode) {
		int num = 0, re_group = 0, re_step = 0, re_level = 0;
		ModelAndView mav = new ModelAndView();
		String snum = req.getParameter("board_num");
		
		if (snum != null) {
			num = Integer.parseInt(snum);
			re_group = Integer.parseInt(req.getParameter("board_re_group"));
			re_step = Integer.parseInt(req.getParameter("board_re_step"));
			re_level = Integer.parseInt(req.getParameter("board_re_level"));
		}
		
		mav.addObject("board_num", num);
		mav.addObject("board_re_group", re_group);
		mav.addObject("board_re_step", re_step);
		mav.addObject("board_re_level", re_level);
		mav.addObject("mode", mode);
		
		mav.setViewName("board/writeForm");
		return mav;
	}
	//자유 익명게시판 글작성 
	@RequestMapping(value = "/write_board.do", method = RequestMethod.POST)
	public String writeProBoard(HttpServletRequest req, String mode, @ModelAttribute BoardDTO dto, BindingResult result)
			throws IllegalStateException, IOException {
		if (result.hasErrors()) {
			dto.setBoard_img1("");
			dto.setBoard_img2("");
			dto.setBoard_img3("");
			dto.setBoard_img4("");
		}
		if(mode.equals("anony")) {
			dto.setBoard_anony_check(1);
			req.setAttribute("board_anony_check",dto.getBoard_anony_check());
		}
		req.setAttribute("mode", "all");
		dto.setBoard_ip(req.getRemoteAddr());
		//이미지 받기
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("board_img1");
		MultipartFile mf2 = mr.getFile("board_img2");
		MultipartFile mf3 = mr.getFile("board_img3");
		MultipartFile mf4 = mr.getFile("board_img4");

		String board_img1 = mf.getOriginalFilename();
		String board_img2 = mf2.getOriginalFilename();
		String board_img3 = mf3.getOriginalFilename();
		String board_img4 = mf4.getOriginalFilename();

		UUID uuid = UUID.randomUUID(); //이미지 중복 시 엑스박스 방지용 랜덤 파일명

		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		session.setAttribute("upPath", upPath);
		 dto.setMem_num((Integer)session.getAttribute("mem_num"));
		 

		if (!mf.isEmpty()) { // 이미지 첨부 되어있을 시
			board_img1 = uuid.toString() + "_" + board_img1;
			File file1 = new File(upPath, board_img1);
			mf.transferTo(file1);
			dto.setBoard_img1(board_img1);
			
		} else if (mf.isEmpty()) { // 이미지 첨부 안되어있을시
			dto.setBoard_img1("");
		}
			
		 if (!mf2.isEmpty()) {
			board_img2 = uuid.toString() + "_" + board_img2;
			File file2 = new File(upPath, board_img2);
			mf2.transferTo(file2);
			dto.setBoard_img2(board_img2);
			
		} else if (mf2.isEmpty()) {
			dto.setBoard_img2("");
		}
		if (!mf3.isEmpty()) {
			board_img3 = uuid.toString() + "_" + board_img3;
			File file3 = new File(upPath, board_img3);
			mf3.transferTo(file3);
			dto.setBoard_img3(board_img3);
		} else if (mf3.isEmpty()) {
			dto.setBoard_img3("");
		}
		
		if (!mf4.isEmpty()) {
			board_img4 = uuid.toString() + "_" + board_img4;
			File file4 = new File(upPath, board_img4);
			mf4.transferTo(file4);
			dto.setBoard_img4(board_img4);
		} else {
			dto.setBoard_img4("");
		}
		
		req.setAttribute("dto", dto);
		
		int res = boardMapper.insertBoard(dto);
		if (res > 0) {
			if(mode.equals("anony")) {
				req.setAttribute("msg", "게시글 등록 성공");
				req.setAttribute("url", "board_anony.do?mode=anony");
			}else {
			req.setAttribute("msg", "게시글 등록 성공");
			req.setAttribute("url", "board_free.do?mode=");
			}
		}else {
			req.setAttribute("msg", "게시글 등록 실패");
			req.setAttribute("url", "write_board.do");
		}
		return "message";
	}
	
	//공지사항 상세보기
	
	@RequestMapping("/board_noti_content.do")
	public ModelAndView boardNotiContent(HttpServletRequest req,@RequestParam int n_num,@RequestParam String mode) {
		ModelAndView mav = new ModelAndView("/board/content_noti");
		NoticeDTO dto = boardMapper.getNotice(n_num);
		if(mode==null) {
			mode = "";
		}
		mav.addObject("mode",mode);
		mav.addObject("getNotice",dto);
		return mav;
	}
	
	//자유, 익명 게시글 상세보기
	@RequestMapping("/content_board.do")
	public ModelAndView getBoard(HttpServletRequest req, @RequestParam int board_num, @RequestParam int pageNum, @RequestParam(required = false) Map<String,Integer> params) throws IOException {

		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView("/board/content");
		
		String upPath = session.getServletContext().getRealPath("/resources/img");
		session.setAttribute("upPath", upPath);
		BoardDTO dto = boardMapper.getBoard(board_num, "content");
		
		String mode = req.getParameter("mode");
		mav.addObject("mode",mode);
		mav.addObject("getBoard", dto);
		
		// 여기부터 승미가 만짐 (매개변수 int board_num -> Map<String, Integer> params 로 바꿈
		int pageSize = 10;
		if (pageNum == 0) {
			pageNum = 1;
		}
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = boardMapper.getCountReply(board_num);
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("start", startRow);
		map2.put("end", endRow);
		map2.put("board_num", board_num);
		
		params.put("board_num",board_num);
		params.put("board_replycount",count);
		int board_replycount= boardMapper.setReply(params);

		if (endRow > count)
			endRow = count;
		List<Board_replyDTO> list = null;
		if (count > 0) {
			list = boardMapper.listReply(map2);
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
			mav.addObject("pageNum",currentPage);
			mav.addObject("board_replycount",board_replycount);
		}
		mav.addObject("count", count);
		mav.addObject("listReply", list);
		return mav;
	
	}
	//게싯글, 댓글 신고 창 띄우기
	@RequestMapping("/report_board.do")
		public ModelAndView reportBoard(HttpServletRequest req,String mode) {
			ModelAndView mav = new ModelAndView("message");
				if(mode.equals("board")) {
						mav.addObject("board_num",Integer.parseInt(req.getParameter("board_num")));
				}else if(mode.equals("reply")){
						mav.addObject("br_num",Integer.parseInt(req.getParameter("br_num")));
				}else if(mode.equals("sh_board")) {
						mav.addObject("board_num",Integer.parseInt(req.getParameter("board_num")));
				}else {
						mav.addObject("br_num",Integer.parseInt(req.getParameter("br_num")));
				}
					mav.addObject("mode",mode);
					mav.setViewName("board/reportForm");
						return mav;
	}
	//익명, 자유 게시글 , 댓글 신고 넘기기
	@RequestMapping(value="/report_board.do", method = RequestMethod.POST)
	public ModelAndView reportBoardPro(HttpServletRequest req,String mode, @ModelAttribute ReportDTO dto, BindingResult result) {
		ModelAndView mav = new ModelAndView("closeWindow");
		HttpSession session = req.getSession();
		dto.setMem_num((Integer)session.getAttribute("mem_num"));
		dto.setReport_content(Integer.parseInt(req.getParameter("board_report")));
		
		if(mode.equals("board")) {
			int board_num = Integer.parseInt(req.getParameter("board_num"));
			dto.setReport_target(board_num);
			dto.setReport_mode("자유,익명게시글");
			int reportDTO = boardMapper.report(dto);
			int res = boardMapper.reportBoard(board_num);
				if (res > 0) {
					mav.addObject("msg", "신고되었습니다.");
				} else {
					mav.addObject("msg", "신고 실패, 관리자에게 문의해 주세요");
				}
				
		}else if(mode.equals("sh_board")) {
			int board_num = Integer.parseInt(req.getParameter("board_num"));
			dto.setReport_mode("중고게시글");
			dto.setReport_target(board_num);
			int reportDTO = boardMapper.report(dto);
			int res = boardMapper.reportBoard_sh(board_num);
			if (res > 0) {
				mav.addObject("msg", "신고되었습니다.");
			} else {
				mav.addObject("msg", "신고 실패, 관리자에게 문의해 주세요");
			}
			
		}else if(mode.equals("sh_reply")) {
			int br_num = Integer.parseInt(req.getParameter("br_num"));
			dto.setReport_mode("중고댓글");
			dto.setReport_target(br_num);
			int reportDTO = boardMapper.report(dto);
			int res = boardMapper.reportReply_sh(br_num);
			if (res > 0) {
				mav.addObject("msg", "신고되었습니다.");
			} else {
				mav.addObject("msg", "신고 실패, 관리자에게 문의해 주세요");
			}
			
		}else if(mode.equals("reply")) {
			int br_num = Integer.parseInt(req.getParameter("br_num"));
			dto.setReport_mode("자유,익명댓글");
			dto.setReport_target(br_num);
			int reportDTO = boardMapper.report(dto);
			int res = boardMapper.reportReply(br_num);
				if (res > 0) {
					mav.addObject("msg", "신고되었습니다.");
				} else {
					mav.addObject("msg", "신고 실패, 관리자에게 문의해 주세요");
				}
		}
		return mav;
	}

	//댓글 삭제
		@RequestMapping("/delete_reply.do")
		public ModelAndView deleteReply(HttpServletRequest req, int board_num,int br_num, int pageNum) {
			ModelAndView mav = new ModelAndView("message");
			int res = boardMapper.deleteReply(br_num);
			if (res > 0) {
				mav.addObject("msg", "삭제 성공! ");
				mav.addObject("url",  "content_board.do?board_num="+board_num+"&pageNum="+pageNum);
			} else {
				mav.addObject("msg", "삭제 실패!");
				mav.addObject("url",  "content_board.do?board_num="+board_num+"&pageNum="+pageNum);
			}

			return mav;
		}
	
	//댓글 입력
	@RequestMapping(value = "/write_reply.do")
	public ModelAndView writeReply(HttpServletRequest req, @ModelAttribute Board_replyDTO dto, BindingResult result) {
		
		int re_group = 0, re_step = 0, re_level = 0;
		
		ModelAndView mav = new ModelAndView("message");
		int board_num = dto.getBoard_num();
		int br_num = dto.getBr_num();
		dto.setBoard_num(board_num);
		HttpSession session = req.getSession();
		String mem_nickname = (String) session.getAttribute("mem_nickname");
		dto.setMem_num((Integer)session.getAttribute("mem_num"));
		dto.setMem_nickname(mem_nickname);
	
		//대댓글일때
		if(br_num>0) {
			re_group =dto.getBr_re_group();
			re_step=dto.getBr_re_step();
			re_level=dto.getBr_re_level();
			
			System.out.println(re_group+""+re_level+""+re_step);
		}
		mav.addObject("board_num", board_num);
		mav.addObject("br_num", br_num);
		mav.addObject("br_re_group", re_group);
		mav.addObject("br_re_step", re_step);
		mav.addObject("br_re_level", re_level);
		mav.addObject("dto", dto);
		
		int res = boardMapper.insertReply(dto);
		if (res > 0) {
			mav.addObject("msg", "댓글이 등록 되었습니다.");
			mav.addObject("url", "content_board.do?pageNum=1&board_num="+board_num);
		} else {
			mav.addObject("msg", "댓글 등록 실패");
			mav.addObject("url", "content_board.do?board_num"+board_num);
		}
		return mav;
	}
//자유,익명 대댓글
	@ResponseBody
	@RequestMapping("/re_reply.do")
	public ModelAndView re_reply(HttpServletRequest req,int br_num,int pageNum,int board_num) {
		ModelAndView mav = new ModelAndView("/board/Re_replyForm");
		Board_replyDTO dto = boardMapper.getReply(br_num);
		BoardDTO bdto = boardMapper.getBoard(board_num, "getAnony");
		mav.addObject("dto",dto);
		mav.addObject("bdto",bdto);
		mav.addObject("br_num", br_num);
		mav.addObject("br_re_group",dto.getBr_re_group());
		mav.addObject("br_re_step",dto.getBr_re_step());
		mav.addObject("br_re_level",dto.getBr_re_level());
		mav.addObject("pageNum", pageNum);
		
		return mav;
	}
	//자유, 익명 댓글 수정
	@RequestMapping(value="/update_reply.do", method = RequestMethod.GET)
	public ModelAndView updateReply(HttpServletRequest req,int br_num,int pageNum) {
		ModelAndView mav = new ModelAndView("/board/updateReplyForm");
		Board_replyDTO dto = boardMapper.getReply(br_num);
		mav.addObject("dto",dto);
		mav.addObject("br_num",br_num);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/update_replyOk.do")
	public ModelAndView updateReplyPro(HttpServletRequest req, @RequestParam Map<Object, Object> params) {
		ModelAndView mav = new ModelAndView();
		String br_num = (String)params.get("br_num");
		Board_replyDTO dto = boardMapper.getReply(Integer.parseInt(br_num));
		//String pageNum = (String)params.get
		dto.setBr_content((String)params.get("br_content"));
		int res = boardMapper.updateReply(dto);
		
		return mav;
	}
	

	//게시글 삭제
	@RequestMapping("/delete_board.do")
	public ModelAndView deleteBoard(HttpServletRequest req,
			@RequestParam(required = false) Map<String, String> params) {
		int board_num = Integer.parseInt(params.get("board_num"));
		ModelAndView mav = new ModelAndView("message");

		String board_img1 = req.getParameter("board_img1");
		String board_img2 = req.getParameter("board_img2");
		String board_img3 = req.getParameter("board_img3");
		String board_img4 = req.getParameter("board_img4");
		
		int DelRe = boardMapper.deleteReplyAll(board_num);
		int res = boardMapper.deleteBoard(board_num);
		if (res > 0) {
			HttpSession session = req.getSession();
			String upPath = (String) session.getAttribute("upPath");

			File file1 = new File(upPath, board_img1);
			File file2 = new File(upPath, board_img2);
			File file3 = new File(upPath, board_img3);
			File file4 = new File(upPath, board_img4);

			if (file1.exists() || file2.exists() || file3.exists() || file4.exists()) {
				file1.delete();
				file2.delete();
				file3.delete();
				file4.delete();
				mav.addObject("msg", "이미지, 글 삭제 성공");
			} else {
				mav.addObject("msg", "이미지 실패, 글 삭제 성공");
			}
		} else {
			mav.addObject("msg", "삭제 실패");
			mav.addObject("url", "board_free.do?mode=");
		}
		mav.addObject("url", "board_free.do?mode=");
		return mav;
	}
	
	
	//게시글 수정버튼 클릭시
	@RequestMapping(value = "/update_board.do", method = RequestMethod.GET)
	public ModelAndView updateBoard(HttpServletRequest req, int board_num) {
		BoardDTO dto = boardMapper.getBoard(board_num, "update");
		ModelAndView mav = new ModelAndView();
		mav.addObject("getBoard", dto);
		mav.setViewName("board/updateForm");
		return mav;
	}
	//게시글 수정 후
	@RequestMapping(value = "/update_board.do", method = RequestMethod.POST)
	public ModelAndView updateOkBoard(HttpServletRequest req, @ModelAttribute BoardDTO dto, BindingResult result)
			throws IllegalStateException, IOException {
		int board_num = Integer.parseInt(req.getParameter("board_num"));
		if (result.hasErrors()) {
		}

		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf1 = mr.getFile("board_img1");
		MultipartFile mf2 = mr.getFile("board_img2");
		MultipartFile mf3 = mr.getFile("board_img3");
		MultipartFile mf4 = mr.getFile("board_img4");

		String board_img1 = mf1.getOriginalFilename();
		String board_img2 = mf2.getOriginalFilename();
		String board_img3 = mf3.getOriginalFilename();
		String board_img4 = mf4.getOriginalFilename();
		
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		
		UUID uuid = UUID.randomUUID();

		if (!mf1.isEmpty()) { // 이미 이미지가 있고, 수정할 시
			board_img1 = uuid.toString() + "_" + board_img1;
			File file1 = new File(upPath, board_img1);
			mf1.transferTo(file1);
			
			File file11 = new File(upPath, req.getParameter("board_img1-2"));
			if(file11.exists()) { // 이미 파일이 존재한다면 삭제
				file11.delete();
			}
			dto.setBoard_img1(board_img1); // 새로운 이미지 dto에 넣어주기
			
		} else if (mf1.isEmpty()) { // 이미지 첨부가 안되어 있고 수정할때 첨부
			dto.setBoard_img1(req.getParameter("board_img1-2"));
		}

		if (!mf2.isEmpty()) { 
			board_img2 = uuid.toString() + "_" + board_img2;
			
			File file2 = new File(upPath, board_img2);
			mf2.transferTo(file2);
			
			File file22 = new File(upPath, req.getParameter("board_img2-2"));
			if(file22.exists()) {
				file22.delete();
			}
			dto.setBoard_img2(board_img2);
			
		} else if (mf2.isEmpty()) {
			dto.setBoard_img2(req.getParameter("board_img2-2"));
		}

		if (!mf3.isEmpty()) { 
			board_img3 = uuid.toString() + "_" + board_img3;
			
			File file3 = new File(upPath, board_img3);
			mf3.transferTo(file3);
			
			File file33 = new File(upPath, req.getParameter("board_img3-2"));
			if(file33.exists()) {
				file33.delete();
			}
			dto.setBoard_img3(board_img3);
			
		} else if (mf3.isEmpty()) {
			dto.setBoard_img3(req.getParameter("board_img3-2"));
		}
		
		
		if (!mf4.isEmpty()) { 
			board_img4 = uuid.toString() + "_" + board_img4;
			
			File file4 = new File(upPath, board_img4);
			mf4.transferTo(file4);
			
			File file44 = new File(upPath, req.getParameter("board_img4-2"));
			if(file44.exists()) {
				file44.delete();
			}
			dto.setBoard_img4(board_img4);
			
		} else if (mf4.isEmpty()) {
			dto.setBoard_img4(req.getParameter("board_img4-2"));
		}

		int res = boardMapper.updateBoard(dto);
		ModelAndView mav = new ModelAndView("message");
		if (res > 0) {
			mav.addObject("msg", "수정성공! ");
			mav.addObject("url", "content_board.do?board_num="+board_num+"&pageNum=0");
			mav.addObject("getBoard", dto);
		} else {
			mav.addObject("msg", "수정실패!");
			mav.addObject("url", "update_board.do?board_num="+board_num+"&pageNum=0");
		}
		return mav;
	}
	//자유게시판 검색
	@RequestMapping("board_free_find.do")
	public ModelAndView freeFind(HttpServletRequest req, @RequestParam java.util.Map<String,Object> params) {
		ModelAndView mav = new ModelAndView("board/list_free");
			String select = (String) params.get("select");
			if(select.equals("writer")) {
				select = "m.mem_nickname";
			}else if(select.equals("title")){
				select = "board_title";
			}else {
				select = "board_content";
			}
			String searchString =(String) params.get("searchString");
			
			params.put("search", select);
			params.put("searchString", searchString); 
			//검색시 페이지 넘버
			int pageSize = 10;
			String pageNum = (String) params.get("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int count = boardMapper.getCountFind(params);
			
			params.put("start", startRow);
			params.put("end", endRow);

			if (endRow > count)
				endRow = count;
			List<BoardDTO> list = null;
			if (count > 0) {
				list =  boardMapper.findFree(params);
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
				mav.addObject("listBoard", list);
		
				return mav;
	}
	
	//익명게시판 검색
	@RequestMapping("board_anony_find.do")
	public ModelAndView anonyFind(HttpServletRequest req,@RequestParam String searchString, @RequestParam java.util.Map<String,Object> params) {
		ModelAndView mav = new ModelAndView("board/list_anony");
		String select = (String) params.get("select");
		searchString =(String) params.get("searchString");
		 
		if(select.equals("title")){
			select = "board_title";
		}else {
			select = "board_content";
		}
		params.put("search", select);
		params.put("searchString", searchString);
		
		//검색시 페이지 넘버
		int pageSize = 10;
		String pageNum = (String) params.get("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = boardMapper.getCountFind_anony(params);
		
		params.put("start", startRow);
		params.put("end", endRow);

		if (endRow > count)
			endRow = count;
		List<BoardDTO> list = null;
		if (count > 0) {
			list = boardMapper.findAnony(params);
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
			mav.addObject("listBoard", list);
		
		return mav;
	}
	//중고게시판 검색
	@RequestMapping("board_sh_find.do")
	public ModelAndView shFind(HttpServletRequest req, @RequestParam java.util.Map<String,Object> params) {
		
		ModelAndView mav = new ModelAndView("board/list_sh");
		String select = (String) params.get("select");
		String searchString =(String) params.get("searchString");
		
		if(select.equals("1")){
			select = "m.mem_nickname";
		}else if(select.equals("2")) {
			select = "board_title";
		}else {
			select ="board_content";
		}
		
		
		
		params.put("search", select);
		params.put("searchString", searchString);

		//검색시 페이지 넘버
				int pageSize = 10;
				String pageNum = (String) params.get("pageNum");
				if (pageNum == null) {
					pageNum = "1";
				}
				int currentPage = Integer.parseInt(pageNum);
				int startRow = (currentPage - 1) * pageSize + 1;
				int endRow = startRow + pageSize - 1;
				int count = boardMapper.getCountFind_sh(params);
								params.put("start", startRow);
				params.put("end", endRow);
				if (endRow > count)
					endRow = count;
				List<SH_boardDTO> list = null;
				if (count > 0) {
					list = boardMapper.findSH(params);
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
					mav.addObject("listBoard_sh", list);
		
					return mav;
	}
	//중고게시판 리스트
			@RequestMapping("/board_secondhand.do")
			public ModelAndView boardSecondhand(HttpServletRequest req, @RequestParam java.util.Map<String, Object> params) {
					ModelAndView mav = new ModelAndView();
					HttpSession session = req.getSession();
					session.setAttribute("upPath", session.getServletContext().getRealPath("resources/images"));
					//공지사항 리스트 
					String mode = req.getParameter("mode");
					List<NoticeDTO> nlist =boardMapper.nlistBoard(mode);
					
					//거래방법 소트시키기 위해서 받은 모드 
					if(mode.equals("sell")) {
					mode="팝니다";
					}else if(mode.equals("buy")) {
						mode="삽니다";
					}else if(mode.equals("change")){
						mode="교환";
					}
					params.put("board_condition", mode);
					
					
					//페이지 넘버
					int pageSize = 10;

					String pageNum = req.getParameter("pageNum");
					if (pageNum == null) {
						pageNum = "1";
					}
					int currentPage = Integer.parseInt(pageNum);
					int startRow = (currentPage - 1) * pageSize + 1;
					int endRow = startRow + pageSize - 1;
					int count = boardMapper.getCountBoard_sh(mode);
					params.put("start", startRow);
					params.put("end", endRow);

					if (endRow > count)
						endRow = count;
					List<SH_boardDTO> list = null;
					if (count > 0) {
						list =boardMapper.listBoard_sh(params);
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
					mav.addObject("listBoard_sh", list);
					mav.addObject("nlistBoard", nlist);
					mav.setViewName("board/list_sh");
					return mav;	
					}
				
		//중고게시판 작성 폼 띄우기 get
			@RequestMapping(value = "/write_board_sh.do", method = RequestMethod.GET)
			public ModelAndView writeFormSHBoard(HttpServletRequest req) {
				int num = 0, re_group = 0, re_step = 0, re_level = 0;
				ModelAndView mav = new ModelAndView();
				String snum = req.getParameter("board_num");
				if (snum != null) {
					num = Integer.parseInt(snum);
					re_group = Integer.parseInt(req.getParameter("board_re_group"));
					re_step = Integer.parseInt(req.getParameter("board_re_step"));
					re_level = Integer.parseInt(req.getParameter("board_re_level"));
				}
				
				mav.addObject("board_num", num);
				mav.addObject("board_re_group", re_group);
				mav.addObject("board_re_step", re_step);
				mav.addObject("board_re_level", re_level);
				mav.setViewName("board/writeForm_sh");
				return mav;
			}
	//중고 게시판 글작성 post
	@RequestMapping(value = "/write_board_sh.do", method = RequestMethod.POST)
	public String writeShPro(HttpServletRequest req, @ModelAttribute SH_boardDTO dto,BindingResult result)
					throws IllegalStateException, IOException {
				if (result.hasErrors()) {
					dto.setBoard_img1("");
					dto.setBoard_img2("");
					dto.setBoard_img3("");
					dto.setBoard_img4("");
				}
				//셀렉트 지역
				String location = req.getParameter("board_location");
				if(location.equals("0")) {
					location = "서울";
				}else if(location.equals("1")) {
					location = "경기";
				}else if(location.equals("2")) {
					location = "강원도";
				}else if(location.equals("3")) {
					location = "충청북도";
				}else if(location.equals("4")) {
					location = "충청남도";
				}else if(location.equals("5")) {
					location = "경상북도";
				}else if(location.equals("6")) {
					location = "경상남도";
				}else if(location.equals("7")) {
					location = "전라북도";
				}else if(location.equals("8")) {
					location = "전라남도";
				}else {
					location = "제주도";
				}
				dto.setBoard_location(location);

				
				//셀렉트 거래종류
				String condition = req.getParameter("board_condition");
				if(condition.equals("0")) {
					condition = "팝니다";
				}else if(condition.equals("1")) {
					condition = "삽니다";
				}else if(condition.equals("2")) {
					condition = "교환";
				}else {
					condition = "거래완료(내정)";
				}
				dto.setBoard_condition(condition);
				
				
				//셀렉트 거래 방법
				String package1 = req.getParameter("board_package");
				if(package1.equals("1")) {
					package1 = "택배만";
				}else if(package1.equals("2")) {
					package1 = "직거래만";
				}else {
					package1 = "택배/직거래";
				}
				dto.setBoard_package(package1);
				
				//ip받아오기
				dto.setBoard_ip(req.getRemoteAddr());
				//이미지 받기
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
				MultipartFile mf = mr.getFile("board_img1");
				MultipartFile mf2 = mr.getFile("board_img2");
				MultipartFile mf3 = mr.getFile("board_img3");
				MultipartFile mf4 = mr.getFile("board_img4");

				String board_img1 = mf.getOriginalFilename();
				String board_img2 = mf2.getOriginalFilename();
				String board_img3 = mf3.getOriginalFilename();
				String board_img4 = mf4.getOriginalFilename();

				UUID uuid = UUID.randomUUID(); //이미지 중복 시 엑스박스 방지용 랜덤 파일명

				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/resources/img");
				session.setAttribute("upPath", upPath);
				dto.setMem_num((Integer)session.getAttribute("mem_num"));

				if (!mf.isEmpty()) { // 이미지 첨부 되어있을 시
					board_img1 = uuid.toString() + "_" + board_img1;
					File file1 = new File(upPath, board_img1);
					mf.transferTo(file1);
					dto.setBoard_img1(board_img1);
					
				} else if (mf.isEmpty()) { // 이미지 첨부 안되어있을시
					dto.setBoard_img1("");
				}
					
				 if (!mf2.isEmpty()) {
					board_img2 = uuid.toString() + "_" + board_img2;
					File file2 = new File(upPath, board_img2);
					mf2.transferTo(file2);
					dto.setBoard_img2(board_img2);
					
				} else if (mf2.isEmpty()) {
					dto.setBoard_img2("");
				}
				if (!mf3.isEmpty()) {
					board_img3 = uuid.toString() + "_" + board_img3;
					File file3 = new File(upPath, board_img3);
					mf3.transferTo(file3);
					dto.setBoard_img3(board_img3);
				} else if (mf3.isEmpty()) {
					dto.setBoard_img3("");
				}
				
				if (!mf4.isEmpty()) {
					board_img4 = uuid.toString() + "_" + board_img4;
					File file4 = new File(upPath, board_img4);
					mf4.transferTo(file4);
					dto.setBoard_img4(board_img4);
				} else {
					dto.setBoard_img4("");
				}
				req.setAttribute("mode", "all");
				req.setAttribute("dto", dto);
				String mode = "all";
				int res = boardMapper.insertBoard_sh(dto,mode);
				if (res > 0) {
						req.setAttribute("msg", "게시글 등록 성공");
						req.setAttribute("url", "board_secondhand.do?mode=all");
				}else {
					req.setAttribute("msg", "게시글 등록 실패");
					req.setAttribute("url", "write_board_sh.do");
				}
				return "message";
				}
	//중고게시판 상세보기 
	@RequestMapping("/content_board_sh.do")
	public ModelAndView getBoard_sh(HttpServletRequest req, @RequestParam int board_num, @RequestParam int pageNum, @RequestParam(required = false) Map<String,Integer> params) throws IOException {

		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		session.setAttribute("upPath", upPath);
		SH_boardDTO dto = boardMapper.getBoard_sh(board_num, "content");
		ModelAndView mav = new ModelAndView("/board/content_sh");
		
		mav.addObject("getBoard", dto);
		
		// 여기부터 승미가 만짐 (매개변수 int board_num -> Map<String, Integer> params 로 바꿈
		int pageSize = 10;
		if (pageNum == 0) {
			pageNum = 1;
		}
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = boardMapper.getCountReply_sh(board_num);
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("start", startRow);
		map2.put("end", endRow);
		map2.put("board_num", board_num);
		
		params.put("board_num",board_num);
		params.put("board_replycount",count);
		int board_replycount= boardMapper.setReply_sh(params);

		if (endRow > count)
			endRow = count;
		List<SH_board_replyDTO> list = null;
		if (count > 0) {
			list = boardMapper.listReply_sh(map2);
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
			mav.addObject("pageNum",currentPage);
			mav.addObject("board_replycount_sh",board_replycount);
		}
		mav.addObject("count", count);
		mav.addObject("listReply_sh", list);
		
		
		return mav;
	}
	//중고게시글 수정버튼 클릭시
			@RequestMapping(value = "/update_board_sh.do", method = RequestMethod.GET)
			public ModelAndView updateBoard_sh(HttpServletRequest req, int board_num) {
				SH_boardDTO dto = boardMapper.getBoard_sh(board_num, "update");
				ModelAndView mav = new ModelAndView();
				mav.addObject("getBoard", dto);
				mav.setViewName("board/updateForm_sh");
				return mav;
			}
			// 중고 게시글 수정 후
			@RequestMapping(value = "/update_board_sh.do", method = RequestMethod.POST)
			public ModelAndView updateOkBoard_sh(HttpServletRequest req, @ModelAttribute SH_boardDTO dto, BindingResult result)
					throws IllegalStateException, IOException {
				int board_num = Integer.parseInt(req.getParameter("board_num"));
				if (result.hasErrors()) {
				}
				//셀렉트 지역
				String location = req.getParameter("board_location");
				if(location.equals("0")) {
					location = "서울 ";
				}else if(location.equals("1")) {
					location = "경기 ";
				}else if(location.equals("2")) {
					location = "강원도 ";
				}else if(location.equals("3")) {
					location = "충청북도 ";
				}else if(location.equals("4")) {
					location = "충청남도 ";
				}else if(location.equals("5")) {
					location = "경상북도 ";
				}else if(location.equals("6")) {
					location = "경상남도 ";
				}else if(location.equals("7")) {
					location = "전라북도 ";
				}else if(location.equals("8")) {
					location = "전라남도 ";
				}else {
					location = "제주도 ";
				}
				dto.setBoard_location(location);

				
				//셀렉트 거래종류
				String condition = req.getParameter("board_condition");
				if(condition.equals("0")) {
					condition = "팝니다";
				}else if(condition.equals("1")) {
					condition = "삽니다";
				}else if(condition.equals("2")) {
					condition = "교환";
				}else {
					condition = "거래완료(내정)";
				}
				dto.setBoard_condition(condition);
				
				
				//셀렉트 거래 방법
				String package1 = req.getParameter("board_package");
				if(package1.equals("1")) {
					package1 = "택배만";
				}else if(package1.equals("2")) {
					package1 = "직거래만";
				}else {
					package1 = "택배/직거래";
				}
				dto.setBoard_package(package1);
				
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
				MultipartFile mf1 = mr.getFile("board_img1");
				MultipartFile mf2 = mr.getFile("board_img2");
				MultipartFile mf3 = mr.getFile("board_img3");
				MultipartFile mf4 = mr.getFile("board_img4");

				String board_img1 = mf1.getOriginalFilename();
				String board_img2 = mf2.getOriginalFilename();
				String board_img3 = mf3.getOriginalFilename();
				String board_img4 = mf4.getOriginalFilename();
				
				HttpSession session = req.getSession();
				String upPath = session.getServletContext().getRealPath("/resources/img");
				
				UUID uuid = UUID.randomUUID();

				if (!mf1.isEmpty()) { // 이미 이미지가 있고, 수정할 시
					board_img1 = uuid.toString() + "_" + board_img1;
					File file1 = new File(upPath, board_img1);
					mf1.transferTo(file1);
					
					File file11 = new File(upPath, req.getParameter("board_img1-2"));
					if(file11.exists()) { // 이미 파일이 존재한다면 삭제
						file11.delete();
					}
					dto.setBoard_img1(board_img1); // 새로운 이미지 dto에 넣어주기
					
				} else if (mf1.isEmpty()) { // 이미지 첨부가 안되어 있고 수정할때 첨부
					dto.setBoard_img1(req.getParameter("board_img1-2"));
				}

				if (!mf2.isEmpty()) { 
					board_img2 = uuid.toString() + "_" + board_img2;
					
					File file2 = new File(upPath, board_img2);
					mf2.transferTo(file2);
					
					File file22 = new File(upPath, req.getParameter("board_img2-2"));
					if(file22.exists()) {
						file22.delete();
					}
					dto.setBoard_img2(board_img2);
					
				} else if (mf2.isEmpty()) {
					dto.setBoard_img2(req.getParameter("board_img2-2"));
				}

				if (!mf3.isEmpty()) { 
					board_img3 = uuid.toString() + "_" + board_img3;
					
					File file3 = new File(upPath, board_img3);
					mf3.transferTo(file3);
					
					File file33 = new File(upPath, req.getParameter("board_img3-2"));
					if(file33.exists()) {
						file33.delete();
					}
					dto.setBoard_img3(board_img3);
					
				} else if (mf3.isEmpty()) {
					dto.setBoard_img3(req.getParameter("board_img3-2"));
				}
				
				
				if (!mf4.isEmpty()) { 
					board_img4 = uuid.toString() + "_" + board_img4;
					
					File file4 = new File(upPath, board_img4);
					mf4.transferTo(file4);
					
					File file44 = new File(upPath, req.getParameter("board_img4-2"));
					if(file44.exists()) {
						file44.delete();
					}
					dto.setBoard_img4(board_img4);
					
				} else if (mf4.isEmpty()) {
					dto.setBoard_img4(req.getParameter("board_img4-2"));
				}

				int res = boardMapper.updateBoard_sh(dto);
				ModelAndView mav = new ModelAndView("message");
				if (res > 0) {
					mav.addObject("msg", "수정성공! ");
					mav.addObject("url", "content_board_sh.do?board_num=" + board_num+"&pageNum=0");
					mav.addObject("getBoard_sh", dto);
				} else {
					mav.addObject("msg", "수정실패!");
					mav.addObject("url", "update_board_sh.do?board_num=" + board_num+"&pageNum=0");
				}
				return mav;
			}
			//중고게시글 삭제
			@RequestMapping("/delete_board_sh.do")
			public ModelAndView deleteBoard_sh(HttpServletRequest req,
					@RequestParam(required = false) Map<String, String> params) {
				int board_num = Integer.parseInt(params.get("board_num"));
				ModelAndView mav = new ModelAndView("message");

				String board_img1 = req.getParameter("board_img1");
				String board_img2 = req.getParameter("board_img2");
				String board_img3 = req.getParameter("board_img3");
				String board_img4 = req.getParameter("board_img4");
				int delRe =boardMapper.deleteReplyAll_sh(board_num);
				
				int res = boardMapper.deleteBoard_sh(board_num);
				if (res > 0) {
					HttpSession session = req.getSession();
					String upPath = (String) session.getAttribute("upPath");

					File file1 = new File(upPath, board_img1);
					File file2 = new File(upPath, board_img2);
					File file3 = new File(upPath, board_img3);
					File file4 = new File(upPath, board_img4);

					if (file1.exists() || file2.exists() || file3.exists() || file4.exists()) {
						file1.delete();
						file2.delete();
						file3.delete();
						file4.delete();
						mav.addObject("msg", "이미지, 글, 댓글 삭제 성공");
					} else {
						mav.addObject("msg", "이미지 실패, 글 삭제 성공");
					}
				} else {
					mav.addObject("msg", "삭제 실패");
					mav.addObject("url", "content_board_sh.do?board_num="+board_num+"&pageNum=0");
				}
				mav.addObject("url", "board_secondhand.do");
				return mav;
			}
	// 중고 게시판 댓글 입력
		@RequestMapping(value = "/write_reply_sh.do")
		public ModelAndView writeReply_sh(HttpServletRequest req, @RequestParam Map<String,Object> params, @ModelAttribute SH_board_replyDTO dto, BindingResult result) {
			
			int re_group = 0, re_step = 0, re_level = 0;
			HttpSession session = req.getSession();
			ModelAndView mav = new ModelAndView("message");
			int board_num = dto.getBoard_num();
			int br_num = dto.getBr_num();
			dto.setBoard_num(board_num);
			dto.setMem_num((Integer)session.getAttribute("mem_num"));
			dto.setMem_nickname((String)session.getAttribute("mem_nickname"));
			
			//대댓글일때
			if(br_num>0) {
				re_group = dto.getBr_re_group();
				re_step=dto.getBr_re_step();
				re_level=dto.getBr_re_level();
			}
			mav.addObject("board_num", board_num);
			mav.addObject("br_num", br_num);
			mav.addObject("br_re_group", re_group);
			mav.addObject("br_re_step", re_step);
			mav.addObject("br_re_level", re_level);
			mav.addObject("dto", dto);
			
			int res = boardMapper.insertReply_sh(dto);
			if (res > 0) {
				mav.addObject("msg", "댓글이 등록 되었습니다.");
				mav.addObject("url", "content_board_sh.do?pageNum=1&board_num="+board_num);
			} else {
				mav.addObject("msg", "댓글 등록 실패");
				mav.addObject("url", "content_board_sh.do?board_num"+board_num);
			}
			return mav;
		}
		
		//중고게시판 대댓글
				@ResponseBody
				@RequestMapping("/re_reply_sh.do")
				public ModelAndView re_reply_sh(HttpServletRequest req,int br_num,int pageNum) {
					ModelAndView mav = new ModelAndView("/board/Re_replyForm_sh");
					SH_board_replyDTO dto = boardMapper.getReply_sh(br_num);
					mav.addObject("dto",dto);
					mav.addObject("br_num", br_num);
					mav.addObject("br_re_group",dto.getBr_re_group());
					mav.addObject("br_re_step",dto.getBr_re_step());
					mav.addObject("br_re_level",dto.getBr_re_level());
					mav.addObject("pageNum", pageNum);
					
					return mav;
				}
		//중고게시판 댓글 수정
		@RequestMapping(value="/update_reply_sh.do", method = RequestMethod.GET)
		public ModelAndView updateReplySH(HttpServletRequest req,int br_num,int pageNum) {
			ModelAndView mav = new ModelAndView("/board/updateReplyForm_sh");
			SH_board_replyDTO dto = boardMapper.getReply_sh(br_num);
			mav.addObject("dto",dto);
			mav.addObject("br_num",br_num);
			mav.addObject("pageNum", pageNum);
			return mav;
		}
		@ResponseBody
		@RequestMapping(value="/update_replyOk_sh.do")
		public ModelAndView updateReplyProSH(HttpServletRequest req, @RequestParam Map<Object, Object> params) {
			ModelAndView mav = new ModelAndView();
			String br_num = (String)params.get("br_num");
			SH_board_replyDTO dto = boardMapper.getReply_sh(Integer.parseInt(br_num));
			//String pageNum = (String)params.get
			dto.setBr_content((String)params.get("br_content"));
			int res = boardMapper.updateReply_sh(dto);
			
			return mav;
		}
		//중고게시판 댓글 삭제 
		@RequestMapping("/delete_reply_sh.do")
		public ModelAndView deleteReply_sh(HttpServletRequest req, int board_num,int br_num, int pageNum) {
			ModelAndView mav = new ModelAndView("message");
			int res = boardMapper.deleteReply_sh(br_num);
			if (res > 0) {
				mav.addObject("msg", "삭제 성공! ");
				mav.addObject("url",  "content_board_sh.do?board_num="+board_num+"&pageNum="+pageNum);
			} else {
				mav.addObject("msg", "삭제 실패!");
				mav.addObject("url",  "content_board_sh.do?board_num="+board_num+"&pageNum="+pageNum);
			}

			return mav;
		}
}