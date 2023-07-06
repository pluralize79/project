package com.ezen.FSB.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.FSB.dto.BoardDTO;
import com.ezen.FSB.dto.Board_replyDTO;
import com.ezen.FSB.dto.GameDTO;
import com.ezen.FSB.dto.MemberDTO;
import com.ezen.FSB.dto.NoticeDTO;
import com.ezen.FSB.dto.ProfileDTO;
import com.ezen.FSB.dto.ReportDTO;
import com.ezen.FSB.dto.ReviewDTO;
import com.ezen.FSB.dto.SH_boardDTO;
import com.ezen.FSB.dto.SH_board_replyDTO;
import com.ezen.FSB.dto.ShopCouponDTO;
import com.ezen.FSB.dto.ShopProductDTO;
import com.ezen.FSB.dto.ShopQnADTO;
import com.ezen.FSB.dto.ShopReviewDTO;
import com.ezen.FSB.dto.ShopUserCouponDTO;
import com.ezen.FSB.dto.TagDTO;
import com.ezen.FSB.dto.ThemeDTO;

@Service
public class AdminMapper {

	@Autowired
	private SqlSession sqlSession;
	// 보드게임
	
	// 보드게임 목록
	public List<GameDTO> listGame(){
		return sqlSession.selectList("adminListGame");
	}
	// 보드게임 등록
	public int insertGame(GameDTO dto) {
		return sqlSession.insert("adminInsertGame", dto);
	}
	// 보드게임 태그 등록
	public int maxGameNum() { // f_game_seq.nextval
		return sqlSession.selectOne("adminMaxGameNum");
	}
	public int insertGameTag(TagDTO dto) {
		return sqlSession.insert("adminInsertGameTag", dto);
	}
	// 보드게임 테마 목록
	public List<ThemeDTO> listTheme(){
		return sqlSession.selectList("adminThemeList");
	}
	// 보드게임 테마 최대 num
	public int maxThemeNum() {
		return sqlSession.selectOne("adminMaxThemeNum");
	}
	// 보드게임 테마로 게임 목록 가져오기
	public List<GameDTO> findThemeGame(int theme_num){
		return sqlSession.selectList("adminFindThemeGame", theme_num);
	}
	// 보드게임 테마 정보 가져오기
	public ThemeDTO getTheme(int theme_num) {
		return sqlSession.selectOne("adminGetTheme", theme_num);
	}
	
	// 보드게임 상세보기
	public GameDTO getGame(int game_num) {
		return sqlSession.selectOne("adminGetGame", game_num);
	}
	public List<TagDTO> getGameTagList(int game_num){
		return sqlSession.selectList("adminGetGameTagList", game_num);
	}
	public List<ReviewDTO> getGameReview(int game_num){
		return sqlSession.selectList("adminGetGameReview", game_num);
	}
	public List<ReviewDTO> getGameReviewReport(int game_num){
		return sqlSession.selectList("adminGetGameReviewReport", game_num);
	}
	// 보드게임 한줄평 리뷰 수, 별점
	public int getGameReviewCount(int game_num) {
		return sqlSession.selectOne("adminGetGameReviewCount", game_num);
	}
	public int getGameReviewStar(int game_num) {
		return sqlSession.selectOne("adminGetGameReviewStar", game_num);
	}
	// 보드게임 한줄평 삭제
	public int deleteGameReview(int review_num) {
		return sqlSession.delete("adminDeleteGameReview", review_num);
	}
	// 보드게임 삭제 시, 한줄평 삭제
	public int deleteGameReview2(int game_num) {
		return sqlSession.delete("adminDeleteGameReview2", game_num);
	}
	// 보드게임 한줄평 신고 내역
	public List<ReviewDTO> listReviewReport(){
		return sqlSession.selectList("adminListReviewReport");
	}
	// 보드게임 한줄평 신고 내역 정렬
	public List<ReviewDTO> listReviewReport1(){ // game_num asc
		return sqlSession.selectList("adminListReviewReport1");
	}
	public List<ReviewDTO> listReviewReport2(){ // game_num desc
		return sqlSession.selectList("adminListReviewReport2");
	}
	public List<ReviewDTO> listReviewReport3(){ // review_regdate asc
		return sqlSession.selectList("adminListReviewReport3");
	}
	public List<ReviewDTO> listReviewReport4(){ // review_regdate desc
		return sqlSession.selectList("adminListReviewReport4");
	}
	// 보드게임 한줄평 신고 내역 찾기
	public List<ReviewDTO> findReviewReport(java.util.Map<String, String> params){
		return sqlSession.selectList("adminFindReviewReport", params);
	}
	// 보드게임 한줄평 신고 취소 처리
	public int updateReviewReport(int review_num) {
		return sqlSession.update("adminUpdateReviewReport", review_num);
	}
	
