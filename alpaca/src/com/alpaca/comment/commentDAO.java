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

	public int getNext() {
		String SQL = "select bnum from comment order by bnum desc";

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

	public void commentInsert(int bnum, String writer, String content) {
		System.out.println("jdbc�� commentInsert() ��� ó��");
		String sql = "insert into comment(bnum, writer, content, wridate) values (?,?,?,?)";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, bnum);
			stmt.setString(2, writer);
			stmt.setString(3, content);
			stmt.setString(4, getDate());
			stmt.executeUpdate();
			System.out.println("commentInsert() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("commentInsert() finally�� ����");
		}

	}
	
	public void commentUpdate(int num, String title, String writer, String content) {
		System.out.println("jdbc�� commentUpdate() ��� ó��");
		String sql = "update board set title=?, writer=?, content=?, count=?, wridate=? where bnum=?";
		commentVO vo = new commentVO();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, title);
			stmt.setString(2, writer);
			stmt.setString(3, content);
			stmt.setInt(4, 1);
			stmt.setString(5, getDate());
			stmt.setInt(6, num);
			stmt.executeUpdate();
			System.out.println("commentUpdate() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("commentUpdate() finally�� ����");
		}

	}
	
	public void commentDelete(int num) {
		System.out.println("jdbc�� commentDelete() ��� ó��");
		String sql = "delete from board where bnum=?";
		commentVO vo = new commentVO();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();
			System.out.println("commentDelete() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("commentDelete() finally�� ����");
		}

	}

	public ArrayList<commentVO> commentList(int num) {
		System.out.println("jdbc�� commentList() ��� ó��");
		String sql = "select writer, content, wridate from comment where bnum=?";
		ArrayList<commentVO> al = new ArrayList<commentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			while (rs.next()) {
				commentVO vo = new commentVO();
				vo.setWriter(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setWridate(rs.getString(3));				
				al.add(vo);
			}
			System.out.println("commentList() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;

	}
	
	public boolean commentNextPage(int num) {
		String SQL = "select * from board where bnum < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (num - 1) * 5);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}
	
	public ArrayList<commentVO> commentView(int num) {
		System.out.println("jdbc�� commentView() ��� ó��");
		String sql = "select writer, content, wridate from comment where bnum = ?";
		ArrayList<commentVO> al = new ArrayList<commentVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			rs = stmt.executeQuery();
			if (rs.next()) {
				commentVO vo = new commentVO();
				vo.setWriter(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setWridate(rs.getString(3));
				al.add(vo);
			}
			System.out.println("commentView() try�� ����");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;

	}

}