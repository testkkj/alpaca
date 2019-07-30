package com.alpaca.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.alpaca.common.JDBCUtil;

public class commentDAO {
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

	public void cOrder() {
		System.out.println("jdbc�� cOder() ��� ó��");
		String sql = "update comment set corder = corder+1";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			System.out.println("cOder() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int getCOder(int num) {
		System.out.println("jdbc�� rCOrder() ��� ó��");
		String sql = "select corder from comment where cnum=?";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			System.out.println("rCOrder() try�� ����");
			if(rs.next()) {
			return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("rCOrder() �ƹ��͵� ������� ����");
		return -1;

	}

	public void commentInsert(int bnum, String writer, String content) {
		System.out.println("jdbc�� commentInsert() ��� ó��");
		String sql = "insert into comment(bnum, corder, writer, content, wridate) values (?,?,?,?,?)";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, bnum);
			stmt.setInt(2, 0);
			stmt.setString(3, writer);
			stmt.setString(4, content);
			stmt.setString(5, getDate());
			stmt.executeUpdate();
			System.out.println("commentInsert() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("commentInsert() finally�� ����");
		}

	}
	
	public void reCommentInsert(int bnum, int cnum, String writer, String content) {
		System.out.println("jdbc�� commentInsert() ��� ó��");
		String sql = "insert into comment(bnum, corder, writer, content, wridate) values (?,?,?,?,?)";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, bnum);
			stmt.setInt(2, cnum);
			stmt.setString(3, writer);
			stmt.setString(4, content);
			stmt.setString(5, getDate());
			stmt.executeUpdate();
			System.out.println("commentInsert() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("commentInsert() finally�� ����");
		}

	}

	public void commentUpdate(int num, int cnum, String content) {
		System.out.println("jdbc�� commentUpdate() ��� ó��");
		String sql = "update comment set content=? where bnum=? and cnum=?";
		commentVO vo = new commentVO();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, content);
			stmt.setInt(2, num);
			stmt.setInt(3, cnum);
			stmt.executeUpdate();
			System.out.println("commentUpdate() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("commentUpdate() finally�� ����");
		}

	}

	public void commentDelete(int num, int cnum) {
		System.out.println("jdbc�� commentDelete() ��� ó��");
		String sql = "delete from comment where bnum=? and cnum=?";
		commentVO vo = new commentVO();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.setInt(2, cnum);
			stmt.executeUpdate();
			System.out.println("commentDelete() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public ArrayList<commentVO> commentList(int num) {
		System.out.println("jdbc�� commentList() ��� ó��");
		String sql = "select cnum, writer, content, wridate from comment where bnum=? order by corder";
		ArrayList<commentVO> al = new ArrayList<commentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			while (rs.next()) {
				commentVO vo = new commentVO();
				vo.setCnum(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setWridate(rs.getString(4));
				al.add(vo);
			}
			System.out.println("commentList() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;

	}

	public ArrayList<commentVO> commentView(int num, int cnum) {
		System.out.println("jdbc�� commentView() ��� ó��");
		String sql = "select content from comment where bnum = ? and cnum = ?";
		ArrayList<commentVO> al = new ArrayList<commentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.setInt(2, cnum);
			rs = stmt.executeQuery();
			if (rs.next()) {
				commentVO vo = new commentVO();
				vo.setContent(rs.getString(1));
				al.add(vo);
			}
			System.out.println("commentView() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;

	}

}