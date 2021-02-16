package kr.green.usedmarket.vo;

public class InterestPdVo {
	private int itpd_num;
	private int itpd_pd_num;
	private String itpd_mb_id;
	private int itpd_selected;
	public int getItpd_num() {
		return itpd_num;
	}
	public void setItpd_num(int itpd_num) {
		this.itpd_num = itpd_num;
	}
	public int getItpd_pd_num() {
		return itpd_pd_num;
	}
	public void setItpd_pd_num(int itpd_pd_num) {
		this.itpd_pd_num = itpd_pd_num;
	}
	public String getItpd_mb_id() {
		return itpd_mb_id;
	}
	public void setItpd_mb_id(String itpd_mb_id) {
		this.itpd_mb_id = itpd_mb_id;
	}
	public int getItpd_selected() {
		return itpd_selected;
	}
	public void setItpd_selected(int itpd_selected) {
		this.itpd_selected = itpd_selected;
	}
	@Override
	public String toString() {
		return "InterestProductVo [itpd_num=" + itpd_num + ", itpd_pd_num=" + itpd_pd_num + ", itpd_mb_id=" + itpd_mb_id
				+ ", itpd_selected=" + itpd_selected + "]";
	}
}
