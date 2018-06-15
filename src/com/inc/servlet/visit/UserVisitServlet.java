package com.inc.servlet.visit;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.VisitDao;
import com.inc.vo.VisitVo;

@WebServlet("/visit/visit")
public class UserVisitServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<VisitVo> visitList = VisitDao.getInstance().selectList();
		request.setAttribute("visitList", visitList);
		request.getRequestDispatcher("/views/visit/visit.jsp").forward(request, response);
	}
}