	// 보드게임 찾기
	public List<GameDTO> findGame(java.util.Map<String, String> params){
		return sqlSession.selectList("adminFindGame", params);
	}
	// 보드게임 삭제
	public int deleteGame(int game_num) {
		return sqlSession.delete("adminDeleteGame", game_num);
	}
	// 보드게임 수정
	public int updateGame(GameDTO dto) {
		return sqlSession.update("adminUpdateGame", dto);
	}
	// 보드게임 수정 시 해당 태그 모두 삭제
	public int deleteGameTag(int game_num) {
		return sqlSession.delete("adminDeleteGameTag", game_num);
	}
	// 테마 수정
	public int updateTheme(ThemeDTO dto) {
		return sqlSession.update("adminUpdateTheme", dto);
	}
	// 테마 등록
	public int insertTheme(String theme_name) {
		return sqlSession.insert("adminInsertTheme", theme_name);
	}
	// 테마 삭제
	public int deleteTheme(int theme_num) {
		return sqlSession.delete("adminDeleteTheme", theme_num);
	}
	// 해당 테마를 가지고 있는 tagDTO 확인
	public List<TagDTO> listThemeTag(int theme_num){
		return sqlSession.selectList("adminListThemeTag", theme_num);
	}
	// 해당 테마를 가지고 있던 tagDTO 삭제
	public int deleteThemeTag(int theme_num) {
		return sqlSession.delete("adminDeleteThemeTag", theme_num);
	}
	
	
	// 회원
	
	// 일반 회원 목록
	public List<MemberDTO> listMember() {
		return sqlSession.selectList("adminListMember");
	}
	// 일반 회원 등록
	public int insertMember(MemberDTO dto) {
			//키 받기
			int mem_num = sqlSession.selectOne("getNextMemNum");
			//멤버 삽입
			dto.setMem_num(mem_num);
			int res = sqlSession.insert("adminInsertMember", dto);
			if(res<=0) return -1;
			
			//프로필 삽입
			String[] CHO = {"ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"};
			String[] JOONG = {"ㅏ","ㅐ","ㅑ","ㅒ","ㅓ","ㅔ","ㅕ","ㅖ","ㅗ","ㅘ","ㅙ","ㅚ","ㅛ","ㅜ","ㅝ","ㅞ","ㅟ","ㅠ","ㅡ","ㅢ","ㅣ"};
			String[] JONG = {"","ㄱ","ㄲ","ㄳ","ㄴ","ㄵ","ㄶ","ㄷ","ㄹ","ㄺ","ㄻ","ㄼ","ㄽ","ㄾ","ㄿ","ㅀ","ㅁ","ㅂ","ㅄ","ㅅ","ㅆ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"};
			
			String nickname = dto.getMem_nickname();
			String nickname_separated = "";
			
			for(int i = 0; i < nickname.length(); i++) {
				char uniVal = nickname.charAt(i);
				
				// 한글일 경우만 시작해야 하기 때문에 0xAC00부터 아래의 로직을 실행한다
				if(uniVal >= 0xAC00) {
					uniVal = (char)(uniVal - 0xAC00);
					
					char cho = (char)(uniVal/28/21);
					char joong = (char) ((uniVal)/28%21);
					char jong = (char) (uniVal%28);
					
					nickname_separated += CHO[cho];
					nickname_separated += JOONG[joong];
					nickname_separated += JONG[jong];
				} else {
					nickname_separated += uniVal;
				}
			}
			ProfileDTO dto2 = new ProfileDTO();
			dto2.setMem_num(mem_num);
			dto2.setProf_nickname_separated(nickname_separated);
			
			res = sqlSession.insert("insertDefaultProfile", dto2);
			return res; //멤버등록 실패시 -1, 프로필만 실패시 0, 둘 다 성공시 1 반환
	}
	// 일반 회원 상세보기
	public MemberDTO getMember(int mem_num) {
		return sqlSession.selectOne("adminGetMember", mem_num);
	}	
	// 일반 회원 찾기
	public List<MemberDTO> findMember(java.util.Map<String, String> params){
		return sqlSession.selectList("adminFindMember", params);
	}
	// 일반 회원 삭제
	public int deleteMember(int mem_num) {
		return sqlSession.delete("adminDeleteMember", mem_num);
	}
	// 일반 회원 수정
	public int updateMemberPasswd(int mem_num) {
		return sqlSession.update("adminUpdateMemberPasswd", mem_num);
	}
	public int updateMemberNickname(int mem_num) {
		return sqlSession.update("adminUpdateMemberNickname", mem_num);
	}
	public int updateMemberImg(int mem_num) {
		return sqlSession.update("adminUpdateMemberImg", mem_num);
	}
	public int updateMemberReport(int mem_num) {
		return sqlSession.update("adminUpdateMemberReport", mem_num);
	}
	public int updateMemberMsg(int mem_num) {
		return sqlSession.update("adminUpdateMemberMsg", mem_num);
	}
	
