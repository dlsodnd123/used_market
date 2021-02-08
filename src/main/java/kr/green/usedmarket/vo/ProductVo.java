package kr.green.usedmarket.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ProductVo {
	private int pd_num;
	private String pd_mb_id;
	private String pd_st_name;
	private String pd_title;
	private String pd_category;
	private String pd_content;
	private int pd_price;
	private String pd_deal;
	private Date pd_registerDate;
	private String pd_isSail;
	private String pd_isDel;
	private int pd_count;
	
	public ProductVo() {}
	
	
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
	public String getPd_st_name() {
		return pd_st_name;
	}
	public void setPd_st_name(String pd_st_name) {
		this.pd_st_name = pd_st_name;
	}
	public String getPd_title() {
		return pd_title;
	}
	public void setPd_title(String pd_title) {
		this.pd_title = pd_title;
	}
	public String getPd_category() {
		return pd_category;
	}
	public void setPd_category(String pd_category) {
		this.pd_category = pd_category;
	}
	public String getPd_content() {
		return pd_content;
	}
	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
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
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = simpleFormat.format(pd_registerDate);
		return dateString;
	}
	public void setPd_registerDate(Date pd_registerDate) {
		this.pd_registerDate = pd_registerDate;
	}
	public String getPd_isSail() {
		return pd_isSail;
	}
	public void setPd_isSail(String pd_isSail) {
		this.pd_isSail = pd_isSail;
	}
	public String getPd_isDel() {
		return pd_isDel;
	}
	public void setPd_isDel(String pd_isDel) {
		this.pd_isDel = pd_isDel;
	}
	public int getPd_count() {
		return pd_count;
	}
	public void setPd_count(int pd_count) {
		this.pd_count = pd_count;
	}
	@Override
	public String toString() {
		return "ProductVo [pd_num=" + pd_num + ", pd_mb_id=" + pd_mb_id + ", pd_st_name=" + pd_st_name + ", pd_title="
				+ pd_title + ", pd_category=" + pd_category + ", pd_content=" + pd_content + ", pd_price=" + pd_price
				+ ", pd_deal=" + pd_deal + ", pd_registerDate=" + pd_registerDate + ", pd_isSail=" + pd_isSail
				+ ", pd_isDel=" + pd_isDel + ", pd_count=" + pd_count + "]";
	}

}
