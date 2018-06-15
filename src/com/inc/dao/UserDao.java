package com.inc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.inc.util.DbCloser;
import com.inc.util.DbConnector;
import com.inc.vo.UserVo;

public class UserDao {
	private static UserDao single;
	DbConnector connector = DbConnector.getInstance();

	private UserDao() {
	}

	public static UserDao getInstance() {
		if (single == null) {
			single = new UserDao();
		}
		return single;
	}

	public String getIdCount(String id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String searchedId = null;
		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select id from users where id = '" + id + "'");
			if (rs.next()) {
				searchedId = rs.getString("id");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, rs);
		}

		return searchedId;
	}

	public void signup(UserVo uvo) {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			String query = String.format("insert into users values('%s','%s','%s','%s','%s','%s')", uvo.getId(),
					uvo.getPassword(), uvo.getName(), uvo.getPhoneNum(), uvo.getAddr(), uvo.getEmail());
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, null);
		}
	}

	public UserVo selectOne(String id, String password) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		UserVo uvo = null;
		try {
			conn = connector.getConnection();
			stmt = conn.prepareStatement("select * from users where id = ? and password = ?");
			stmt.setString(1, id);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			if (rs.next()) {
				uvo = new UserVo();
				uvo.setId(rs.getString("id"));
				uvo.setPassword(rs.getString("password"));
				uvo.setName(rs.getString("name"));
			}
		} catch (

		SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, rs);
		}
		return uvo;
	}

}
