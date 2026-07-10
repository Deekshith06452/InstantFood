package com.instantfood.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import com.instantfood.dao.CartDAO;
import com.instantfood.dao.OrderDAO;
import com.instantfood.daoimpl.CartDAOImpl;
import com.instantfood.daoimpl.OrderDAOImpl;
import com.instantfood.model.CartItem;
import com.instantfood.model.Order;
import com.instantfood.model.OrderItem;
import com.instantfood.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

	private CartDAO cartDAO;
	private OrderDAO orderDAO;

	@Override
	public void init() {
		cartDAO = new CartDAOImpl();
		orderDAO = new OrderDAOImpl();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("loggedUser") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}
		User user = (User) session.getAttribute("loggedUser");
		int userId = user.getUserId();
		List<CartItem> cartItems = cartDAO.getCartItems(userId);
		if (cartItems.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/cart");
			return;
		}
		BigDecimal total = BigDecimal.ZERO;
		for (CartItem item : cartItems) {
			total = total.add(item.getTotalPrice());
		}
		int restaurantId = cartDAO.getCartRestaurantId(userId);
		Order order = new Order();
		order.setUserId(userId);
		order.setRestaurantId(restaurantId);
		order.setTotalAmount(total);
		order.setDeliveryName(request.getParameter("deliveryName"));
		order.setDeliveryPhone(request.getParameter("deliveryPhone"));
		order.setDeliveryAddress(request.getParameter("deliveryAddress"));
		order.setDeliveryCity(request.getParameter("deliveryCity"));
		int orderId = orderDAO.placeOrder(order);
		for (CartItem item : cartItems) {
			OrderItem oi = new OrderItem();
			oi.setOrderId(orderId);
			oi.setItemId(item.getItemId());
			oi.setQuantity(item.getQuantity());
			oi.setPrice(item.getPrice());
			orderDAO.addOrderItem(oi);
		}
		cartDAO.clearCartByUserId(userId);
		response.sendRedirect(request.getContextPath() + "/orderconfirmation?id=" + orderId);
	}
}