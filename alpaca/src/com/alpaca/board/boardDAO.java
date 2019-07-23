package com.alpaca.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alpaca.common.JDBCUtil;

public class boardDAO {
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

	public int getNext() {
		String SQL = "select bnum from board order by bnum desc";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void insert(String title, String writer, String content) {
		System.out.println("jdbc로 insert() 기능 처리");
		String sql = "insert into board(bnum, title, writer, content, count, wridate) values (?,?,?,?,?,?)";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, getNext());
			stmt.setString(2, title);
			stmt.setString(3, writer);
			stmt.setString(4, content);
			stmt.setInt(5, 1);
			stmt.setString(6, getDate());
			stmt.executeUpdate();
			System.out.println("insert() try문 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("insert() finally문 실행");
		}

	}

	public ArrayList<boardVO> list() {
		System.out.println("jdbc로 list() 기능 처리");
		String sql = "select bnum, title, writer, content, count, wridate from board";
		ArrayList<boardVO> al = new ArrayList<boardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				boardVO vo = new boardVO();
				vo.setBnum(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setWriter(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setCount(rs.getInt(5));
				vo.setDate(rs.getString(6));
				al.add(vo);
			}
			System.out.println("insert() try문 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("insert() finally문 실행");
		}
		return al;

	}
	
	public ArrayList<boardVO> view(int num) {
		System.out.println("jdbc로 view() 기능 처리");
		String sql = "select title, writer, content, wridate from board where bnum = ?";
		ArrayList<boardVO> al = new ArrayList<boardVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			if (rs.next()) {
				boardVO vo = new boardVO();
				vo.setTitle(rs.getString(1));
				vo.setWriter(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setDate(rs.getString(4));
				al.add(vo);
			}
			System.out.println("view() try문 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("view() finally문 실행");
		}
		return al;

	}

}