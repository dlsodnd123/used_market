package kr.green.usedmarket.vo;

import java.util.Date;

public class MemberVo {
	private String mb_id;
	private String mb_pw;
	private String mb_name;
	private String mb_gender;
	private String mb_postcode;
	private String mb_roadAddress;
	private String mb_jibunAddress;
	private String mb_detailAddress;
	private String mb_phone;
	private String mb_email;
	private String mb_division;
	private Date mb_joinDate;
	private String mb_isWithdrawal;
	private Date mb_withdawalDate;
	private String mb_calss;
	
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
	public String getMb_postcode() {
		return mb_postcode;
	}
	public void setMb_postcode(String mb_postcode) {
		this.mb_postcode = mb_postcode;
	}
	public String getMb_roadAddress() {
		return mb_roadAddress;
	}
	public void setMb_roadAddress(String mb_roadAddress) {
		this.mb_roadAddress = mb_roadAddress;
	}
	public String getMb_jibunAddress() {
		return mb_jibunAddress;
	}
	public void setMb_jibunAddress(String mb_jibunAddress) {
		this.mb_jibunAddress = mb_jibunAddress;
	}
	public String getMb_detailAddress() {
		return mb_detailAddress;
	}
	public void setMb_detailAddress(String mb_detailAddress) {
		this.mb_detailAddress = mb_detailAddress;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
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
	public String getMb_calss() {
		return mb_calss;
	}
	public void setMb_calss(String mb_calss) {
		this.mb_calss = mb_calss;
	}
	@Override
	public String toString() {
		return "MemberVo [mb_id=" + mb_id + ", mb_pw=" + mb_pw + ", mb_name=" + mb_name + ", mb_gender=" + mb_gender
				+ ", mb_postcode=" + mb_postcode + ", mb_roadAddress=" + mb_roadAddress + ", mb_jibunAddress="
				+ mb_jibunAddress + ", mb_detailAddress=" + mb_detailAddress + ", mb_phone=" + mb_phone + ", mb_email="
				+ mb_email + ", mb_division=" + mb_division + ", mb_joinDate=" + mb_joinDate + ", mb_isWithdrawal="
				+ mb_isWithdrawal + ", mb_withdawalDate=" + mb_withdawalDate + ", mb_calss=" + mb_calss + "]";
	}
	
}

