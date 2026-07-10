package com.instantfood.dao;

import java.util.List;
import com.instantfood.model.CartItem;

public interface CartDAO {

	int getOrCreateCart(int userId, int restaurantId);

	void addToCart(int cartId, int itemId, int quantity);

	List<CartItem> getCartItems(int userId);

	void updateQuantity(int cartItemId, int quantity);

	void removeFromCart(int cartItemId);

	void clearCart(int cartId);

	boolean isItemInCart(int cartId, int itemId);

	int getCartRestaurantId(int userId);

	void clearCartByUserId(int userId);

	void updateCartRestaurant(int userId, int restaurantId);
}