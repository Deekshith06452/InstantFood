package com.instantfood.controller;

import java.io.IOException;
import java.util.List;
import com.instantfood.dao.RestaurantDAO;
import com.instantfood.daoimpl.RestaurantDAOImpl;
import com.instantfood.model.Restaurant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private RestaurantDAO restaurantDAO;

	@Override
	public void init() {
		restaurantDAO = new RestaurantDAOImpl();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String cuisine = request.getParameter("cuisine");
		String category = request.getParameter("category");

		List<Restaurant> restaurants;

		if (cuisine != null && !cuisine.isEmpty()) {
			restaurants = restaurantDAO.getRestaurantsByCuisine(cuisine);
			request.setAttribute("selectedCuisine", cuisine);
		} else if (category != null && !category.isEmpty()) {
			restaurants = restaurantDAO.getRestaurantsByCategory(category);
			request.setAttribute("selectedCategory", category);
		} else {
			restaurants = restaurantDAO.getAllRestaurants();
		}

		request.setAttribute("restaurants", restaurants);
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}
}