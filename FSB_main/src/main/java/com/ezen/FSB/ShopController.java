package com.ezen.FSB;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
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
import com.ezen.FSB.dto.PointHistoryDTO;
import com.ezen.FSB.dto.ShopCartDTO;
import com.ezen.FSB.dto.ShopCouponDTO;
import com.ezen.FSB.dto.ShopProductDTO;
import com.ezen.FSB.dto.ShopQnADTO;
import com.ezen.FSB.dto.ShopReviewDTO;
import com.ezen.FSB.dto.ShopUserCouponDTO;
import com.ezen.FSB.service.ShopMapper;
import com.ezen.FSB.service.ShopMyPageMapper;

@Controller
public class ShopController {

	@Autowired
	ShopMapper shopMapper;
	
	@Autowired
	ShopMyPageMapper shopMyPageMapper;
	
	//쇼핑몰 메인페이지(전체상품목록 및 상세검색목록)
	@RequestMapping("/shop_main.do")
	public ModelAndView mainShop(@RequestParam(defaultValue = "1") int prod_num, HttpServletRequest req, @RequestParam Map<String, String> params) {
		HttpSession session = req.getSession();
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		session.setAttribute("df", df);
		
		
		// 일단 추가한거
		ShopReviewDTO rdto =  new ShopReviewDTO();
	    ShopQnADTO qdto = new ShopQnADTO();
	    ShopCartDTO cdto = new ShopCartDTO();
	    rdto.setMem_num((int)session.getAttribute("mem_num"));
        qdto.setMem_num((int)session.getAttribute("mem_num"));
        cdto.setMem_num((int)session.getAttribute("mem_num"));

	    session.setAttribute("mem_num", (int)session.getAttribute("mem_num"));
		
//		MemberDTO dto1 = new MemberDTO();
//		dto1.setMem_num(1);
//		dto1.setMem_name("jh960902");
//		session.setAttribute("dto1", dto1);
		
	    // 리뷰 테이블 초기화 작업(회원가입 시 주는 포인트)
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
	 	String point_type = "+";
	 	String point_content = "신규가입";
	 	int point_amount = 3000;
	 	int point_total = 3000;
	 	PointHistoryDTO dto2 = new PointHistoryDTO();
	 	dto2.setMem_num(dto.getMem_num());
	 	dto2.setPoint_type(point_type);
	 	dto2.setPoint_content(point_content);
	 	dto2.setPoint_amount(point_amount);
	 	dto2.setPoint_total(point_total);
	 	int res2 = shopMyPageMapper.memberPoint(dto2);
	    
	 	
		ModelAndView mav = new ModelAndView("shop/shop_main");
		List<ShopProductDTO> listProd = shopMapper.listProd(); 
		mav.addObject("listProd", listProd);
		//리뷰 평점
		List<ShopReviewDTO> listReview = shopMapper.listReview();
			
		return mav;
	}
	
	//전체상품 정렬(이름순/판매순/인기순/최신순)
	@RequestMapping("prod_sort.do")
	public ModelAndView prod_sort(String sort) {
		ModelAndView mav = new ModelAndView();
		if(sort.equals("game_name")) {
			List<ShopProductDTO> listProd = shopMapper.sortProd1(sort);
			mav.setViewName("shop/shop_main");
			mav.addObject("listProd", listProd);
		}else if(sort.equals("판매순~~~~~")) {
			List<ShopProductDTO> listProd = shopMapper.sortProd2(sort);
			mav.setViewName("shop/shop_main");
			mav.addObject("listProd", listProd);
		}else if(sort.equals("인기순~~~~~")) {
			List<ShopProductDTO> listProd = shopMapper.sortProd3(sort);
			mav.setViewName("shop/shop_main");
			mav.addObject("listProd", listProd);
		}else if(sort.equals("prod_regdate")) {
			List<ShopProductDTO> listProd = shopMapper.sortProd4(sort);
			mav.setViewName("shop/shop_main");
			mav.addObject("listProd", listProd);
		}
		return mav;
	}
	
