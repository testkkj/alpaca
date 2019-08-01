package com.alpaca.board;

import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.junit.jupiter.api.Test;

import com.alpaca.common.JDBCUtil;
import com.mysql.jdbc.Connection;

class boardDAOTest {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	boardDAO dao = new boardDAO();

	@Test
	final void testGetDate() {
		String SQL = "select sysdate()";
		try {
			con = (Connection) JDBCUtil.getConnection();
			PreparedStatement ps = con.prepareStatement(SQL);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	final void testGetNext() {

	}

	@Test
	final void testGetView() throws SQLException {

	}

	@Test
	final void testBoardInsert() {

	}

	@Test
	final void testBoardUpdate() {

	}

	@Test
	final void testBoardDelete() {

	}

	@Test
	final void testBoardList() {

	}

	@Test
	final void testBoardNextPage() {

	}

	@Test
	final void testBoardView() {

	}

}
