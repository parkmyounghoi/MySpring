package com.kbkb.mypackage.guestbook;

public class GuestbookDTO {
	private int idx;
	private String content;
	private String reg_date;
	
	public GuestbookDTO() {}
	
	public GuestbookDTO(int idx, String content, String reg_date) {
		super();
		this.idx = idx;
		this.content = content;
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "GuestbookDTO [idx=" + idx + ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
