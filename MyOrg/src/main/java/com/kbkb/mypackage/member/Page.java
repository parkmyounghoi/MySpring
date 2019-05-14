package com.kbkb.mypackage.member;

public class Page {

	private int startrow;
	private int endrow;
	
	public Page(int startrow, int endrow) {
		this.startrow = startrow;
		this.endrow = endrow;
	}
	@Override
	public String toString() {
		return "Page [startrow=" + startrow + ", endrow=" + endrow + "]";
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	
}
