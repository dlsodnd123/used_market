package kr.green.usedmarket.vo;

import java.util.Date;

public class MemberVo {
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_gender;
	private String mb_address;
	private int mb_phone;
	private String mb_email;
	private String mb_division;
	private Date mb_joinDate;
	private String mb_isWithdrawal;
	private Date mb_withdawalDate;
	private String mb_class;
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_gender() {
		return mb_gender;
	}
	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}
	public String getMb_address() {
		return mb_address;
	}
	public void setMb_address(String mb_address) {
		this.mb_address = mb_address;
	}
	public int getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(int mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_division() {
		return mb_division;
	}
	public void setMb_division(String mb_division) {
		this.mb_division = mb_division;
	}
	public Date getMb_joinDate() {
		return mb_joinDate;
	}
	public void setMb_joinDate(Date mb_joinDate) {
		this.mb_joinDate = mb_joinDate;
	}
	public String getMb_isWithdrawal() {
		return mb_isWithdrawal;
	}
	public void setMb_isWithdrawal(String mb_isWithdrawal) {
		this.mb_isWithdrawal = mb_isWithdrawal;
	}
	public Date getMb_withdawalDate() {
		return mb_withdawalDate;
	}
	public void setMb_withdawalDate(Date mb_withdawalDate) {
		this.mb_withdawalDate = mb_withdawalDate;
	}
	public String getMb_class() {
		return mb_class;
	}
	public void setMb_class(String mb_class) {
		this.mb_class = mb_class;
	}
	@Override
	public String toString() {
		return "MemberVo [mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name + ", mb_gender=" + mb_gender
				+ ", mb_address=" + mb_address + ", mb_phone=" + mb_phone + ", mb_email=" + mb_email + ", mb_division="
				+ mb_division + ", mb_joinDate=" + mb_joinDate + ", mb_isWithdrawal=" + mb_isWithdrawal
				+ ", mb_withdawalDate=" + mb_withdawalDate + ", mb_class=" + mb_class + "]";
	}

}
