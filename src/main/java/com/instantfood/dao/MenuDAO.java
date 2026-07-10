package com.instantfood.dao;

import java.util.List;
import com.instantfood.model.MenuCategory;
import com.instantfood.model.MenuItem;

public interface MenuDAO {

    List<MenuItem> getMenuByRestaurant(int restaurantId);

    MenuItem getMenuItemById(int itemId);

    List<MenuCategory> getCategoriesByRestaurant(int restaurantId);

    List<MenuItem> getItemsByCategory(int categoryId);
}