	// 관리자 작성글
	
	// 관리자 작성글 등록
	public int insertNotice(NoticeDTO dto) {
		return sqlSession.insert("adminInsertNotice", dto);
	}
	// 관리자 작성글 목록
	public List<NoticeDTO> listNotice(){
		return sqlSession.selectList("adminListNotice");
	}
	// 관리자 작성글 정렬
	public List<NoticeDTO> sortNotice(String n_mode){ // 공지사항, 자주묻는 질문만 보기
		return sqlSession.selectList("adminListNoticeSort1", n_mode);
	}
	public List<NoticeDTO> sortNotice2(){ // 작성일 오래된 순
		return sqlSession.selectList("adminListNoticeSort2");
	}
	public List<NoticeDTO> sortNotice3(){ // 작성일 최근 순
		return sqlSession.selectList("adminListNoticeSort3");
	}
	// 관리자 작성글 찾기
	public List<NoticeDTO> findNotice(java.util.Map<String, String> params){
		return sqlSession.selectList("adminFindNotice", params);
	}
	// 관리자 작성글 삭제
	public int deleteNotice(int n_num) {
		return sqlSession.delete("adminDeleteNotice", n_num);
	}
	// 관리자 작성글 꺼내기
	public NoticeDTO getNotice(int n_num) {
		return sqlSession.selectOne("adminGetNotice", n_num);
	}
	// 관리자 작성글 수정
	public int updateNotice(NoticeDTO dto) {
		return sqlSession.update("adminUpdateNotice", dto);
	}
	
	// 쇼핑몰
	
