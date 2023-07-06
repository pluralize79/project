package com.ezen.FSB.dto;

public class ReportDTO { // 신고 내역
   private int report_num;         // 신고 등록 번호
   private int mem_num;         // 신고자 num
   private int report_target;      // 신고대상자 num   
   private String report_mode;      // 신고 종류 board, reply, sh_board, sh_reply
   private int report_content;      // 신고 내용 (1,2,3,4,5)
   private String report_regdate;   // 신고일
   private int report_check;      // 처리 유무 (0,1)
   private String report_detail;   // 신고 상세 내용
   
   //join 을 위한
   private String mem_nickname;
   
   public String getMem_nickname() {
	return mem_nickname;
   }
   public void setMem_nickname(String mem_nickname) {
	   this.mem_nickname = mem_nickname;
   }
   public String getReport_detail() {
      return report_detail;
   }
   public void setReport_detail(String report_detail) {
      this.report_detail = report_detail;
   }
   public int getReport_num() {
      return report_num;
   }
   public void setReport_num(int report_num) {
      this.report_num = report_num;
   }
   public int getMem_num() {
      return mem_num;
   }
   public void setMem_num(int mem_num) {
      this.mem_num = mem_num;
   }
   public int getReport_target() {
      return report_target;
   }
   public void setReport_target(int report_target) {
      this.report_target = report_target;
   }
   public String getReport_mode() {
      return report_mode;
   }
   public void setReport_mode(String report_mode) {
      this.report_mode = report_mode;
   }
   public int getReport_content() {
      return report_content;
   }
   public void setReport_content(int report_content) {
      this.report_content = report_content;
   }
   
   public String getReport_regdate() {
      return report_regdate;
   }
   public void setReport_regdate(String report_regdate) {
      this.report_regdate = report_regdate;
   }
   public int getReport_check() {
      return report_check;
   }
   public void setReport_check(int report_check) {
      this.report_check = report_check;
   }
   
   
}