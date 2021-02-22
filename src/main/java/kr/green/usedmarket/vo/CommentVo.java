package kr.green.usedmarket.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVo {
	private int cmt_num;
	private int cmt_bo_num;
	private int cmt_pd_num;
	private String cmt_mb_id;
	private String cmt_content;
	private String cmt_isDel;
	private Date cmt_registerDate;
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public int getCmt_bo_num() {
		return cmt_bo_num;
	}
	public void setCmt_bo_num(int cmt_bo_num) {
		this.cmt_bo_num = cmt_bo_num;
	}
	public String getCmt_mb_id() {
		return cmt_mb_id;
	}
	public void setCmt_mb_id(String cmt_mb_id) {
		this.cmt_mb_id = cmt_mb_id;
	}
	public String getCmt_content() {
		return cmt_content;
	}
	public void setCmt_content(String cmt_content) {
		this.cmt_content = cmt_content;
	}
	public String getCmt_isDel() {
		return cmt_isDel;
	}
	public void setCmt_isDel(String cmt_isDel) {
		this.cmt_isDel = cmt_isDel;
	}
	public String getCmt_registerDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = simpleFormat.format(cmt_registerDate);
		return dateString;
	}
	public void setCmt_registerDate(Date cmt_registerDate) {
		this.cmt_registerDate = cmt_registerDate;
	}
		public int getCmt_pd_num() {
		return cmt_pd_num;
	}
	public void setCmt_pd_num(int cmt_pd_num) {
		this.cmt_pd_num = cmt_pd_num;
	}
	@Override
	public String toString() {
		return "CommentVo [cmt_num=" + cmt_num + ", cmt_bo_num=" + cmt_bo_num + ", cmt_pd_num=" + cmt_pd_num
				+ ", cmt_mb_id=" + cmt_mb_id + ", cmt_content=" + cmt_content + ", cmt_isDel=" + cmt_isDel
				+ ", cmt_registerDate=" + cmt_registerDate + "]";
	}
}
