package com.instantfood.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.instantfood.dao.CartDAO;
import com.instantfood.model.CartItem;
import com.instantfood.util.DBConnection;

public class CartDAOImpl implements CartDAO {

    @Override
    public int getOrCreateCart(int userId, int restaurantId) {

        String selectSql = "SELECT cart_id FROM cart WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(selectSql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("cart_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        String insertSql = "INSERT INTO cart (user_id, restaurant_id) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, userId);
            ps.setInt(2, restaurantId);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }

    @Override
    public void addToCart(int cartId, int itemId, int quantity) {

        if (isItemInCart(cartId, itemId)) {

            String sql = "UPDATE cart_items SET quantity = quantity + ? WHERE cart_id = ? AND item_id = ?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, quantity);
                ps.setInt(2, cartId);
                ps.setInt(3, itemId);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {

            String sql = "INSERT INTO cart_items (cart_id, item_id, quantity) VALUES (?, ?, ?)";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, cartId);
                ps.setInt(2, itemId);
                ps.setInt(3, quantity);
                ps.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<CartItem> getCartItems(int userId) {

        List<CartItem> list = new ArrayList<>();

        String sql = "SELECT ci.cart_item_id, ci.cart_id, ci.item_id, ci.quantity, mi.item_name, mi.price, mi.image_url, mi.is_veg, r.name as restaurant_name FROM cart_items ci JOIN cart c ON ci.cart_id = c.cart_id JOIN menu_items mi ON ci.item_id = mi.item_id JOIN restaurants r ON mi.restaurant_id = r.restaurant_id WHERE c.user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                CartItem item = new CartItem();
                item.setCartItemId(rs.getInt("cart_item_id"));
                item.setCartId(rs.getInt("cart_id"));
                item.setItemId(rs.getInt("item_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setItemName(rs.getString("item_name"));
                item.setPrice(rs.getBigDecimal("price"));
                item.setImageUrl(rs.getString("image_url"));
                item.setVeg(rs.getBoolean("is_veg"));
                item.setRestaurantName(rs.getString("restaurant_name"));

                list.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void updateQuantity(int cartItemId, int quantity) {

        String sql = "UPDATE cart_items SET quantity = ? WHERE cart_item_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quantity);
            ps.setInt(2, cartItemId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void removeFromCart(int cartItemId) {

        String sql = "DELETE FROM cart_items WHERE cart_item_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartItemId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void clearCart(int cartId) {

        String sql = "DELETE FROM cart_items WHERE cart_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean isItemInCart(int cartId, int itemId) {

        String sql = "SELECT cart_item_id FROM cart_items WHERE cart_id = ? AND item_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, cartId);
            ps.setInt(2, itemId);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public int getCartRestaurantId(int userId) {

        String sql = "SELECT restaurant_id FROM cart WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("restaurant_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return -1;
    }
    
    @Override
    public void updateCartRestaurant(int userId, int restaurantId) {

        String sql = "UPDATE cart SET restaurant_id = ? WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, restaurantId);
            ps.setInt(2, userId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void clearCartByUserId(int userId) {

        String selectSql = "SELECT cart_id FROM cart WHERE user_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(selectSql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int cartId = rs.getInt("cart_id");
                clearCart(cartId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}