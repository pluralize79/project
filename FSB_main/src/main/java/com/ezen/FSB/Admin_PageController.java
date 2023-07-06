package com.ezen.FSB;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.FSB.dto.NoticeDTO;
import com.ezen.FSB.service.AdminMapper;

@Controller
public class Admin_PageController { // 관리자 - Page Controller

	@Autowired
	AdminMapper adminMapper;
	
	// 관리자 작성글 목록
	@RequestMapping("/admin_notice_list.do")
	public ModelAndView listNotice(@RequestParam Map<String, String> params) {
		String mode = params.get("mode");
		String sort = params.get("sort");
		
		List<NoticeDTO> listNotice = null;
		
		if(mode.equals("all")) { // 전체 보기
			if(sort.equals("all")) { // 기본 정렬
				listNotice = adminMapper.listNotice();
			}else if(sort.equals("notice")) { // 공지사항만 보기
				listNotice = adminMapper.sortNotice(sort);
			}else if(sort.equals("qna")) { // 자주 묻는 질문만 보기
				listNotice = adminMapper.sortNotice(sort);
			}else if(sort.equals("regdate_asc")) { // 작성일 오래된 순
				listNotice = adminMapper.sortNotice2();
			}else if(sort.equals("regdate_desc")) { // 작성일 최근 순
				listNotice = adminMapper.sortNotice3();
			}
		}else { // 찾기 (mode.equals("find"))
			listNotice = adminMapper.findNotice(params);
		}
		return new ModelAndView("admin/notice_list", "listNotice", listNotice);
	}
	
	// 관리자 작성글 등록폼
	@RequestMapping(value="/admin_notice_insert.do", method=RequestMethod.GET)
	public String insertNotice() {
		return "admin/notice_insert";
	}
	// 관리자 작성글 등록 처리
	@RequestMapping(value="/admin_notice_insert.do", method=RequestMethod.POST)
	public ModelAndView insertOkNotice(@ModelAttribute NoticeDTO dto, BindingResult result) {
		if(result.hasErrors()) {} // BindingException 발생
		
		ModelAndView mav = new ModelAndView("message");
		
		// 등록 처리
		int res = adminMapper.insertNotice(dto);
		if(res>0) {
			mav.addObject("msg", "관리자 글 등록 성공! 관리자 글 목록 페이지로 이동합니다.");
			mav.addObject("url","admin_notice_list.do?mode=all&sort=all");
		}else {
			mav.addObject("msg", "관리자 글 등록 실패! 관리자 글 작성 페이지로 이동합니다.");
			mav.addObject("url", "admin_notice_insert.do");
		}
		return mav;
	}
	// 관리자 작성글 삭제
	@RequestMapping("/admin_notice_delete.do")
	public ModelAndView deleteNotice(@RequestParam int n_num) {
		int res = adminMapper.deleteNotice(n_num);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "관리자 글 삭제 성공! 관리자 글 목록 페이지로 이동합니다.");
		}else {
			mav.addObject("msg", "관리자 글 삭제 실패! 관리자 글 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_notice_list.do?mode=all&sort=all");
		return mav;
	}
	// 관리자 작성글 수정 폼
	@RequestMapping(value="/admin_notice_update.do", method=RequestMethod.GET)
	public ModelAndView updateNotice(@RequestParam int n_num) {
		NoticeDTO dto = adminMapper.getNotice(n_num);
		
		return new ModelAndView ("admin/notice_update", "getNotice", dto);
	}
	// 관리자 작성글 수정 처리
	@RequestMapping(value="/admin_notice_update.do", method=RequestMethod.POST)
	public ModelAndView updateOkNotice(@ModelAttribute NoticeDTO dto, BindingResult result) {
		if(result.hasErrors()) {}
		
		int res = adminMapper.updateNotice(dto);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "관리자 글 수정 성공! 관리자 글 목록 페이지로 이동합니다.");
			mav.addObject("url", "admin_notice_list.do?mode=all&sort=all");
		}else {
			mav.addObject("msg", "관리자 글 수정 실패! 관리자 글 수정 페이지로 이동합니다.");
			mav.addObject("url", "admin_notice_update.do?n_num="+dto.getN_num());
		}
		return mav;
	}
	// 관리자 작성글 상세보기
	@RequestMapping("/admin_notice_view.do")
	public ModelAndView getNotice(@RequestParam int n_num) {
		NoticeDTO dto = adminMapper.getNotice(n_num);
		return new ModelAndView("admin/notice_view", "getNotice", dto);
	}
	
	// 전체 신고 내역
	@RequestMapping("/admin_report.list.do")
	public String listReport() {
		return "admin/report_list";
	}
	
}
