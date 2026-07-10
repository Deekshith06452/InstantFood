package com.instantfood.controller;

import java.io.IOException;
import com.instantfood.dao.UserDAO;
import com.instantfood.daoimpl.UserDAOImpl;
import com.instantfood.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private UserDAO userDAO;

	@Override
	public void init() {
		userDAO = new UserDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = userDAO.loginUser(email, password);
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loggedUser", user);
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("userName", user.getFullName());
			session.setAttribute("userEmail", user.getEmail());
			session.setAttribute("userPhone", user.getPhone());
			session.setAttribute("userCity", user.getCity());
			response.sendRedirect(request.getContextPath() + "/home");
		} else {
			request.setAttribute("error", "Invalid email or password");
			request.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(request, response);
		}
	}
}