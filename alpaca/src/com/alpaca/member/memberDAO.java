package com.alpaca.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.alpaca.common.JDBCUtil;

public class memberDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private String memberInsert = "insert into member(id, password, email, tel, date) values(?,?,?,?,?)";
	private String memberUpdateP = "update member set password=? where email=?";
	private String memberUpdateE = "update member set email=? where password=?";
	private String memberDelete = "delete member where password=?";

	public void insertMember(memberVO vo) {
		System.out.println("jdbc로 memberInsert() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(memberInsert);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassWord());
			stmt.setString(3, vo.getEmail());
			stmt.setString(4, vo.getTel());
			stmt.setDate(5, vo.getDate());
			stmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}

	}

	public void updateMemberP(memberVO vo) {
		System.out.println("jdbc로 memberUpdateP() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(memberUpdateP);
			stmt.setString(1, vo.getPassWord());
			stmt.setString(2, vo.getEmail());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}

	}

	public void updateMemberE(memberVO vo) {
		System.out.println("jdbc로 memberUpdateE() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(memberUpdateE);
			stmt.setString(1, vo.getEmail());
			stmt.setString(2, vo.getPassWord());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}

	}

	public void deleteMember(memberVO vo) {
		System.out.println("jdbc로 memberDelete() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(memberDelete);
			stmt.setString(1, vo.getPassWord());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}

	}

}
