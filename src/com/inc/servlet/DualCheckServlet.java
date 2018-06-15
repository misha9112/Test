package com.inc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;

@WebServlet("/user/dualCheck")
public class DualCheckServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		String searchedId = UserDao.getInstance().getIdCount(id);
		if (searchedId == null) {
			response.getWriter().print("n");
		} else {
			response.getWriter().print("y");
		}

	}

}
