package kr.green.usedmarket.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DibsVo {
	private int pd_num;
	private String pd_mb_id;
	private String pd_title;
	private int pd_price;
	private String pd_deal;
	private Date pd_registerDate;
	private int pd_interestCnt;
	private String pd_area;
	private String st_img;
	
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	public String getPd_mb_id() {
		return pd_mb_id;
	}
	public void setPd_mb_id(String pd_mb_id) {
		this.pd_mb_id = pd_mb_id;
	}
	public String getPd_title() {
		return pd_title;
	}
	public void setPd_title(String pd_title) {
		this.pd_title = pd_title;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public String getPd_deal() {
		return pd_deal;
	}
	public void setPd_deal(String pd_deal) {
		this.pd_deal = pd_deal;
	}
	public String getPd_registerDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = simpleFormat.format(pd_registerDate);
		return dateString;
	}
	public void setPd_registerDate(Date pd_registerDate) {
		this.pd_registerDate = pd_registerDate;
	}	
	public int getPd_interestCnt() {
		return pd_interestCnt;
	}
	public void setPd_interestCnt(int pd_interestCnt) {
		this.pd_interestCnt = pd_interestCnt;
	}	
	public String getPd_area() {
		return pd_area;
	}
	public void setPd_area(String pd_area) {
		this.pd_area = pd_area;
	}
	public String getSt_img() {
		return st_img;
	}
	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}
	@Override
	public String toString() {
		return "DibsVo [pd_num=" + pd_num + ", pd_mb_id=" + pd_mb_id + ", pd_title=" + pd_title + ", pd_price="
				+ pd_price + ", pd_deal=" + pd_deal + ", pd_registerDate=" + pd_registerDate + ", pd_interestCnt="
				+ pd_interestCnt + ", pd_area=" + pd_area + ", st_img=" + st_img + "]";
	}	
}
