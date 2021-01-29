package kr.green.usedmarket.vo;

import java.util.Date;

public class MemberVo {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String postcode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private int phone;
	private String email;
	private String division;
	private Date joinDate;
	private String isWithdrawal;
	private Date withdawalDate;
	private String mb_calss;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getIsWithdrawal() {
		return isWithdrawal;
	}
	public void setIsWithdrawal(String isWithdrawal) {
		this.isWithdrawal = isWithdrawal;
	}
	public Date getWithdawalDate() {
		return withdawalDate;
	}
	public void setWithdawalDate(Date withdawalDate) {
		this.withdawalDate = withdawalDate;
	}
	public String getMb_calss() {
		return mb_calss;
	}
	public void setMb_calss(String mb_calss) {
		this.mb_calss = mb_calss;
	}
	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", postcode=" + postcode
				+ ", roadAddress=" + roadAddress + ", jibunAddress=" + jibunAddress + ", detailAddress=" + detailAddress
				+ ", phone=" + phone + ", email=" + email + ", division=" + division + ", joinDate=" + joinDate
				+ ", isWithdrawal=" + isWithdrawal + ", withdawalDate=" + withdawalDate + ", mb_calss=" + mb_calss
				+ "]";
	}
}

