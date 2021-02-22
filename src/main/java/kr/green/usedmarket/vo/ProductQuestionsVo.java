package kr.green.usedmarket.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProductQuestionsVo {
	private int bo_num;
	private int bo_pd_num;
	private String bo_content;
	private String bo_mb_id;
	private Date bo_registerDate;
	private String st_img;
	private int cmt_num;
	private int cmt_bo_num;
	private String cmt_mb_id;
	private String cmt_content;
	private Date cmt_registerDate;
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public int getBo_pd_num() {
		return bo_pd_num;
	}
	public void setBo_pd_num(int bo_pd_num) {
		this.bo_pd_num = bo_pd_num;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_mb_id() {
		return bo_mb_id;
	}
	public void setBo_mb_id(String bo_mb_id) {
		this.bo_mb_id = bo_mb_id;
	}
	public String getBo_registerDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = simpleFormat.format(bo_registerDate);
		return dateString;
	}
	public void setBo_registerDate(Date bo_registerDate) {
		this.bo_registerDate = bo_registerDate;
	}
	public String getSt_img() {
		return st_img;
	}
	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}
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
	public String getCmt_registerDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = simpleFormat.format(cmt_registerDate);
		return dateString;
	}
	public void setCmt_registerDate(Date cmt_registerDate) {
		this.cmt_registerDate = cmt_registerDate;
	}
	@Override
	public String toString() {
		return "ProductQuestionsVo [bo_num=" + bo_num + ", bo_pd_num=" + bo_pd_num + ", bo_content=" + bo_content
				+ ", bo_mb_id=" + bo_mb_id + ", bo_registerDate=" + bo_registerDate + ", st_img=" + st_img
				+ ", cmt_num=" + cmt_num + ", cmt_bo_num=" + cmt_bo_num + ", cmt_mb_id=" + cmt_mb_id + ", cmt_content="
				+ cmt_content + ", cmt_registerDate=" + cmt_registerDate + "]";
	}
}
