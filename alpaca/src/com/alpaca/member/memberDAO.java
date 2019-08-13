package com.alpaca.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

	public void memberInsert(String id, String password, String email, String tel) {
		System.out.println("jdbc로 memberInsert() 기능 처리");
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
			System.out.println("memberInsert() try문 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("memberInsert() finally문 실행");
		}

	}
	
	public void memberUpdate(String id, String password, String email, String tel) {
		System.out.println("jdbc로 memberUpdate() 기능 처리");
		String sql = "update member set password=?, email=?, tel=? where id=?";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, password);
			stmt.setString(2, email);
			stmt.setString(3, tel);
			stmt.setString(4, id);
			stmt.executeUpdate();
			System.out.println("memberUpdate() try문 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("memberUpdate() finally문 실행");
		}

	}
	
	public int login(String id, String password) {
		System.out.println("jdbc로 login() 기능 처리");
		String sql = "select id from member where id=? and password=?";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			if(rs.next()) {
				System.out.println("insert() try문 실행");
				return 1;
			}
			System.out.println("insert() try문 실행");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(stmt, conn);
			System.out.println("login() finally문 실행");
		}
		return 0;
	}
	
	public String idFind(String email) {
		System.out.println("jdbc로 idFind() 기능 처리");
		String sql = "select id from member where email=?";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if(rs.next()) {
				System.out.println("idFind() try문 실행");
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";		
	}
	
	public String pwFind(String email, String id) {
		System.out.println("jdbc로 pwFind() 기능 처리");
		String sql = "select password from member where email=? and id=?";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				System.out.println("pwFind() try문 실행");
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";		
	}
	
	public String checkPassword(String id) {
		System.out.println("jdbc로 checkPassword() 기능 처리");
		String sql = "select password from member where id=?";
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				System.out.println("checkPassword() try문 실행");
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";		
	}
	
	public ArrayList<memberVO> memberSerch(String id) {
		System.out.println("jdbc로 memberSerch() 기능 처리");
		String sql = "select id, email, tel from member where id=?";
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if(rs.next()) {
				System.out.println("memberSerch() try문 실행");
				memberVO vo = new memberVO();
				vo.setId(rs.getString(1));
				vo.setEmail(rs.getString(2));
				vo.setTel(rs.getString(3));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;		
	}
	
	public ArrayList<memberVO> memberList() {
		System.out.println("jdbc로 memberList() 기능 처리");
		String sql = "select id from member";
		ArrayList<memberVO> list = new ArrayList<memberVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				System.out.println("memberList() try문 실행");
				memberVO vo = new memberVO();
				vo.setId(rs.getString(1));
				list.add(vo);
				System.out.println(list);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}