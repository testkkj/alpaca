package com.alpaca.comment;

public class commentVO {
	private int bnum;
	private String writer;
	private String content;
	private String wridate;

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWridate() {
		return wridate;
	}

	public void setWridate(String wridate) {
		this.wridate = wridate;
	}

	@Override
	public String toString() {
		return "commentVO [bnum=" + bnum + ", writer=" + writer + ", content=" + content + ", wridate=" + wridate + "]";
	}

}
