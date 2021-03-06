package kr.ac.kopo.login.dao;

public class LoginVO {

	private String id;
	private String password;
	private String name;
	private String type;		// type 'S' 관리자, 'U' 일반사용자
	
	public LoginVO() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + ", name=" + name + ", type=" + type + "]";
	}
	
}