	// 상품 목록
	public List<ShopProductDTO> listProd(){
		return sqlSession.selectList("adminListProd");
	}
	// 상품 꺼내기
	public ShopProductDTO getProd(int prod_num) {
		return sqlSession.selectOne("adminGetProd", prod_num);
	}
	// 상품의 별점 총합
	public int getProdStar(int prod_num) {
		return sqlSession.selectOne("adminGetProdStar", prod_num);
	}
	// 상품의 리뷰 수
	public int getProdReviewCount(int prod_num) {
		return sqlSession.selectOne("adminGetProdReviewCount", prod_num);
	}
	// 리뷰의 이미지 꺼내기
	public ShopReviewDTO getProdReviewImg(int sr_num) {
		return sqlSession.selectOne("adminGetProdReviewImg", sr_num);
	}
	// 상품 등록
	public List<GameDTO> listNotProdGame(){
		return sqlSession.selectList("adminNotProdGameList");
	}
	public int insertProd(ShopProductDTO dto) {
		return sqlSession.insert("adminInsertProd", dto);
	}
	// 상품 수정
	public int updateProd(ShopProductDTO dto) {
		return sqlSession.update("adminUpdateProd", dto);
	}
	// 상품 삭제
	public int deleteProd(int prod_num) {
		return sqlSession.delete("adminDeleteProd", prod_num);
	}
	// 상품 찾기
	public List<ShopProductDTO> findProdGameName(String searchString){
		return sqlSession.selectList("adminFindGameName", searchString);
	}
	public List<ShopProductDTO> findProdCompany(String searchString){
		return sqlSession.selectList("adminFindProdCompany", searchString);
	}
	// 상품 정렬
	public List<ShopProductDTO> sortProd(String sort){
		if(sort.equals("name_asc")) {
			return sqlSession.selectList("adminSortProd1");
		}else if(sort.equals("name_desc")) {
			return sqlSession.selectList("adminSortProd2");
		}else if(sort.equals("price_asc")) {
			return sqlSession.selectList("adminSortProd3");
		}else if(sort.equals("price_desc")) {
			return sqlSession.selectList("adminSortProd4");
		}else if(sort.equals("dis_asc")) {
			return sqlSession.selectList("adminSortProd5");
		}else if(sort.equals("dis_desc")) {
			return sqlSession.selectList("adminSortProd6");
		}else if(sort.equals("regdate_asc")) {
			return sqlSession.selectList("adminSortProd7");
		}else {
			return sqlSession.selectList("adminSortProd8");
		}
	}
	// 상품 관련 리뷰 목록
	public List<ShopReviewDTO> listProdReview(int prod_num){
		return sqlSession.selectList("adminGetProdReview", prod_num);
	}
	// 쿠폰 목록
	public List<ShopCouponDTO> listScoupon(){
		return sqlSession.selectList("adminListScoupon");
	}
	// 쿠폰 등록
	public int insertScoupon1(ShopCouponDTO dto) { // 만료일 지정 O
		return sqlSession.insert("adminInsertScoupon1", dto);
	}
	// 쿠폰 등록
	public int insertScoupon2(ShopCouponDTO dto) { // 만료일 지정 X
		return sqlSession.insert("adminInsertScoupon2", dto);
	}
	// 쿠폰 삭제
	public int deleteScoupon(int sc_num) {
		return sqlSession.delete("adminDeleteScoupon", sc_num);
	}
	// 해당 쿠폰을 가지고 있는 사용자 목록
	public List<ShopUserCouponDTO> listUsc(int sc_num){
		return sqlSession.selectList("adminListUsc", sc_num);
	}
	// 쇼핑몰 문의 내역
	public List<ShopQnADTO> listShopQnA(){
		return sqlSession.selectList("adminShopQnaList");
	}
	// 쇼핑몰 문의 내역 미처리 꺼내기
	public List<ShopQnADTO> listShopQnACheck(){
		return sqlSession.selectList("adminShopQnaListCheck");
	}
	// 쇼핑몰 문의 내역 꺼내기
	public ShopQnADTO getShopQnA(int sq_num) {
		return sqlSession.selectOne("adminShopQnaGet", sq_num);
	}
	// 쇼핑몰 문의 내역 답변달기
	public int shopQnaReply(ShopQnADTO dto) {
		return sqlSession.update("adminShopQnaReply", dto);
	}
	// 쇼핑몰 문의 내역 답변 삭제
	public int shopQnaReplyDel(int sq_num) {
		return sqlSession.update("adminShopQnaReplyDel", sq_num);
	}
	// 쇼핑몰 문의 내역 체크
	public int shopQnaReplyCheck(java.util.Map<String, Integer> params) {
		return sqlSession.update("adminShopQnaReplyCheck", params);
	}
	
	// 커뮤니티 관리
	
