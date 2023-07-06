package com.ezen.FSB;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.FSB.dto.GameDTO;
import com.ezen.FSB.dto.ShopCouponDTO;
import com.ezen.FSB.dto.ShopProductDTO;
import com.ezen.FSB.dto.ShopQnADTO;
import com.ezen.FSB.dto.ShopReviewDTO;
import com.ezen.FSB.dto.ShopUserCouponDTO;
import com.ezen.FSB.service.AdminMapper;

@Controller
public class Admin_ShopController { // 관리자 - Shop Controller
	
	@Autowired
	AdminMapper adminMapper;
	
	// 상품 목록
	@RequestMapping("/admin_prod_list.do")
	public ModelAndView listProduct(HttpServletRequest req, @RequestParam Map<String, String> params) {
		
		HttpSession session = req.getSession();
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		session.setAttribute("df", df);
		
		String mode = params.get("mode");
		String sort = params.get("sort");
		
		List<ShopProductDTO> listProd = null;
		
		if(mode.equals("all")) { // 전체보기
			if(sort.equals("all")) { // 기본 정렬
				listProd = adminMapper.listProd();
			}else{
				listProd = adminMapper.sortProd(sort);
			}
		}else { // 찾기
			String search = params.get("search");
			String searchString = params.get("searchString");
			if(search.equals("game_name")) { // 상품 이름
				listProd = adminMapper.findProdGameName(searchString);
			}else if(search.equals("prod_company")){ // 판매사
				listProd = adminMapper.findProdCompany(searchString);
			}
		}
		return new ModelAndView("admin/prod_list", "listProd", listProd);
	}
	// 상품 상세보기
	@RequestMapping("/admin_prod_view.do")
	public ModelAndView getProduct(@RequestParam int prod_num) {
		ModelAndView mav = new ModelAndView("admin/prod_view");
		
		// 상품 DTO
		ShopProductDTO pdto =  adminMapper.getProd(prod_num);
		// 상품의 리뷰 개수
		int count = adminMapper.getProdReviewCount(prod_num);
		if(count>0) {
			// 상품의 리뷰 별점 총합
			int sum = adminMapper.getProdStar(prod_num);
			// 별점 평균
			double starrating = (double)(sum*1.0)/count;
			starrating = Math.round(starrating*100)/100.0;
			mav.addObject("starrating", starrating);
		}
		mav.addObject("reviewCount", count);
		// 리뷰 DTO
		List<ShopReviewDTO> listReview = adminMapper.listProdReview(prod_num);
		
		
		mav.addObject("getProd", pdto);
		mav.addObject("listReview", listReview);
		return mav;
	}
	// 상품 리뷰 이미지 상세보기
	@RequestMapping("/admin_prod_view_img.do")
	public ModelAndView getProdReviewImg(@RequestParam int sr_num) {
		ShopReviewDTO dto = adminMapper.getProdReviewImg(sr_num);
		ModelAndView mav = new ModelAndView("admin/img_view");
		
		mav.addObject("img1", dto.getSr_img1());
		if(dto.getSr_img2() == null) {	
		}else {
			mav.addObject("img2", dto.getSr_img2());
		}
		if(dto.getSr_img3() == null) {	
		}else {
			mav.addObject("img3", dto.getSr_img3());
		}
		if(dto.getSr_img4() == null) {	
		}else {
			mav.addObject("img4", dto.getSr_img4());
		}
		return mav;
	}
	// 상품 등록폼
	@RequestMapping(value="/admin_prod_insert.do", method=RequestMethod.GET)
	public ModelAndView insertProduct() {
		List<GameDTO> listNotProdGame = adminMapper.listNotProdGame();
		return new ModelAndView("admin/prod_insert", "listNotProdGame", listNotProdGame);
	}
	// 상품 등록 처리
	@RequestMapping(value="/admin_prod_insert.do", method=RequestMethod.POST)
	public ModelAndView insertOkProduct(HttpServletRequest req, @ModelAttribute ShopProductDTO dto , BindingResult result) {
		if(result.hasErrors()) {
			dto.setProd_img("0"); // 초기 상품 상세 이미지 세팅
		}
		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("prod_img");
		String prod_img = mf.getOriginalFilename();

		// 파일명 중복 방지
		UUID uuid = UUID.randomUUID();
		prod_img = uuid.toString() + "_" +prod_img;
				
		// 파일 객체 생성, 업로드
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		System.out.println(upPath);
		File file = new File(upPath, prod_img);
		try {
			mf.transferTo(file);
		}catch(IOException e) {
			e.printStackTrace();
			System.out.println("file 업로드 오류 발생");
		}
		// 파일 이름 dto 세팅
		dto.setProd_img(prod_img);
		//insert
		int res = adminMapper.insertProd(dto);
		
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "상품 등록 성공! 파일 업로드 성공! 상품 목록 페이지로 이동합니다.");
			mav.addObject("url", "admin_prod_list.do?mode=all&sort=all");
		}else {
			mav.addObject("msg", "상품 등록 실패! 파일 업로드 성공! 상품 등록 페이지로 이동합니다.");
			mav.addObject("url", "admin_prod_insert.do");
		}
		return mav;
	}
	// 상품 수정폼
	@RequestMapping(value="/admin_prod_update.do", method=RequestMethod.GET)
	public ModelAndView updateProduct(@RequestParam int prod_num) {
		ShopProductDTO dto = adminMapper.getProd(prod_num);
		return new ModelAndView("/admin/prod_update", "getProd", dto);
	}
	// 상품 수정 처리
	@RequestMapping(value="/admin_prod_update.do", method=RequestMethod.POST)
	public ModelAndView updateOkProduct(HttpServletRequest req, @RequestParam Map<String, String> params, @ModelAttribute ShopProductDTO dto, BindingResult result) {
		if(result.hasErrors()) { // 초기 이미지 세팅
			dto.setProd_img("0");
		}
		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("prod_img");
		String prod_img = mf.getOriginalFilename();
				
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
				
		// 파일명 중복 방지
		UUID uuid = UUID.randomUUID();
		prod_img = uuid.toString() + "_" +prod_img;
				
		if(!mf.isEmpty()) { // 이미지 수정 하는 경우
			// 파일 객체 생성, 업로드
			File file = new File(upPath, prod_img);
			try {
				mf.transferTo(file);
			}catch(IOException e) {
				e.printStackTrace();
				System.out.println("file 수정중 오류 발생");
			}
			// 파일 이름 dto 세팅
			dto.setProd_img(prod_img);
			// 이전 파일 지우기
			File file01 = new File(upPath, params.get("prod_img2"));
			if(file01.exists()) { // 파일이 존재하면
				file01.delete();
			}
		}else { // 이미지 수정 하지 않는 경우
			// 파일 이름만 dto 세팅
			dto.setProd_img(params.get("prod_img2"));
		}
		
		int res = adminMapper.updateProd(dto);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "상품 수정 성공! 상품 상세보기 페이지로 이동합니다.");
			mav.addObject("url", "admin_prod_view.do?prod_num="+dto.getProd_num());
		}else {
			mav.addObject("msg", "상품 수정 실패! 상품 수정 페이지로 이동합니다.");
			mav.addObject("url", "admin_prod_update.do?prod_num="+dto.getProd_num());
		}
		return mav;
	}
	// 상품 삭제
	@RequestMapping("/admin_prod_delete.do")
	public ModelAndView deleteProduct(HttpServletRequest req, @RequestParam Map<String, String> params) {
		
		// 상품 삭제
		int res = adminMapper.deleteProd(Integer.parseInt(params.get("prod_num")));
		
		ModelAndView mav = new ModelAndView("message");
		
		if(res>0) {		
			HttpSession session = req.getSession();
			String upPath = session.getServletContext().getRealPath("/resources/img");

			// 파일 삭제
			File file = new File(upPath, params.get("prod_img"));
			if(file.exists()) { // 파일이 존재하면
				file.delete();
				mav.addObject("msg", "상품 삭제/파일 삭제/리뷰 삭제 성공! 상품 목록 페이지로 이동합니다.");
			}else { // 파일이 없는 경우
				mav.addObject("msg", "상품 삭제/리뷰 삭제 성공! 파일 삭제 실패! 상품 목록 페이지로 이동합니다.");
			}
		}else {
			mav.addObject("msg", "상품 삭제 실패! 상품 목록 페이지로 이동합니다.");
		}
		mav.addObject("url", "admin_prod_list.do?mode=all&sort=all");
		return mav;
	}
	
	// 쿠폰 목록
	@RequestMapping("/admin_scoupon_list.do")
	public ModelAndView listScoupon(@RequestParam int sc_num) {
		
		ModelAndView mav = new ModelAndView("admin/scoupon_list");
		
		if(sc_num != 0) { // 기본 쿠폰 목록 + 소유한 회원 목록
			List<ShopUserCouponDTO> listUsc = adminMapper.listUsc(sc_num);
			mav.addObject("listUsc", listUsc);
		}
		
		// 쿠폰 목록
		List<ShopCouponDTO> listScoupon = adminMapper.listScoupon();
		mav.addObject("listScoupon", listScoupon);
		
		return mav;
	}
	// 쿠폰 등록 폼
	@RequestMapping(value="/admin_scoupon_insert.do", method=RequestMethod.GET)
	public ModelAndView insertScoupon() {
		// 쿠폰 등록 만료일은 최소 오늘 날짜 (오늘 날짜 구하기)
		LocalDate now = LocalDate.now();
		return new ModelAndView("admin/scoupon_insert", "now", now);
	}
	// 쿠폰 등록 처리
	@RequestMapping(value="/admin_scoupon_insert.do", method=RequestMethod.POST)
	public ModelAndView insertOkScoupon(@ModelAttribute ShopCouponDTO dto , BindingResult result, @RequestParam Map<String, String> params) {
		if(result.hasErrors()) {
		}
		
		int res;
		// 만료일 지정하지 않음을 선택한 경우
		if(params.get("sc_duedate2") != null) {
			res = adminMapper.insertScoupon2(dto);
		}else { // 만료일을 지정하는 경우
			String date = dto.getSc_duedate().substring(2);
			date = date.replace('-', '/');
			System.out.println(date);
			dto.setSc_duedate(date);
			res = adminMapper.insertScoupon1(dto);
		}
		
		ModelAndView mav = new ModelAndView("message");
		
		if(res>0) {
			mav.addObject("msg", "쿠폰 등록 성공! 쿠폰 목록 페이지로 이동합니다.");
			mav.addObject("url", "admin_scoupon_list.do?sc_num=0");
		}else {
			mav.addObject("msg", "쿠폰 등록 실패! 쿠폰 등록 페이지로 이동합니다.");
			mav.addObject("url", "admin_scoupon_insert.do");
		}
				
		return mav;
	}
	// 쿠폰 삭제
	@RequestMapping("/admin_scoupon_delete.do")
	public ModelAndView deleteScoupon(@RequestParam int sc_num) {
		
		ModelAndView mav = new ModelAndView("message");
		
		List<ShopUserCouponDTO> listUsc = adminMapper.listUsc(sc_num);
		if(listUsc.size() > 0) { // sc_num 쿠폰을 가지고 있는 사용자가 있다. 삭제 불가
			mav.addObject("msg", "쿠폰을 소유한 회원이 있어, 삭제 불가! 쿠폰 목록 페이지로 이동합니다.");
		}else { // sc_num 쿠폰을 가지고 있는 사용자가 없다. 삭제 가능
			int res = adminMapper.deleteScoupon(sc_num);
			if(res>0) {
				mav.addObject("msg", "쿠폰 삭제 성공! 쿠폰 목록 페이지로 이동합니다.");
			}else {
				mav.addObject("msg", "쿠폰 삭제 실패! 쿠폰 목록 페이지로 이동합니다.");
			}
		}
		mav.addObject("url", "admin_scoupon_list.do?sc_num=0");
		return mav;
	}
	// 문의 내역
	@RequestMapping("/admin_shop_qna_list.do")
	public ModelAndView listShopQna(@RequestParam String mode) {
		List<ShopQnADTO> list = null;
		if(mode.equals("all")) { // 문의 내역 전체 보기
			list = adminMapper.listShopQnA();
		}else { // 미처리 내역 보기
			list = adminMapper.listShopQnACheck();
		}
		return new ModelAndView("admin/shop_qna_list", "listShopQna" , list);
	}
	// 문의 내역 자세히 보기 // ajax
	@ResponseBody
	@RequestMapping(value="/admin_shop_qna_view.do")
	public ModelAndView ViewShopQna(@RequestParam int sq_num) {
		ModelAndView mav = new ModelAndView("admin/shop_qna_view");
		ShopQnADTO dto = adminMapper.getShopQnA(sq_num);
		mav.addObject("getShopQna", dto);
		return mav;
	}
	
	// 문의 답변 insert, update
	@RequestMapping(value="/admin_shop_qna_reply.do")
	public ModelAndView insertShopReply(@RequestParam Map<Object, Object> params) {
		ModelAndView mav = new ModelAndView("message");
		String sq_num = (String)params.get("sq_num");
		
		ShopQnADTO dto = adminMapper.getShopQnA(Integer.parseInt(sq_num));
		String reply_mode = (String)params.get("reply_mode");
		String sq_reply = (String)params.get("sq_reply");
		dto.setSq_reply(sq_reply);
		
		int res = adminMapper.shopQnaReply(dto);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("check", 1);
		map.put("sq_num", Integer.parseInt(sq_num));
		
		if(res>0) {
			int res2 = adminMapper.shopQnaReplyCheck(map);
			if(res2>0) {
				if(reply_mode.equals("insert")) { // 등록
					mav.addObject("msg","답변 등록 성공!");
				}else { // 수정
					mav.addObject("msg","답변 수정 성공!");
				}
			}else {
				if(reply_mode.equals("insert")) { // 등록
					mav.addObject("msg","답변 등록 성공! 체크여부 수정 실패!");
				}else { // 수정
					mav.addObject("msg","답변 수정 성공! 체크여부 수정 실패!");
				}
			}
		}else {
			if(reply_mode.equals("insert")) { // 등록
				mav.addObject("msg","답변 등록 실패!");
			}else { // 수정
				mav.addObject("msg","답변 수정 실패!");
			}
		}
		mav.addObject("url","admin_shop_qna_list.do?mode=all");
		return mav;
	}
	// 문의 답변 삭제
	@RequestMapping("/admin_shop_qna_reply_del.do")
	public ModelAndView deleteShopReply(@RequestParam int sq_num) {
		ModelAndView mav = new ModelAndView("message");
		// 문의 답변 NULL 로 수정
		int res = adminMapper.shopQnaReplyDel(sq_num);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("check", 0);
		map.put("sq_num", sq_num);
		
		if(res>0) {
			int res2 = adminMapper.shopQnaReplyCheck(map);
			if(res2>0) {
				mav.addObject("msg","답변 삭제 성공!");
			}else {
				mav.addObject("msg","답변 삭제 성공! 처리여부 수정 실패!");
			}
		}else {
			mav.addObject("msg","답변 삭제 실패!");
		}
		mav.addObject("url","admin_shop_qna_list.do?mode=all");
		return mav;
	}
}
