package com.instantfood.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.instantfood.dao.MenuDAO;
import com.instantfood.model.MenuCategory;
import com.instantfood.model.MenuItem;
import com.instantfood.util.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    @Override
    public List<MenuItem> getMenuByRestaurant(int restaurantId) {

        List<MenuItem> list = new ArrayList<>();

        String sql = "SELECT * FROM menu_items WHERE restaurant_id = ? AND is_available = TRUE ORDER BY category_id";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapMenuItem(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public MenuItem getMenuItemById(int itemId) {

        String sql = "SELECT * FROM menu_items WHERE item_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, itemId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapMenuItem(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<MenuCategory> getCategoriesByRestaurant(int restaurantId) {

        List<MenuCategory> list = new ArrayList<>();

        String sql = "SELECT * FROM menu_categories WHERE restaurant_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                MenuCategory cat = new MenuCategory();
                cat.setCategoryId(rs.getInt("category_id"));
                cat.setRestaurantId(rs.getInt("restaurant_id"));
                cat.setCategoryName(rs.getString("category_name"));

                list.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<MenuItem> getItemsByCategory(int categoryId) {

        List<MenuItem> list = new ArrayList<>();

        String sql = "SELECT * FROM menu_items WHERE category_id = ? AND is_available = TRUE";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapMenuItem(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    private MenuItem mapMenuItem(ResultSet rs) throws Exception {

        MenuItem item = new MenuItem();
        item.setItemId(rs.getInt("item_id"));
        item.setRestaurantId(rs.getInt("restaurant_id"));
        item.setCategoryId(rs.getInt("category_id"));
        item.setItemName(rs.getString("item_name"));
        item.setDescription(rs.getString("description"));
        item.setPrice(rs.getBigDecimal("price"));
        item.setImageUrl(rs.getString("image_url"));
        item.setVeg(rs.getBoolean("is_veg"));
        item.setAvailable(rs.getBoolean("is_available"));
        item.setCreatedAt(rs.getTimestamp("created_at"));

        return item;
    }
}