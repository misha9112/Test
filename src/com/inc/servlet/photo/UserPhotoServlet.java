package com.inc.servlet.photo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inc.dao.PhotoDao;
import com.inc.vo.PhotoVo;

@WebServlet("/photo/photo")
public class UserPhotoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<PhotoVo> photoList = PhotoDao.getInstance().selectList();
		request.setAttribute("photoList", photoList);
		request.getRequestDispatcher("/views/photo/photo.jsp").forward(request, response);
	}
}