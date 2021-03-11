package kr.green.usedmarket.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProductVo {
	private int pd_num;
	private String pd_mb_id;
	private String pd_title;
	private String pd_category;
	private String pd_content;
	private int pd_price;
	private String pd_deal;
	private Date pd_registerDate;
	private String pd_isSale;
	private String pd_saleDate;
	private String pd_isDel;
	private String pd_area;
	private int pd_interestCnt;
	private int pd_views;
	
	
	public int getPd_views() {
		return pd_views;
	}
	public void setPd_views(int pd_views) {
		this.pd_views = pd_views;
	}
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
	public String getPd_area() {
		return pd_area;
	}
	public void setPd_area(String pd_area) {
		this.pd_area = pd_area;
	}
	public String getPd_registerDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = simpleFormat.format(pd_registerDate);
		return dateString;
	}
	public void setPd_registerDate(Date pd_registerDate) {
		this.pd_registerDate = pd_registerDate;
	}
	public String getPd_isSale() {
		return pd_isSale;
	}
	public void setPd_isSale(String pd_isSale) {
		this.pd_isSale = pd_isSale;
	}
	public String getPd_isDel() {
		return pd_isDel;
	}
	public void setPd_isDel(String pd_isDel) {
		this.pd_isDel = pd_isDel;
	}
	public int getpd_interestCnt() {
		return pd_interestCnt;
	}
	public void setpd_interestCnt(int pd_interestCnt) {
		this.pd_interestCnt = pd_interestCnt;
	}
	public String getPd_saleDate() {
		return pd_saleDate;
	}
	public void setPd_saleDate(String pd_saleDate) {
		this.pd_saleDate = pd_saleDate;
	}
	@Override
	public String toString() {
		return "ProductVo [pd_num=" + pd_num + ", pd_mb_id=" + pd_mb_id + ", pd_title=" + pd_title + ", pd_category="
				+ pd_category + ", pd_content=" + pd_content + ", pd_price=" + pd_price + ", pd_deal=" + pd_deal
				+ ", pd_registerDate=" + pd_registerDate + ", pd_isSale=" + pd_isSale + ", pd_saleDate=" + pd_saleDate
				+ ", pd_isDel=" + pd_isDel + ", pd_area=" + pd_area + ", pd_interestCnt=" + pd_interestCnt
				+ ", pd_views=" + pd_views + "]";
	}
}
