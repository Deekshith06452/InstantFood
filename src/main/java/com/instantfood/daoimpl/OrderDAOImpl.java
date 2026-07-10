package com.instantfood.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.instantfood.dao.OrderDAO;
import com.instantfood.model.Order;
import com.instantfood.model.OrderItem;
import com.instantfood.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    @Override
    public int placeOrder(Order order) {

        String sql = "INSERT INTO orders (user_id, restaurant_id, total_amount, order_status, delivery_name, delivery_phone, delivery_address, delivery_city) VALUES (?,?,?,?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setBigDecimal(3, order.getTotalAmount());
            ps.setString(4, "PLACED");
            ps.setString(5, order.getDeliveryName());
            ps.setString(6, order.getDeliveryPhone());
            ps.setString(7, order.getDeliveryAddress());
            ps.setString(8, order.getDeliveryCity());

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
    public void addOrderItem(OrderItem item) {

        String sql = "INSERT INTO order_items (order_id, item_id, quantity, price) VALUES (?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getItemId());
            ps.setInt(3, item.getQuantity());
            ps.setBigDecimal(4, item.getPrice());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> list = new ArrayList<>();

        String sql = "SELECT o.*, r.name as restaurant_name FROM orders o JOIN restaurants r ON o.restaurant_id = r.restaurant_id WHERE o.user_id = ? ORDER BY o.order_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public Order getOrderById(int orderId) {

        String sql = "SELECT o.*, r.name as restaurant_name FROM orders o JOIN restaurants r ON o.restaurant_id = r.restaurant_id WHERE o.order_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapOrder(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<OrderItem> getOrderItems(int orderId) {

        List<OrderItem> list = new ArrayList<>();

        String sql = "SELECT oi.order_item_id, oi.order_id, oi.item_id, oi.quantity, oi.price, mi.item_name, mi.image_url, mi.is_veg FROM order_items oi JOIN menu_items mi ON oi.item_id = mi.item_id WHERE oi.order_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                OrderItem item = new OrderItem();
                item.setOrderItemId(rs.getInt("order_item_id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setItemId(rs.getInt("item_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getBigDecimal("price"));
                item.setItemName(rs.getString("item_name"));
                item.setImageUrl(rs.getString("image_url"));
                item.setVeg(rs.getBoolean("is_veg"));

                list.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Order> getAllOrders() {

        List<Order> list = new ArrayList<>();

        String sql = "SELECT o.*, r.name as restaurant_name FROM orders o JOIN restaurants r ON o.restaurant_id = r.restaurant_id ORDER BY o.order_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapOrder(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void updateOrderStatus(int orderId, String status) {

        String sql = "UPDATE orders SET order_status = ? WHERE order_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, orderId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Order mapOrder(ResultSet rs) throws Exception {

        Order o = new Order();
        o.setOrderId(rs.getInt("order_id"));
        o.setUserId(rs.getInt("user_id"));
        o.setRestaurantId(rs.getInt("restaurant_id"));
        o.setTotalAmount(rs.getBigDecimal("total_amount"));
        o.setOrderStatus(rs.getString("order_status"));
        o.setDeliveryName(rs.getString("delivery_name"));
        o.setDeliveryPhone(rs.getString("delivery_phone"));
        o.setDeliveryAddress(rs.getString("delivery_address"));
        o.setDeliveryCity(rs.getString("delivery_city"));
        o.setOrderDate(rs.getTimestamp("order_date"));
        o.setRestaurantName(rs.getString("restaurant_name"));

        return o;
    }
}