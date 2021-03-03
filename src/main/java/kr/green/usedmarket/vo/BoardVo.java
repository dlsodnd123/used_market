package kr.green.usedmarket.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVo {
	private int bo_num;
	private String bo_mb_id;
	private int bo_pd_num;
	private String bo_st_name;
	private int bo_type;
	private String bo_title;
	private String bo_content;
	private Date bo_registerDate;
	private String bo_isDel;
	private int bo_views;
	private int bo_orignNum;
	private int bo_gorupOrd;
	private int bo_gorupLayer;
	
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public String getBo_mb_id() {
		return bo_mb_id;
	}
	public void setBo_mb_id(String bo_mb_id) {
		this.bo_mb_id = bo_mb_id;
	}
	public int getBo_pd_num() {
		return bo_pd_num;
	}
	public void setBo_pd_num(int bo_pd_num) {
		this.bo_pd_num = bo_pd_num;
	}	
	public String getBo_st_name() {
		return bo_st_name;
	}
	public void setBo_st_name(String bo_st_name) {
		this.bo_st_name = bo_st_name;
	}
	public int getBo_type() {
		return bo_type;
	}
	public void setBo_type(int bo_type) {
		this.bo_type = bo_type;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_registerDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = simpleFormat.format(bo_registerDate);
		return dateString;
	}
	public void setBo_registerDate(Date bo_registerDate) {
		this.bo_registerDate = bo_registerDate;
	}
	public String getBo_isDel() {
		return bo_isDel;
	}
	public void setBo_isDel(String bo_isDel) {
		this.bo_isDel = bo_isDel;
	}
	public int getBo_views() {
		return bo_views;
	}
	public void setBo_views(int bo_views) {
		this.bo_views = bo_views;
	}
	public int getBo_orignNum() {
		return bo_orignNum;
	}
	public void setBo_orignNum(int bo_orignNum) {
		this.bo_orignNum = bo_orignNum;
	}
	public int getBo_gorupOrd() {
		return bo_gorupOrd;
	}
	public void setBo_gorupOrd(int bo_gorupOrd) {
		this.bo_gorupOrd = bo_gorupOrd;
	}
	public int getBo_gorupLayer() {
		return bo_gorupLayer;
	}
	public void setBo_gorupLayer(int bo_gorupLayer) {
		this.bo_gorupLayer = bo_gorupLayer;
	}
	@Override
	public String toString() {
		return "BoardVo [bo_num=" + bo_num + ", bo_mb_id=" + bo_mb_id + ", bo_pd_num=" + bo_pd_num + ", bo_st_name="
				+ bo_st_name + ", bo_type=" + bo_type + ", bo_title=" + bo_title + ", bo_content=" + bo_content
				+ ", bo_registerDate=" + bo_registerDate + ", bo_isDel=" + bo_isDel + ", bo_views=" + bo_views
				+ ", bo_orignNum=" + bo_orignNum + ", bo_gorupOrd=" + bo_gorupOrd + ", bo_gorupLayer=" + bo_gorupLayer
				+ "]";
	}
}
