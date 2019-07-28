package com.alpaca.comment;

public class commentVO {
	private int cnum;
	private int bnum;
	private String writer;
	private String content;
	private String wridate;

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

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
		return "commentVO [cnum=" + cnum + ", bnum=" + bnum + ", writer=" + writer + ", content=" + content
				+ ", wridate=" + wridate + "]";
	}

}