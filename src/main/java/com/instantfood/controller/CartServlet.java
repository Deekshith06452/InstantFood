package com.instantfood.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import com.instantfood.dao.CartDAO;
import com.instantfood.daoimpl.CartDAOImpl;
import com.instantfood.model.CartItem;
import com.instantfood.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	private CartDAO cartDAO;

	@Override
	public void init() {
		cartDAO = new CartDAOImpl();
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
		List<CartItem> cartItems = cartDAO.getCartItems(user.getUserId());
		BigDecimal total = BigDecimal.ZERO;
		for (CartItem item : cartItems) {
			total = total.add(item.getTotalPrice());
		}
		request.setAttribute("cartItems", cartItems);
		request.setAttribute("total", total);
		request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
		if ("remove".equals(action)) {
			cartDAO.removeFromCart(cartItemId);
		} else if ("update".equals(action)) {
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			cartDAO.updateQuantity(cartItemId, quantity);
		}
		response.sendRedirect(request.getContextPath() + "/cart");
	}
}