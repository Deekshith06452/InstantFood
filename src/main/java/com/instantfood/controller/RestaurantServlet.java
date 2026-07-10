package com.instantfood.controller;

import java.io.IOException;
import java.util.List;
import com.instantfood.dao.CartDAO;
import com.instantfood.dao.MenuDAO;
import com.instantfood.dao.RestaurantDAO;
import com.instantfood.daoimpl.CartDAOImpl;
import com.instantfood.daoimpl.MenuDAOImpl;
import com.instantfood.daoimpl.RestaurantDAOImpl;
import com.instantfood.model.MenuCategory;
import com.instantfood.model.MenuItem;
import com.instantfood.model.Restaurant;
import com.instantfood.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/restaurant")
public class RestaurantServlet extends HttpServlet {

	private RestaurantDAO restaurantDAO;
	private MenuDAO menuDAO;
	private CartDAO cartDAO;

	@Override
	public void init() {
		restaurantDAO = new RestaurantDAOImpl();
		menuDAO = new MenuDAOImpl();
		cartDAO = new CartDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int restaurantId = Integer.parseInt(request.getParameter("id"));
		Restaurant restaurant = restaurantDAO.getRestaurantById(restaurantId);
		List<MenuItem> menuItems = menuDAO.getMenuByRestaurant(restaurantId);
		List<MenuCategory> categories = menuDAO.getCategoriesByRestaurant(restaurantId);

		request.setAttribute("restaurant", restaurant);
		request.setAttribute("menuItems", menuItems);
		request.setAttribute("categories", categories);

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("loggedUser") != null) {
			User user = (User) session.getAttribute("loggedUser");
			int cartRestaurantId = cartDAO.getCartRestaurantId(user.getUserId());

			if (cartRestaurantId > 0 && cartRestaurantId != restaurantId) {
				Restaurant cartRestaurant = restaurantDAO.getRestaurantById(cartRestaurantId);
				if (cartRestaurant != null) {
					request.setAttribute("cartConflictName", cartRestaurant.getName());
				}
			}
		}

		request.getRequestDispatcher("/WEB-INF/views/restaurant.jsp").forward(request, response);
	}
}