	//상품검색
	@RequestMapping("prod_find.do")
	public ModelAndView prod_find(HttpServletRequest req, String search, String searchString) {
		System.out.println(searchString);
		List<ShopProductDTO> list = shopMapper.findProd(search, searchString);
		return new ModelAndView("shop/shop_main_find", "listProd", list);
	}
	
	//쇼핑몰 상품상세 1.상세페이지
	@RequestMapping("/shop_view.do")
	public ModelAndView viewShop(HttpServletRequest req, @RequestParam int prod_num) {
		ModelAndView mav = new ModelAndView("shop/shop_view");
		//위쪽 상품상세 꺼내기
		ShopProductDTO pdto = shopMapper.getProd(prod_num);
		mav.addObject("getProd", pdto);
		//리뷰 별점 평균
		int count = shopMapper.shopviewReviewCount(prod_num);
		if(count != 0) {
			int reviewAvg = shopMapper.reviewAvg(prod_num);
			System.out.println("리뷰별점평균"+reviewAvg);
			mav.addObject("reviewAvg", reviewAvg);
			mav.addObject("count", count);
		}
		// 쿠폰 전체 리스트
		List<ShopCouponDTO> clist = shopMyPageMapper.couponList();
		mav.addObject("couponList", clist);
		mav.setViewName("shop/shop_view");

		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		
		// 내가 보유한 쿠폰
		List<ShopUserCouponDTO> list = shopMyPageMapper.myPageCoupon(dto.getMem_num());
		System.out.println("쿠폰리스트" + list);
		System.out.println("쿠폰리스트사이즈" + list.size());
		mav.addObject("myPageCoupon", list);
		
		// 안가지고 있는 쿠폰 리스트를 담을 그릇 list로 선언
		List<ShopCouponDTO> exlist = new ArrayList<>();
		exlist.addAll(clist);	// clist 복사해서 exlist 복사본 만들기
		
		for (ShopCouponDTO cdto : clist) {	// 전체 쿠폰 리스트 for문
			for(ShopUserCouponDTO udto : list) {	// 가지고 있는 쿠폰 리스트 for문
				if (cdto.getSc_num() == udto.getSc_num()) {
					exlist.remove(cdto);
				}
			}
		}
		mav.addObject("exlist", exlist);
		
		return mav;
	}
	
	// 쿠폰 다운로드
	@RequestMapping("shop_couponDownload.do")
	public ModelAndView shopCouponDownload(HttpServletRequest req, int sc_num, int prod_num) {
		ModelAndView mav = new ModelAndView("message");
		ShopProductDTO pdto = shopMapper.getProd(prod_num);
		mav.addObject("getProd", pdto);
		
		HttpSession session = req.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login_mem");
		
		// 쿠폰 전체 리스트
		List<ShopCouponDTO> clist = shopMyPageMapper.couponList();
		mav.addObject("couponList", clist);
		System.out.println("쿠폰 전체 리스트" + clist);
		
		System.out.println("쿠폰 번호 sc_num" + sc_num);
		
		String sc_duedate = shopMyPageMapper.getCouponDate(sc_num);
		System.out.println("날짜 왔니?"+sc_duedate);
		
		Map<String, Object> params = null;
		if (!sc_duedate.equals("")) {
			params = new HashMap<>();
			params.put("mem_num", dto.getMem_num());
			params.put("sc_num", sc_num);
			params.put("sc_duedate", sc_duedate);
			int res = shopMyPageMapper.couponDownload(params);
			System.out.println("다운로드" + res);
			if (res > 0) { 
				mav.addObject("msg", "쿠폰이 다운로드 되었습니다. 마이페이지에서 확인해 주세요.");
				mav.addObject("url", "shop_view.do?prod_num=" + prod_num);
			} else {
				mav.addObject("msg", "쿠폰 다운로드를 실패하였습니다. 관리자에게 문의해 주세요.");
				mav.addObject("url", "shop_view.do?prod_num=" + prod_num);
			}
		} else {
			params = new HashMap<>();
			params.put("mem_num", dto.getMem_num());
			params.put("sc_num", sc_num);
			int res = shopMyPageMapper.couponDownload2(params);
			System.out.println("다운로드2(sysdate+30)" + res);
			if (res > 0) { 
				mav.addObject("msg", "쿠폰이 다운로드 되었습니다. 마이페이지에서 확인해 주세요.");
				mav.addObject("url", "shop_view.do?prod_num=" + prod_num);
			} else {
				mav.addObject("msg", "쿠폰 다운로드를 실패하였습니다. 관리자에게 문의해 주세요.");
				mav.addObject("url", "shop_view.do?prod_num=" + prod_num);
			}
		}		
		return mav;
	}
	
	
	//쇼핑몰 상품상세 1.상세페이지-찜하기버튼
	@RequestMapping("/prod_insertLike.do")
	public String insertLike() {
		//f_shop_like에 db등록해야함!!!
		return "shop/shop_view";
	}
	