	// 게시판 공지글 목록
	public List<NoticeDTO> listBNotice(){
		return sqlSession.selectList("adminListBNotice");
	}
	// 게시판 공지글 sort
	public List<NoticeDTO> sortBNotice(String sort){
		if(sort.equals("board")) { // 전체
			return sqlSession.selectList("adminSortBNoticeAll");
		}else if(sort.equals("free")) { // 자유
			return sqlSession.selectList("adminSortBNoticeFree");
		}else if(sort.equals("anony")) { // 익명
			return sqlSession.selectList("adminSortBNoticeAnony");
		}else if(sort.equals("sh")) { // 중고
			return sqlSession.selectList("adminSortBNoticeSH");
		}else if(sort.equals("reg_desc")) { // 등록일 최근 순
			return sqlSession.selectList("adminSortBNoticeRegDesc");
		}else { // 등록일 오래된 순
			return sqlSession.selectList("adminSortBNoticeRegAsc");
		}
	}
	// 게시판 공지글 찾기
	public List<NoticeDTO> findBNotice(java.util.Map<String, String> params){
		return sqlSession.selectList("adminFindBNotice", params);
	}
	// 자유게시판 목록
	public List<BoardDTO> listFreeBoard(java.util.Map<String, Integer> params){
		return sqlSession.selectList("adminlistFreeBoard", params);
	}
	// 익명게시판 목록
	public List<BoardDTO> listAnonyBoard(java.util.Map<String, Integer> params){
		return sqlSession.selectList("adminlistAnonyBoard", params);
	}
	// 중고게시판 목록
	public List<SH_boardDTO> listSHBoard(java.util.Map<String, Integer> params){
		return sqlSession.selectList("adminlistSHBoard", params);
	}
	// 자유, 익명 게시판 댓글 목록
	public List<Board_replyDTO> listBoardReply(int board_num){
		return sqlSession.selectList("adminListBoardReply", board_num);
	}
	// 중고 게시판 댓글 목록
	public List<SH_board_replyDTO> listBoardSHReply(int board_num){
		return sqlSession.selectList("adminListBoardSHReply", board_num);
	}
	// 자유, 익명게시판 상세보기
	public BoardDTO getBoard(int board_num) {
		return sqlSession.selectOne("adminGetBoard", board_num);
	}
	// 중고 게시판 상세보기
	public SH_boardDTO getBoardSH(int board_num) {
		return sqlSession.selectOne("adminGetBoardSH", board_num);
	}
	// 중고 게시판 댓글 신고 내역
	public List<ReportDTO> listReportBr_sh(int report_target){
		return sqlSession.selectList("adminListReportBr_sh", report_target);
	}
	// 자유, 익명 게시판 댓글 신고 내역
	public List<ReportDTO> listReportBr(int report_target){
		return sqlSession.selectList("adminListReportBr", report_target);
	}
	// 중고 게시글 신고 내역
	public List<ReportDTO> listReportBoard_sh(int report_target){
		return sqlSession.selectList("adminListReportBoard_sh", report_target);
	}
	// 자유, 익명 게시글 신고내역
	public List<ReportDTO> listReportBoard(int report_target){
		return sqlSession.selectList("adminListReportBoard", report_target);
	}
	// 중고 게시글 신고 취소 (report 에서 지우기)
	public int delReportBoard_sh(int report_target) {
		return sqlSession.delete("adminDelReportBoard_sh", report_target);
	}
	// 중고 게시글 신고 취소 (board 에서 report -> 0 )
	public int updateReportBoard_sh(int board_num) {
		return sqlSession.update("adminUpdateReportBoard_sh", board_num);
	}
	// 자유, 익명 게시글 신고 취소 (report 에서 지우기)
	public int delReportBoard(int report_target) {
		return sqlSession.delete("adminDelReportBoard", report_target);
	}
	// 자유, 익명 게시글 신고 취소 (board report -> 0)
	public int updateReportBoard(int board_num) {
		return sqlSession.update("adminUpdateReportBoard", board_num);
	}
	// 중고 게시글 댓글 신고 취소 (report 에서 지우기)
	public int delReportBr_sh(int report_target) {
		return sqlSession.delete("adminDelReportBr_sh", report_target);
	}
	// 중고 게시글 댓글 신고 취소 (board report ->0)
	public int updateReportBr_sh(int br_num) {
		return sqlSession.update("adminUpdateReportBr_sh", br_num);
	}
	// 익명, 자유 게시글 댓글 신고 취소 (report 에서 지우기)
		public int delReportBr(int report_target) {
			return sqlSession.delete("adminDelReportBr", report_target);
	}
	// 익명, 자유 게시글 댓글 신고 취소 (board report ->0)
	public int updateReportBr(int br_num) {
		return sqlSession.update("adminUpdateReportBr", br_num);
	}
	// 중고 게시글 삭제 시, 신고 처리 여부 0 ->1
	public int checkReportBoard_sh(int report_target) {
		return sqlSession.update("adminCheckReportBoard_sh", report_target);
	}
	// 익명, 자유 게시글 삭제 시, 신고 처리 여부 0 ->1
	public int checkReportBoard(int board_num) {
		return sqlSession.update("adminCheckReportBoard", board_num);
	}
	// 중고 게시판 댓글 삭제
	public int delBr_sh(int br_num) {
		return sqlSession.delete("adminDelBr_sh", br_num);
	}
	// 익명, 자유게시판 댓글 삭제
	public int delBr(int br_num) {
		return sqlSession.delete("adminDelBr", br_num);
	}
	// 중고 게시판 댓글 신고 처리 여부 0 -> 1
	public int checkReportBr_sh(int report_target) {
		return sqlSession.update("adminCheckReportBr_sh", report_target);
	}
	// 익명, 자유게시판 댓글 신고 처리 여부 0 -> 1
	public int checkReportBr(int report_target) {
		return sqlSession.update("adminCheckReportBr", report_target);
	}
	// 중고 게시판 신고 댓글 목록
	public List<SH_board_replyDTO> listBoardSHReplyReport(int board_num){
		return sqlSession.selectList("adminListBoardSHReplyReport", board_num);
	}
	// 익명 게시판 신고 댓글 목록
	public List<Board_replyDTO> listBoardReplyReport(int board_num){
		return sqlSession.selectList("adminListBoardReplyReport",board_num);
	}
}
	
