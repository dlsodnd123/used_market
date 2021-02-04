package kr.green.usedmarket.vo;

/**
 * @author Administrator
 *
 */
public class StandVo {
	private String st_name;
	private String st_mb_id;
	private String st_img;
	private String st_content;
	
	public StandVo() {}
	
	public StandVo(String id) {
		st_name = id + "의 가판대";
		st_mb_id = id;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_mb_id() {
		return st_mb_id;
	}

	public void setSt_mb_id(String st_mb_id) {
		this.st_mb_id = st_mb_id;
	}

	public String getSt_img() {
		return st_img;
	}

	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}

	public String getSt_content() {
		return st_content;
	}

	public void setSt_content(String st_content) {
		this.st_content = st_content;
	}

	@Override
	public String toString() {
		return "StandVo [st_name=" + st_name + ", st_mb_id=" + st_mb_id + ", st_img=" + st_img + ", st_content="
				+ st_content + "]";
	}
	
}
