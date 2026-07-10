package com.instantfood.controller;

import java.io.IOException;
import java.util.List;
import com.instantfood.dao.OrderDAO;
import com.instantfood.daoimpl.OrderDAOImpl;
import com.instantfood.model.Order;
import com.instantfood.model.OrderItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderconfirmation")
public class OrderConfirmationServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() { orderDAO = new OrderDAOImpl(); }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null ||
                session.getAttribute("loggedUser") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login");
            return;
        }

        int orderId = Integer.parseInt(
                request.getParameter("id"));

        Order order = orderDAO.getOrderById(orderId);
        List<OrderItem> orderItems =
                orderDAO.getOrderItems(orderId);

        request.setAttribute("order", order);
        request.setAttribute("orderItems", orderItems);

        request.getRequestDispatcher(
                "/WEB-INF/views/thankyou.jsp")
                .forward(request, response);
    }
}