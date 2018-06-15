package com.inc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;
import com.inc.encrypt.SHA256Encryptor;
import com.inc.vo.UserVo;

@WebServlet("/user/login")
public class UserLogInServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		System.out.println(id);
		System.out.println(password);

		password = SHA256Encryptor.shaEncrypt(password);
		UserVo uvo = UserDao.getInstance().selectOne(id, password);

		if (uvo == null) {
			request.setAttribute("msg", "존재하지 않는 아이디 입니다.");
			request.setAttribute("url", request.getContextPath() + "/user/login");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		} else if (!((UserVo) uvo).getPassword().equals(password)) {
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			request.setAttribute("url", request.getContextPath() + "/user/login");
			request.getRequestDispatcher("/alert.jsp").forward(request, response);
		} else {
			// 로그인
			request.getSession().setAttribute("id", uvo.getId());
			request.getSession().setAttribute("name", uvo.getName());
			response.sendRedirect("/main");
		}
	}
}