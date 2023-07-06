package com.ezen.FSB.dto;

public class PointDTO { // 멤버별 포인트 보유 현황
	
	private int mem_num;		// 멤버 seq
	private int point_total;	// 포인트 보유 잔액 // f_point_history 에서 해당 mem_num 의 가장 마지막 seq 의, point_total
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getPoint_total() {
		return point_total;
	}
	public void setPoint_total(int point_total) {
		this.point_total = point_total;
	}
	
}
