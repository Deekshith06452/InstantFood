package com.instantfood.controller;

import java.io.IOException;
import java.util.List;
import com.instantfood.dao.OrderDAO;
import com.instantfood.daoimpl.OrderDAOImpl;
import com.instantfood.model.Order;
import com.instantfood.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {

	private OrderDAO orderDAO;

	@Override
	public void init() {
		orderDAO = new OrderDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("loggedUser") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		User user = (User) session.getAttribute("loggedUser");
		List<Order> orders = orderDAO.getOrdersByUserId(user.getUserId());
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/WEB-INF/views/orders.jsp").forward(request, response);
	}
}