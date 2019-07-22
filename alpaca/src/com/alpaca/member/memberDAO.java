package com.alpaca.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.alpaca.common.JDBCUtil;

public class memberDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public void insert(String id, String password, String email, String tel) {
		System.out.println("jdbc로 insert() 기능 처리");
		String sql = "insert into member(id, password, email, tel, regdate) values (?,?,?,?,?)";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			stmt.setString(3, email);
			stmt.setString(4, tel);
			stmt.setString(5, getDate());
			stmt.executeUpdate();
			System.out.println("insert() try문 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("insert() finally문 실행");
		}

	}
}