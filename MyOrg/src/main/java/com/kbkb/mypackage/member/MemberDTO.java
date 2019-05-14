package com.kbkb.mypackage.member;

public class MemberDTO {

	private int idx;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String emailsave;
	
	@Override
	public String toString() {
		return "MemberDTO [idx=" + idx + ", id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email
				+ ", emailsave=" + emailsave + "]";
	}
	
	public String getEmailsave() {
		return emailsave;
	}
	public void setEmailsave(String emailsave) {
		this.emailsave = emailsave;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	
}
