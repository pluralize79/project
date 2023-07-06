package com.ezen.FSB;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.dto.ShopProductDTO;
import com.ezen.FSB.dto.ShopQnADTO;
import com.ezen.FSB.dto.ShopReviewDTO;
import com.ezen.FSB.dto.ShopUserCouponDTO;
import com.ezen.FSB.service.ShopMapper;
import com.ezen.FSB.service.ShopMyPageMapper;

@Controller
public class ShopMyPageController {
	@Autowired
	public ShopMyPageMapper shopMyPageMapper;
	
	@Autowired
	public ShopMapper shopMapper;
	
	// 유저 마이페이지로 이동
	@RequestMapping("user_shop_myPage.do")
	public ModelAndView userShopMyPage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("shop/myPage_main");
		return mav;
	}
	
	// 마이페이지 리뷰
	@RequestMapping("shop_myPage_review.do")
	public ModelAndView shopMyPageReivew(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		System.out.println("리뷰 멤버넘버" + dto.getMem_num());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("getMemNum", dto.getMem_num());
		
		int pageSize = 2;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = shopMyPageMapper.shopReviewCount(dto.getMem_num());
		if (endRow > count)
			endRow = count;
		Map<String, Integer> params = new HashMap<>();
		params.put("start", startRow);
		params.put("end", endRow);
		params.put("mem_num", dto.getMem_num());
		List<ShopReviewDTO> list = null;
		if (count > 0) {
			list = shopMyPageMapper.myPageReview(params);
			System.out.println("마이페이지야 리뷰 가져왔니?" + list);
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;

			if (endPage > pageCount)
				endPage = pageCount;
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("pageCount", pageCount);
			mav.addObject("myPageReview", list);
		}
		mav.addObject("count", count);
		int rowNum = count - (currentPage - 1) * pageSize;
		mav.addObject("rowNum", rowNum);
		mav.setViewName("shop/myPage_review");
		return mav;
	}
	
	// 마이페이지 리뷰 수정페이지(고쳐야함!!!!!!!!!!!!!!!!!!!!!!!)
	@RequestMapping(value="shop_myPage_review_update.do", method=RequestMethod.GET)
	public ModelAndView shopMyPageReviewUpdate(HttpServletRequest req, int sr_num) {
		System.out.println("sr_num야 왔니" + sr_num);
//		HttpSession session = req.getSession();
//		int mem_num = (int)session.getAttribute("mem_num");
//		System.out.println("멤버넘버야 수정하러 왔니?"+mem_num);
		ModelAndView mav = new ModelAndView();
		
		// 상품명 구하기
		List<ShopProductDTO> listProd = shopMapper.listProd(); 
		mav.addObject("listProd", listProd);
		
		// review 구하기
		ShopReviewDTO dto = shopMyPageMapper.getMyPageReivew(sr_num);
		mav.addObject("getReivew", dto);
		mav.setViewName("shop/myPage_review_update");
		return mav;
	}
	
	// 마이페이지 리뷰 수정 처리(고쳐야함!!!!!!!!!!!!!!!!!!!!!!)
	@RequestMapping(value="shop_myPage_review_update.do", method=RequestMethod.POST)
	public ModelAndView shopMyPageReviewUpdateOk(HttpServletRequest req, int sr_num, @ModelAttribute ShopReviewDTO dto, BindingResult result) {
		System.out.println("왔을까 안왔을까" + sr_num);
		if (result.hasErrors()) {
			dto.setSr_img1("0");
			dto.setSr_img2("0");
			dto.setSr_img3("0");
			dto.setSr_img4("0");
		}
		HttpSession session = req.getSession();
		MemberDTO dto2 = (MemberDTO)session.getAttribute("login_mem");
		System.out.println("멤버넘버야 수정하러 왔니?" + dto2.getMem_num());
		
		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf1 = mr.getFile("sr_img1");
		MultipartFile mf2 = mr.getFile("sr_img2");
		MultipartFile mf3 = mr.getFile("sr_img3");
		MultipartFile mf4 = mr.getFile("sr_img4");

		String sr_img1 = mf1.getOriginalFilename();
		String sr_img2 = mf2.getOriginalFilename();
		String sr_img3 = mf3.getOriginalFilename();
		String sr_img4 = mf4.getOriginalFilename();
		
		String upPath = session.getServletContext().getRealPath("/resources/img");
		
		UUID uuid = UUID.randomUUID();

		if (!mf1.isEmpty()) { // 이미 이미지가 있고, 수정할 시
			// 파일명 중복 방지
			sr_img1 = uuid.toString() + "_" + sr_img1;
			// 파일 객체 생성
			File file1 = new File(upPath, sr_img1);
			try {
				mf1.transferTo(file1);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			File file11 = new File(upPath, req.getParameter("sr_img1-2"));
			if(file11.exists()) { // 이미 파일이 존재한다면 이전 파일 삭제
				file11.delete();
			}
			dto.setSr_img1(sr_img1); // 새로운 이미지 dto에 넣어주기
			
		} else if (mf1.isEmpty()) { // 이미지 첨부가 안되어 있고 수정할 때 첨부
			dto.setSr_img1(req.getParameter("sr_img1-2"));
		}

		if (!mf2.isEmpty()) { 
			sr_img2 = uuid.toString() + "_" + sr_img2;
			
			File file2 = new File(upPath, sr_img2);
			try {
				mf2.transferTo(file2);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			File file22 = new File(upPath, req.getParameter("sr_img2-2"));
			if(file22.exists()) {
				file22.delete();
			}
			dto.setSr_img2(sr_img2);
			
		} else if (mf2.isEmpty()) {
			dto.setSr_img2(req.getParameter("sr_img2-2"));
		}

		if (!mf3.isEmpty()) { 
			sr_img3 = uuid.toString() + "_" + sr_img3;
			
			File file3 = new File(upPath, sr_img3);
			try {
				mf3.transferTo(file3);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			File file33 = new File(upPath, req.getParameter("sr_img3-2"));
			if(file33.exists()) {
				file33.delete();
			}
			dto.setSr_img3(sr_img3);
			
		} else if (mf3.isEmpty()) {
			dto.setSr_img3(req.getParameter("sr_img3-2"));
		}
		
		
		if (!mf4.isEmpty()) { 
			sr_img4 = uuid.toString() + "_" + sr_img4;
			
			File file4 = new File(upPath, sr_img4);
			try {
				mf4.transferTo(file4);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			File file44 = new File(upPath, req.getParameter("sr_img4-2"));
			if(file44.exists()) {
				file44.delete();
			}
			dto.setSr_img4(sr_img4);
			
		} else if (mf4.isEmpty()) {
			dto.setSr_img4(req.getParameter("sr_img4-2"));
		}

		int res = shopMyPageMapper.updateMyPageReivew(sr_num);
		ModelAndView mav = new ModelAndView("message");
		if (res > 0) {
			mav.addObject("msg", "리뷰 수정 성공! 목록으로 이동합니다.");
			mav.addObject("url", "shop_myPage_review.do?mem_num="+dto2.getMem_num()+"&pageNum=1");
//			mav.addObject("getBoard", dto);
		} else {
			mav.addObject("msg", "리뷰 수정 실패! 관리자에게 문의해 주세요.");
			mav.addObject("url", "shop_myPage_review.do?mem_num="+dto2.getMem_num()+"&pageNum=1");
		}
		return mav;
	}
	
	// 마이페이지 리뷰 삭제
	@RequestMapping("shop_myPage_review_delete.do")
	public ModelAndView shopMyPageReviewDelete(HttpServletRequest req, int sr_num) {
		System.out.println("sr_num 안녕" + sr_num);
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		System.out.println("멤버넘버야 삭제하러 왔니?" + dto.getMem_num());
		
		String sr_img1 = req.getParameter("sr_img1");
		String sr_img2 = req.getParameter("sr_img2");
		String sr_img3 = req.getParameter("sr_img3");
		String sr_img4 = req.getParameter("sr_img4");
		
		ModelAndView mav = new ModelAndView("message");
		int res = shopMyPageMapper.deleteShopReview(sr_num);
		if (res > 0) {
			String upPath = (String) session.getAttribute("upPath");
			System.out.println(upPath);
			File file1 = new File(upPath, sr_img1);
			File file2 = new File(upPath, sr_img2);
			File file3 = new File(upPath, sr_img3);
			File file4 = new File(upPath, sr_img4);
			if (file1.exists() || file2.exists() || file3.exists() || file4.exists()) {
				file1.delete();
				file2.delete();
				file3.delete();
				file4.delete();
				mav.addObject("msg", "상품 리뷰 이미지, 글 삭제 성공");
			} else {
				mav.addObject("msg", "상품 리뷰 이미지 실패, 글 삭제 성공");
			}
		} else {
			mav.addObject("msg", "상품 리뷰 삭제 실패, 관리자에게 문의해주세요");
			mav.addObject("url", "shop_myPage_review.do?mem_num=" + dto.getMem_num() + "&pageNum=1");
		}
		mav.addObject("url", "shop_myPage_review.do?mem_num=" + dto.getMem_num() + "&pageNum=1");
		return mav;
	}

	
	// 마이페이지 상품 QnA
	@RequestMapping("shop_myPage_prodQnA.do")
	public ModelAndView shopMyPageProdQnA(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		System.out.println("QnA 멤버넘버" + dto.getMem_num());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("getMemNum", dto.getMem_num());
		
		// 상품명 구하기
		List<ShopProductDTO> listProd = shopMapper.listProd(); 
		mav.addObject("listProd", listProd);
		
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
//		System.out.println(pageNum);		
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = shopMyPageMapper.shopQnACount(dto.getMem_num());
		if (endRow > count)
			endRow = count;
		Map<String, Integer> params = new HashMap<>();
		params.put("start", startRow);
		params.put("end", endRow);
		params.put("mem_num", dto.getMem_num());
		List<ShopQnADTO> list = null;
		if (count > 0) {
			list = shopMyPageMapper.myPageQnA(params);
			System.out.println("QnA 뽑았니?" + list);
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;

			if (endPage > pageCount)
				endPage = pageCount;
			mav.addObject("startPage", startPage);
			mav.addObject("endPage", endPage);
			mav.addObject("pageBlock", pageBlock);
			mav.addObject("pageCount", pageCount);
			mav.addObject("myPageQnA", list);
		}
		mav.addObject("count", count);
		int rowNum = count - (currentPage - 1) * pageSize;
		mav.addObject("rowNum", rowNum);
		mav.setViewName("shop/myPage_prodQnA");
		return mav;
	}
	
	// 마이페이지 상품QnA 삭제 (나중에 사진 삭제가 되는지 확인 후 고치기)
	@RequestMapping("shop_myPage_qna_delete.do")
	public ModelAndView shopMyPageQnADelete(HttpServletRequest req, int sq_num) {
		System.out.println("sq_num 안녕" + sq_num);
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		System.out.println("멤버넘버야 삭제하러 왔니?" + dto.getMem_num());
		
		String sq_img1 = req.getParameter("sq_img1");
		String sq_img2 = req.getParameter("sq_img2");
		String sq_img3 = req.getParameter("sq_img3");
		String sq_img4 = req.getParameter("sq_img4");
		
		ModelAndView mav = new ModelAndView("message");
		int res = shopMyPageMapper.deleteShopQnA(sq_num);
		System.out.println("삭제 결과"+res);
		if (res > 0) {
			String upPath = (String) session.getAttribute("upPath");
			System.out.println("QnA삭제upPath " + upPath);
			File file1 = new File(upPath, sq_img1);
			File file2 = new File(upPath, sq_img2);
			File file3 = new File(upPath, sq_img3);
			File file4 = new File(upPath, sq_img4);
			if (file1.exists() || file2.exists() || file3.exists() || file4.exists()) {
				file1.delete();
				file2.delete();
				file3.delete();
				file4.delete();
				mav.addObject("msg", "상품 문의 이미지, 글 삭제 성공");
			} else {
				mav.addObject("msg", "상품 문의 이미지 실패, 글 삭제 성공");
			}
		} else {
			mav.addObject("msg", "상품 문의 삭제 실패, 관리자에게 문의해주세요");
			mav.addObject("url", "shop_myPage_prodQnA.do?mem_num=" + dto.getMem_num() + "&pageNum=1");
		}
		mav.addObject("url", "shop_myPage_prodQnA.do?mem_num=" + dto.getMem_num() + "&pageNum=1");
		return mav;
	}
	
	// 마이페이지 상품 QnA 수정폼
	@RequestMapping(value="shop_myPage_ProdQnA_update.do", method=RequestMethod.GET)
	public ModelAndView shopMyPageQnAUpdate(HttpServletRequest req, int sq_num) {
		System.out.println("sq_num야 왔니" + sq_num);

		ModelAndView mav = new ModelAndView();
		
		// 상품명 구하기
		List<ShopProductDTO> listProd = shopMapper.listProd(); 
		mav.addObject("listProd", listProd);
		
		// QnA 구하기
		ShopQnADTO dto = shopMyPageMapper.getMyPageQnA(sq_num);
		mav.addObject("getQnA", dto);
		mav.setViewName("shop/myPage_prodQnA_update");
		return mav;
	}
	
	// 마이페이지 상품QnA 수정 처리(고쳐야함)
	@RequestMapping(value="shop_myPage_ProdQnA_update.do", method=RequestMethod.POST)
	public ModelAndView shopMyPageQnAUpadateOk(HttpServletRequest req, int sq_num) {
		ModelAndView mav = new ModelAndView();
		return mav;

	}
	
	// 마이페이지 포인트
	@RequestMapping("shop_myPage_point.do")
	public ModelAndView ShopMyPagePoint(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		System.out.println("멤버넘버 포인트 하이" + dto.getMem_num());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("getMemNum", dto.getMem_num());
		
		
		mav.setViewName("shop/myPage_point");
		return mav;
	}
	
	// 마이페이지 내 쿠폰
	@RequestMapping("shop_myPage_coupon.do")
	public ModelAndView shopMyPageCoupon(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		System.out.println("멤버넘버 쿠폰 안녕" + dto.getMem_num());
		ModelAndView mav = new ModelAndView();
		
		// 쿠폰 리스트
		List<ShopUserCouponDTO> list = shopMyPageMapper.myPageCoupon(dto.getMem_num());
		System.out.println("쿠폰리스트" + list);
		mav.addObject("myPageCoupon", list);
		
		// 쿠폰 개수
		int count = shopMyPageMapper.getCoupon(dto.getMem_num());
		mav.addObject("getCoupon", count);
		
		mav.setViewName("shop/myPage_coupon");
		return mav;
	}
}
