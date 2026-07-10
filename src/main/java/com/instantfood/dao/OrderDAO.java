package com.instantfood.dao;

import java.util.List;
import com.instantfood.model.Order;
import com.instantfood.model.OrderItem;

public interface OrderDAO {

    int placeOrder(Order order);

    void addOrderItem(OrderItem item);

    List<Order> getOrdersByUserId(int userId);

    Order getOrderById(int orderId);

    List<OrderItem> getOrderItems(int orderId);

    List<Order> getAllOrders();

    void updateOrderStatus(int orderId, String status);
}