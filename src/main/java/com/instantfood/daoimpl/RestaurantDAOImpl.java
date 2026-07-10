package com.instantfood.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.instantfood.dao.RestaurantDAO;
import com.instantfood.model.Restaurant;
import com.instantfood.util.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	@Override
	public List<Restaurant> getAllRestaurants() {
		List<Restaurant> list = new ArrayList<>();
		String sql = "SELECT * FROM restaurants WHERE is_active = TRUE ORDER BY rating DESC";
		try (Connection con = DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				list.add(mapRestaurant(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Restaurant getRestaurantById(int restaurantId) {
		String sql = "SELECT * FROM restaurants WHERE restaurant_id = ?";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, restaurantId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return mapRestaurant(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Restaurant> searchRestaurants(String keyword) {
		List<Restaurant> list = new ArrayList<>();
		String sql = "SELECT * FROM restaurants WHERE is_active = TRUE AND (name LIKE ? OR cuisine_type LIKE ?) ORDER BY rating DESC";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			String search = "%" + keyword + "%";
			ps.setString(1, search);
			ps.setString(2, search);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapRestaurant(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Restaurant> getRestaurantsByCuisine(String cuisineType) {
		List<Restaurant> list = new ArrayList<>();
		String sql = "SELECT * FROM restaurants WHERE is_active = TRUE AND cuisine_type = ? ORDER BY rating DESC";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, cuisineType);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapRestaurant(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Restaurant> getRestaurantsByCategory(String category) {
		List<Restaurant> list = new ArrayList<>();
		String sql = "SELECT DISTINCT r.* FROM restaurants r "
				+ "JOIN menu_categories mc ON r.restaurant_id = mc.restaurant_id "
				+ "WHERE r.is_active = TRUE AND mc.category_name = ? " + "ORDER BY r.rating DESC";
		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapRestaurant(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private Restaurant mapRestaurant(ResultSet rs) throws Exception {
		Restaurant r = new Restaurant();
		r.setRestaurantId(rs.getInt("restaurant_id"));
		r.setName(rs.getString("name"));
		r.setDescription(rs.getString("description"));
		r.setCuisineType(rs.getString("cuisine_type"));
		r.setAddress(rs.getString("address"));
		r.setCity(rs.getString("city"));
		r.setImageUrl(rs.getString("image_url"));
		r.setRating(rs.getDouble("rating"));
		r.setDeliveryTime(rs.getInt("delivery_time"));
		r.setMinOrder(rs.getBigDecimal("min_order"));
		r.setActive(rs.getBoolean("is_active"));
		r.setCreatedAt(rs.getTimestamp("created_at"));
		return r;
	}
}