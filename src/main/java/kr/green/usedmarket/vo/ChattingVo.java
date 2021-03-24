package kr.green.usedmarket.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ChattingVo {

	private int chro_num;
	private int chro_pd_num;
	private String chro_buyer_mb_id;
	private String chro_seller_mb_id;
	private int chmg_num;
	private String chmg_mb_id;
	private String chmg_content;
	private Date chmg_sendDate;
	public int getChro_num() {
		return chro_num;
	}
	public void setChro_num(int chro_num) {
		this.chro_num = chro_num;
	}
	public int getChro_pd_num() {
		return chro_pd_num;
	}
	public void setChro_pd_num(int chro_pd_num) {
		this.chro_pd_num = chro_pd_num;
	}
	public String getChro_buyer_mb_id() {
		return chro_buyer_mb_id;
	}
	public void setChro_buyer_mb_id(String chro_buyer_mb_id) {
		this.chro_buyer_mb_id = chro_buyer_mb_id;
	}
	public String getChro_seller_mb_id() {
		return chro_seller_mb_id;
	}
	public void setChro_seller_mb_id(String chro_seller_mb_id) {
		this.chro_seller_mb_id = chro_seller_mb_id;
	}
	public int getChmg_num() {
		return chmg_num;
	}
	public void setChmg_num(int chmg_num) {
		this.chmg_num = chmg_num;
	}
	public String getChmg_mb_id() {
		return chmg_mb_id;
	}
	public void setChmg_mb_id(String chmg_mb_id) {
		this.chmg_mb_id = chmg_mb_id;
	}
	public String getchmg_content() {
		return chmg_content;
	}
	public void setchmg_content(String chmg_content) {
		this.chmg_content = chmg_content;
	}
	public String getChmg_sendDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("MM-dd hh:mm");
		String dateString = simpleFormat.format(chmg_sendDate);
		return dateString;
	}
	public void setChmg_sendDate(Date chmg_sendDate) {
		this.chmg_sendDate = chmg_sendDate;
	}
	@Override
	public String toString() {
		return "ChattionVo [chro_num=" + chro_num + ", chro_pd_num=" + chro_pd_num + ", chro_buyer_mb_id="
				+ chro_buyer_mb_id + ", chro_seller_mb_id=" + chro_seller_mb_id + ", chmg_num=" + chmg_num
				+ ", chmg_mb_id=" + chmg_mb_id + ", chmg_content=" + chmg_content + ", chmg_sendDate=" + chmg_sendDate
				+ "]";
	}
			
}
