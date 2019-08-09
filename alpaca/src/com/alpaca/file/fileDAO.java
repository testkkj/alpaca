package com.alpaca.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.alpaca.common.JDBCUtil;

public class fileDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public int getNext() {
		String SQL = "select bnum from board order by bnum desc";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String getFname(int num) {
		String sql = "select orifile from file where bnum=?";
		
		try {
			conn = JDBCUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int fileInsert(String ofn, String cfn) {
		String sql = "insert into file(bnum,orifile,chafile) values(?,?,?)";
		try {
		conn = JDBCUtil.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, getNext());
		pstmt.setString(2, ofn);
		pstmt.setString(3, cfn);
		pstmt.executeUpdate();
		return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; 
	}

}
