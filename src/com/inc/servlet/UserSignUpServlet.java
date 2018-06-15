package com.inc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.UserDao;
import com.inc.encrypt.SHA256Encryptor;
import com.inc.util.Verifier;
import com.inc.vo.UserVo;

@WebServlet("/user/signup")
public class UserSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/user/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		String password = request.getParameter("password");
		password = SHA256Encryptor.shaEncrypt(password);
		
		String name = request.getParameter("name");
		String phoneNum = request.getParameter("phoneNum");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		

		UserVo uvo = new UserVo(id, password, name, phoneNum, addr, email);

		UserDao.getInstance().signup(uvo);
		request.setAttribute("msg", "회원가입이 정상적으로 완료되었습니다. 메인페이지로 이동합니다.");
		request.setAttribute("url", "/main");
		request.getRequestDispatcher("/views/alert.jsp").forward(request, response);

	}
}