package com.alpaca.file;

public class fileVO {
	private int fnum;
	private int bnum;
	private String orifile;
	private String chafile;

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getOrifile() {
		return orifile;
	}

	public void setOrifile(String orifile) {
		this.orifile = orifile;
	}

	public String getChafile() {
		return chafile;
	}

	public void setChafile(String chafile) {
		this.chafile = chafile;
	}

	@Override
	public String toString() {
		return "fileVO [fnum=" + fnum + ", bnum=" + bnum + ", orifile=" + orifile + ", chafile=" + chafile + "]";
	}

}