	//쇼핑몰 상품상세 1.상세페이지-찜하기해제버튼
	@RequestMapping("/prod_deleteLike.do")
	public String deleteLike() {
		//f_shop_like에서 db삭제해야함!!!
		return "shop/shop_view";
	}	
	
	//쇼핑몰 상품상세 1.상세페이지-찜버튼 보이기
	@RequestMapping("/prod_getLike.do")
	public String getLike() {
		//int like = 
		//System.out.println(like);
		//mav.addObject("like", like);
		return "shop/shop_view";
	}
	
	//쇼핑몰 상품상세 2.상품리뷰
	@RequestMapping("/shop_view2.do")
	public ModelAndView view2Shop(HttpServletRequest req, @RequestParam int prod_num) {
		ModelAndView mav = new ModelAndView("shop/shop_view2");
		
		//위쪽 상품상세 꺼내기
		ShopProductDTO pdto = shopMapper.getProd(prod_num);
		mav.addObject("getProd", pdto);
		
		//리뷰 별점 평균
		int count = shopMapper.shopviewReviewCount(prod_num);
		mav.addObject("count", count);
		if(count != 0) {
			int reviewAvg = shopMapper.reviewAvg(prod_num);
			System.out.println("리뷰별점평균"+reviewAvg);
			mav.addObject("reviewAvg", reviewAvg);
			mav.addObject("count", count);
		}
		
		//쿠폰 꺼내기
		List<ShopCouponDTO> clist = shopMyPageMapper.couponList();
		mav.addObject("couponList", clist);		
		
		//해당 상품 리뷰 꺼내기
		mav.addObject("prod_num", prod_num);//있어야 페이징함
			
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println(pageNum);		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		//int count = shopMapper.shopviewReviewCount(prod_num);
		System.out.println("리뷰개수"+count);
		if (endRow > count)
			endRow = count;
		Map<String, Integer> params = new HashMap<>();
		params.put("start", startRow);
		params.put("end", endRow);
		params.put("prod_num", prod_num);
		List<ShopReviewDTO> list = null;
		if (count > 0) {
			list = shopMapper.getViewReview(params);
			System.out.println("리뷰리스트"+list);
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
			mav.addObject("getViewReview", list);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		mav.addObject("rowNum", rowNum);
		return mav;		
	}
	
	//상품 리뷰 등록
		@RequestMapping(value="/shop_insertReview.do", method=RequestMethod.GET)
		public ModelAndView insertReview(HttpServletRequest req) {
			HttpSession session = req.getSession();
			List<ShopProductDTO> listProd = shopMapper.listProd();
			session.setAttribute("listProd", listProd);
			// 목록 세션 꺼내기/저장
			if(listProd == null) {
				listProd = shopMapper.listProd();
				session.setAttribute("listProd", listProd);
			}
			return new ModelAndView("shop/shop_insertReview", "listProd", listProd);
		}
		
	//상품 리뷰 등록처리
	@RequestMapping(value="/shop_insertReview.do", method=RequestMethod.POST)
	public ModelAndView insertOkReview(HttpServletRequest req, @RequestParam Map<String, Object> map, @RequestParam int prod_num, @ModelAttribute ShopReviewDTO dto , BindingResult result) {
		if(result.hasErrors()) {}//항상 바인딩 에러 발생할 수 밖에 없음. 처리할 건 딱히 없음.
			
		HttpSession session = req.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		System.out.println("리뷰등록 멤버넘버" + mem_num);
		dto.setMem_num(mem_num);
			
		//insertReview.jsp에서 보낼 수 없으니 dto에 다시 세팅해서 저장!
		ShopProductDTO pdto = shopMapper.getProd(prod_num);
		int game_num = pdto.getGame_num();
		dto.setGame_num(game_num);
		
		// 리뷰 작성 시 포인트 적립(300포인트)
		String point_type = "+";
		String point_content = "리뷰작성";
		int point_amount = 300;
		int point_total = shopMyPageMapper.getTotalPoint(mem_num);
		System.out.println("토탈 가지고 와줘.." + point_total);
		PointHistoryDTO dto2 = new PointHistoryDTO();
		dto2.setMem_num(dto.getMem_num());
		dto2.setPoint_type(point_type);
		dto2.setPoint_content(point_content);
		dto2.setPoint_amount(point_amount);
		dto2.setPoint_total(point_total+point_amount);
		int res2 = shopMyPageMapper.reviewPoint(dto2);
			
		System.out.println(game_num);
		String upPath = session.getServletContext().getRealPath("/resources/img");
		session.setAttribute("upPath", upPath);
		for(int i=0; i<4; ++i) {
			String imgs = (String) map.get("imgs"+i);
			System.out.println(imgs);
			if(imgs == null) break; //받아온 이미지가 더 없으면 for문 나가기
				
			byte[] imageData = Base64.decodeBase64(imgs.getBytes()); //디코딩
			String fileName = UUID.randomUUID().toString() + ".png"; //랜덤이름 생성
				
			if(i==0) dto.setSr_img1(fileName);
			if(i==1) dto.setSr_img2(fileName);
			if(i==2) dto.setSr_img3(fileName);
			if(i==3) dto.setSr_img4(fileName);
				
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
		System.out.println(game_num);
		//insert
		int res = shopMapper.insertReview(dto);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "상품 리뷰가 등록되었습니다. 감사합니다😊");
			mav.addObject("url", "shop_view2.do?prod_num="+prod_num);//shop_mypage_reviewList.do?mode=all&sort=all
		}else {
			mav.addObject("msg", "상품 등록 실패! 파일 업로드 성공! 상품 등록 페이지로 이동합니다.");
			mav.addObject("url", "shop_insertReview.do");
		}
		return mav;
	}
		
