package kr.green.usedmarket.vo;

public class ProductQuestionsVo {
	private int bo_pd_num;
	private String bo_content;
	private String bo_mb_id;
	private String st_img;
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
	public String getSt_img() {
		return st_img;
	}
	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}
	@Override
	public String toString() {
		return "ProductQuestionsVo [bo_pd_num=" + bo_pd_num + ", bo_content=" + bo_content + ", bo_mb_id=" + bo_mb_id
				+ ", st_img=" + st_img + "]";
	}

}
