package com.ezen.FSB;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.service.AdminMapper;

@Controller
public class Admin_MemberController { // 관리자 - Member Controller

	@Autowired
	AdminMapper adminMapper;
	
	// 일반 회원 목록
	@RequestMapping("/admin_member_list.do")
	public ModelAndView listMember(@RequestParam Map<String, String> params) {
		List<MemberDTO> listMember = null;
		
		if(params.get("mode") == null) { // 전체보기
			listMember = adminMapper.listMember();
		}else { // 일반회원 찾기 (params.get("mode").equals("find"))
			listMember = adminMapper.findMember(params);
		}
		return new ModelAndView("/admin/member_list", "listMember", listMember);
	}
	
	// 일반 회원 등록 폼
	@RequestMapping(value="/admin_member_insert.do" , method=RequestMethod.GET)
	public String insertMember() {
		return "admin/member_insert";
	}
	
	// 일반 회원 등록 처리
	@RequestMapping(value="/admin_member_insert.do" , method=RequestMethod.POST)
	public ModelAndView insertOkMember(HttpServletRequest req, @ModelAttribute MemberDTO dto) {
		// insert
		int res = adminMapper.insertMember(dto);
		
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "일반회원 등록 성공! 일반회원 목록페이지 이동합니다.");
		}else {
			mav.addObject("msg", "일반회원 등록 실패! 일반회원 목록페이지 이동합니다.");
		}
		mav.addObject("url", "admin_member_list.do");
		return mav;
	}
	
	// 일반 회원 상세보기
	@RequestMapping("/admin_member_view.do")
	public ModelAndView getMember(int mem_num) {
		// getMember
		MemberDTO dto = adminMapper.getMember(mem_num);
		return new ModelAndView("admin/member_view", "getMember", dto);
	}
	
	// 일반 회원 삭제
	@RequestMapping("/admin_member_delete.do")
	public ModelAndView deleteMember(int mem_num) {
		
		int res = adminMapper.deleteMember(mem_num);
		
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "회원 삭제 성공! 회원 목록 페이지로 이동합니다.");
		}else {
			mav.addObject("msg", "회원 삭제 실패! 회원 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_member_list.do");
		return mav;
	}
	
	// 일반 회원 수정폼
	@RequestMapping(value="/admin_member_update.do", method=RequestMethod.GET)
	public ModelAndView updateMember(int mem_num) {
		return new ModelAndView("admin/member_update","mem_num", mem_num);
	}

	// 일반 회원 수정 처리
	@RequestMapping(value="/admin_member_update.do", method=RequestMethod.POST)
	public ModelAndView updateOkMember(@RequestParam Map<String, String> params) {
		
		int mem_num = Integer.parseInt(params.get("mem_num"));
		
		int res1, res2, res3, res4, res5 = 0;
		if(params.get("mem_passwd") != null) { // 비밀번호 수정
			res1 = adminMapper.updateMemberPasswd(mem_num);
		}else res1 = 1;
		
		if(params.get("mem_nickname") != null) { // 닉네임 수정
			res2 = adminMapper.updateMemberNickname(mem_num);
		}else res2 = 1;
		
		if(params.get("mem_img") != null) { // 프로필 수정
			res3 = adminMapper.updateMemberImg(mem_num);
		}else res3 = 1;
		
		if(params.get("mem_report") != null) { // 신고횟수 수정
			res4 = adminMapper.updateMemberReport(mem_num);
		}else res4 = 1;
		
		if(params.get("mem_msg") != null) { // 상태메세지 수정
			res5 = adminMapper.updateMemberMsg(mem_num);
		}else res5 = 1;
		
		ModelAndView mav = new ModelAndView("closeWindow");
		
		if(res1>0 && res2>0 && res3>0 && res4>0 && res5>0) {
			mav.addObject("msg", "회원 수정 성공! 일반 회원 목록 페이지로 이동합니다.");
		}else {
			mav.addObject("msg", "회원 수정 실패! 일반 회원 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_member_list.do");
		return mav;
	}
	
	// 
	
}
