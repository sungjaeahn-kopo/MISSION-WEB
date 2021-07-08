package kr.ac.kopo.member;

public class MemberVO {

	private String id;
	private String name;
	private String password;
	private String emailId;
	private String emailDomain;
	private String tel1;
	private String tel2;
	private String tel3;
	private String post;
	private String basicAddr;
	private String detailAddr;
	private String type;
	private String date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getBasicAddr() {
		return basicAddr;
	}
	public void setBasicAddr(String basicAddr) {
		this.basicAddr = basicAddr;
	}
	public String getDetailAddr() {
		return detailAddr;
	}
	public void setDetailAddr(String detailAddr) {
		this.detailAddr = detailAddr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", emailId=" + emailId
				+ ", emailDomain=" + emailDomain + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", post="
				+ post + ", basicAddr=" + basicAddr + ", detailAddr=" + detailAddr + ", type=" + type + ", date=" + date
				+ "]";
	}
	
}
