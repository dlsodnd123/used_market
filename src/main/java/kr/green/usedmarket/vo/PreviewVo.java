package kr.green.usedmarket.vo;

public class PreviewVo {
	private int pd_num;
	private String img_name;
	private int pd_price;
	
	public int getPd_num() {
		return pd_num;
	}
	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	
	@Override
	public String toString() {
		return "PreviewVo [pd_num=" + pd_num + ", img_name=" + img_name + ", pd_price=" + pd_price + "]";
	}

}
