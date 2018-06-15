package com.inc.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.inc.util.DbCloser;
import com.inc.util.DbConnector;
import com.inc.vo.PhotoVo;

public class PhotoDao {

	private static PhotoDao single;

	public PhotoDao() {
	}

	public static PhotoDao getInstance() {
		if (single == null) {
			single = new PhotoDao();
		}
		return single;
	}

	public ArrayList<PhotoVo> selectList() {
		ArrayList<PhotoVo> photoList = new ArrayList<>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from photo order by id desc");
			while (rs.next()) {
				PhotoVo pvo = new PhotoVo(rs.getInt("id"), rs.getString("u_id"), rs.getString("content"),
						rs.getString("uri"), rs.getString("regdate").substring(0, 10));
				photoList.add(pvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, rs);
		}

		return photoList;
	}

	public void insert(PhotoVo pvo) {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			String query = String.format("insert into photo values(seq_photo_id.nextval, '%s', '%s', '%s', sysdate)",
					pvo.getU_id(), pvo.getContent(), pvo.getUri());
			stmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, null);
		}
	}

	public String getPassword(int id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String password = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select password from photo where id = " + id);
			rs.next();
			password = rs.getString("password");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, rs);
		}

		return password;
	}

	public void delete(int id) {
		Connection conn = null;
		Statement stmt = null;

		try {
			conn = DbConnector.getInstance().getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate("delete from photo where id=" + id);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DbCloser.close(conn, stmt, null);
		}
	}
}
