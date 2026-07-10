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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private UserDAO userDAO;

	@Override
	public void init() {
		userDAO = new UserDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		if (userDAO.isEmailExists(email)) {
			request.setAttribute("error", "Email already registered");
			request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
			return;
		}
		User user = new User();
		user.setFullName(request.getParameter("fullName"));
		user.setEmail(email);
		user.setPhone(request.getParameter("phone"));
		user.setPassword(request.getParameter("password"));
		user.setAddress(request.getParameter("address"));
		user.setCity(request.getParameter("city"));
		boolean success = userDAO.registerUser(user);
		if (success) {
			response.sendRedirect(request.getContextPath() + "/login");
		} else {
			request.setAttribute("error", "Registration failed. Try again.");
			request.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(request, response);
		}
	}
}