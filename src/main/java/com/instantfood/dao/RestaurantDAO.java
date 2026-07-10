package com.instantfood.dao;

import java.util.List;
import com.instantfood.model.Restaurant;

public interface RestaurantDAO {
	List<Restaurant> getAllRestaurants();

	Restaurant getRestaurantById(int restaurantId);

	List<Restaurant> searchRestaurants(String keyword);

	List<Restaurant> getRestaurantsByCuisine(String cuisineType);

	List<Restaurant> getRestaurantsByCategory(String category);
}