	//상품 리뷰 수정
	@RequestMapping(value="/shop_updateReview.do", method=RequestMethod.GET)
	public ModelAndView updateReview(@RequestParam int sr_num) {
		ShopReviewDTO dto = shopMapper.getReview(sr_num);
		return new ModelAndView("shop/shop_updateReview", "getReview", dto);
	}
		
	//상품 리뷰 수정처리
	@RequestMapping(value="/shop_updateReview.do", method=RequestMethod.POST)
	public ModelAndView updateOkReview(HttpServletRequest req, @RequestParam Map<String, String> params, @ModelAttribute ShopReviewDTO dto, BindingResult result) {
		if(result.hasErrors()) {}		
		// 파일 업로드
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile mf = mr.getFile("sr_img1");
		String sr_img1 = mf.getOriginalFilename();
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/resources/img");
		// 파일명 중복 방지
		UUID uuid = UUID.randomUUID();
		sr_img1 = uuid.toString() + "_" +sr_img1;
			
		if(!mf.isEmpty()) {//이미지 수정시
			// 파일 객체 생성, 업로드
			File file = new File(upPath, sr_img1);
			try {
				mf.transferTo(file);
			}catch(IOException e) {
				e.printStackTrace();
				System.out.println("file 수정중 오류 발생");
			}
			// 파일 이름 dto 세팅
			dto.setSr_img1(sr_img1);
			// 이전 파일 지우기
			File file01 = new File(upPath, params.get("sr_img0"));
			if(file01.exists()) { // 파일이 존재하면
				file01.delete();
			}
		}else { // 이미지 수정 하지 않는 경우
			// 파일 이름만 dto 세팅
			dto.setSr_img1(params.get("sr_img0"));
		}
		int res = shopMapper.updateReview(dto);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "상품 리뷰가 수정 수정되었습니다.");
			mav.addObject("url", "shop_viewReview.do?sr_num="+dto.getSr_num());
		}else {
			mav.addObject("msg", "상품 리뷰 수정 실패! 상품 수정 페이지로 이동합니다.");
			mav.addObject("url", "shop_updateReview.do?sr_num="+dto.getSr_num());
		}
		return mav;
	}
	
	//상품 리뷰 삭제
	@RequestMapping("/shop_deleteReview.do")
	public ModelAndView deleteReview(HttpServletRequest req, @RequestParam Map<String, String> params) {
		// 상품 삭제
		int res = shopMapper.deleteReview(Integer.parseInt(params.get("sr_num")));
					
		ModelAndView mav = new ModelAndView("message");
					
		if(res>0) {		
			HttpSession session = req.getSession();
			String upPath = session.getServletContext().getRealPath("/resources/img");

			// 파일 삭제
			File file = new File(upPath, params.get("sr_img1"));
			if(file.exists()) { // 파일이 존재하면
				file.delete();
				mav.addObject("msg", "상품 리뷰가 삭제되었습니다.");
				mav.addObject("url", "shop_review2.do");
			}else { // 파일이 없는 경우
				mav.addObject("msg", "상품 리뷰 삭제 성공! 파일 삭제 실패! 메인 페이지로 이동합니다.");
				mav.addObject("url", "shop_main.do");
			}
		}else {
			mav.addObject("msg", "상품 리뷰 삭제 실패! 메인 페이지로 이동합니다.");
			mav.addObject("url", "shop_main.do");
		}
		return mav;
	}
		
	//상품 문의 등록
	@RequestMapping(value="/shop_insertQnA.do", method=RequestMethod.GET)
	public ModelAndView insertQnA(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<ShopProductDTO> listProd = shopMapper.listProd();
		session.setAttribute("listProd", listProd);
		// 목록 세션 꺼내기/저장
		if(listProd == null) {
			listProd = shopMapper.listProd();
			session.setAttribute("listProd", listProd);
		}
		return new ModelAndView("shop/shop_insertQnA", "listProd", listProd);
	}
	
	//상품 문의 등록처리
	@RequestMapping(value="/shop_insertQnA.do", method=RequestMethod.POST)
	public ModelAndView insertOkQnA(HttpServletRequest req, @RequestParam Map<String, Object> map, @RequestParam String sq_passwd, @RequestParam int prod_num, @ModelAttribute ShopQnADTO dto , BindingResult result) {
		if(result.hasErrors()) {}//항상 바인딩 에러 발생할 수 밖에 없음. 처리할 건 딱히 없음.
			
		HttpSession session = req.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		System.out.println("문의등록 멤버넘버" + mem_num);
		dto.setMem_num(mem_num);
			
		System.out.println("비밀번호"+sq_passwd);
		//비밀번호 없다면 공개글(0), 비밀번호 있다면 비밀글(1)
		if(sq_passwd.length() == 0) {
			dto.setSq_secret(0);
		}else {
			dto.setSq_secret(1);
		}
			
		String upPath = session.getServletContext().getRealPath("/resources/img");
		for(int i=0; i<4; ++i) {
			String imgs = (String) map.get("imgs"+i);
			System.out.println(imgs);
			if(imgs == null) break; //받아온 이미지가 더 없으면 for문 나가기
				
			byte[] imageData = Base64.decodeBase64(imgs.getBytes()); //디코딩
			String fileName = UUID.randomUUID().toString() + ".png"; //랜덤이름 생성
				
			if(i==0) dto.setSq_img1(fileName);
			if(i==1) dto.setSq_img2(fileName);
			if(i==2) dto.setSq_img3(fileName);
			if(i==3) dto.setSq_img4(fileName);
				
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
			
		//insert
		int res = shopMapper.insertQnA(dto);
		ModelAndView mav = new ModelAndView("message");
		if(res>0) {
			mav.addObject("msg", "상품 문의가 등록되었습니다. 확인 후 답변드리겠습니다😄");
			mav.addObject("url", "shop_view4.do?prod_num="+prod_num);//shop_mypage_reviewList.do?mode=all&sort=all
		}else {
			mav.addObject("msg", "상품 문의 등록 실패! 파일 업로드 성공! 상품 문의등록 페이지로 이동합니다.");
			mav.addObject("url", "shop_insertQnA.do");
		}
		return mav;
	}	
		
	//쇼핑몰 상품상세 3.배송/교환/환불
	@RequestMapping("/shop_view3.do")
	public ModelAndView view3Shop(@RequestParam int prod_num) {
		ModelAndView mav = new ModelAndView("shop/shop_view3");
		//위쪽 상품상세 꺼내기
		ShopProductDTO pdto = shopMapper.getProd(prod_num);
		mav.addObject("getProd", pdto);
		//리뷰 별점 평균
		int count = shopMapper.shopviewReviewCount(prod_num);
		if(count != 0) {
			int reviewAvg = shopMapper.reviewAvg(prod_num);
			System.out.println("리뷰별점평균"+reviewAvg);
			mav.addObject("reviewAvg", reviewAvg);
			mav.addObject("count", count);
		}
		//쿠폰 꺼내기
		List<ShopCouponDTO> clist = shopMyPageMapper.couponList();
		   mav.addObject("couponList", clist);
		return mav;
	}	
		
	//쇼핑몰 상품상세 4.QnA
	@RequestMapping("/shop_view4.do")
	public ModelAndView view4Shop(HttpServletRequest req, @RequestParam int prod_num) {
		ModelAndView mav = new ModelAndView("shop/shop_view4");
		//위쪽 상품상세 꺼내기
		ShopProductDTO pdto = shopMapper.getProd(prod_num);
		mav.addObject("getProd", pdto);
		//리뷰 별점 평균
		int count = shopMapper.shopviewReviewCount(prod_num);
		if(count != 0) {
			int reviewAvg = shopMapper.reviewAvg(prod_num);
			System.out.println("리뷰별점평균"+reviewAvg);
			mav.addObject("reviewAvg", reviewAvg);
			mav.addObject("count", count);
		}	
			
		//쿠폰 꺼내기
		List<ShopCouponDTO> clist = shopMyPageMapper.couponList();
		mav.addObject("couponList", clist);
		    
		//해당 상품 문의 꺼내기
		mav.addObject("prod_num", prod_num);//있어야 페이징함
		    
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println(pageNum);		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		//int count = shopMapper.shopviewQnACount(prod_num);
		System.out.println("리뷰개수"+count);
		if (endRow > count)
			endRow = count;
		Map<String, Integer> params = new HashMap<>();
		params.put("start", startRow);
		params.put("end", endRow);
		params.put("prod_num", prod_num);
		List<ShopQnADTO> list = null;
		if (count > 0) {
			list = shopMapper.getViewQnA(params);
			System.out.println("문의리스트"+list);
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
			mav.addObject("getViewQnA", list);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		mav.addObject("rowNum", rowNum);
		return mav;	
	}	
		
	//쇼핑몰 장바구니 추가
	@RequestMapping("/shop_insertCart.do")
	public ModelAndView shopInsertCart(HttpServletRequest req, @ModelAttribute ShopCartDTO dto, @RequestParam int prod_num, @RequestParam int cart_qty, @RequestParam int game_num, BindingResult result) {
		if(result.hasErrors()) {}//항상 바인딩 에러 발생할 수 밖에 없음. 처리할 건 딱히 없음.
			
		//회원 정보 세션에서 꺼내기
		HttpSession session = req.getSession();
		int mem_num = (int)session.getAttribute("mem_num");
		System.out.println("메인페이지 멤버넘버" + mem_num);
		dto.setMem_num(mem_num);
			
		ModelAndView mav = new ModelAndView("message");
			
		//이미 카트에 등록된 데이터가 있다면!
		List<ShopCartDTO> listCart = shopMapper.listCart();
		   	for(ShopCartDTO cdto : listCart) {
			if (cdto.getProd_num() == prod_num) {
				System.out.println("여기 들어오냐구!!!"+cdto.getProd_num());
				cdto.setCart_qty(cdto.getCart_qty() + cart_qty);
				//수정된 cdto로 DB 업데이트해주기
				int res = shopMapper.updateCart(cdto);
				if(res>0) { //message말고 모달을 이용?????
					mav.addObject("msg", cart_qty + "개의 상품이 장바구니에 추가되었습니다.");
					mav.addObject("url", "shop_listCart.do?prod_num=" + prod_num);					
					return mav;
				}
			}
		}
		   	
		 //카트에 새로 담는다면!
		int res = shopMapper.insertCart(dto);
		if(res>0) {
			mav.addObject("msg", cart_qty + "개의 상품을 장바구니에 담았습니다.");
			mav.addObject("url", "shop_listCart.do?prod_num=" + prod_num);
		}else {
			mav.addObject("msg", "장바구니 등록 실패! 상품 상세 페이지로 이동합니다.");
			mav.addObject("url", "shop_view.do?prod_num" + prod_num);
		}
		return mav;	   	
	}
		
	//쇼핑몰 장바구니 목록
	@RequestMapping("/shop_listCart.do")
	public ModelAndView shoplistCart(@RequestParam int prod_num) {
		ModelAndView mav = new ModelAndView("shop/shop_listCart");
			
		int count = shopMapper.shopCartCount(prod_num);
		mav.addObject("count", count);
			
		List<ShopCartDTO> listCart = shopMapper.listCart(); 
		mav.addObject("listCart", listCart);
		return mav;
	}
		
	//쇼핑몰 장바구니 수정
	@RequestMapping("/shop_updateCart.do")
	public ModelAndView updateCart(@ModelAttribute ShopCartDTO dto, @RequestParam int cart_qty, @RequestParam(defaultValue="1", required=false) int prod_num) {
		int res = shopMapper.updateCart(dto);
		ModelAndView mav = new ModelAndView("message");
		List<ShopCartDTO> listCart = shopMapper.listCart();
		if(res>0) {
			for(ShopCartDTO cdto : listCart) {
				if(cdto.getProd_num() == prod_num) {
					System.out.println("여기 들어오니?????"+cdto.getProd_num());
					cdto.setCart_qty(cart_qty);
					mav.addObject("msg", "상품 수량이 " + cart_qty + "개로 수정되었습니다.");
					mav.addObject("url", "shop_listCart.do?prod_num=" + prod_num);
					return mav;
				}
			}
		}else {
			mav.addObject("msg", "장바구니 수량 수정 실패! 장바구니 목록 페이지로 이동합니다.");
			mav.addObject("url", "shop_listCart.do?prod_num=" + prod_num);
		}
		return mav;		
	}
		
	//쇼핑몰 장바구니 삭제
	@RequestMapping("/shop_deleteCart.do")
	public ModelAndView deleteCart(@RequestParam int cart_num) {
		System.out.println("여기오니????????");
		ModelAndView mav = new ModelAndView("message");
		int res = shopMapper.deleteCart(cart_num);
		System.out.println(res);
		if(res>0) {
			mav.addObject("msg", "장바구니 상품이 삭제 되었습니다.");
			mav.addObject("url", "shop_main.do");
		}
		System.out.println(mav.getViewName());
		return mav;
	}
	
}
