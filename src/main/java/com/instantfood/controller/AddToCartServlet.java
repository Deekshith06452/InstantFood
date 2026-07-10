package com.instantfood.controller;

import java.io.IOException;
import com.instantfood.dao.CartDAO;
import com.instantfood.daoimpl.CartDAOImpl;
import com.instantfood.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {

    private CartDAO cartDAO;

    @Override
    public void init() { cartDAO = new CartDAOImpl(); }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("loggedUser");
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        int existingRestaurantId = cartDAO.getCartRestaurantId(user.getUserId());

        if (existingRestaurantId > 0 && existingRestaurantId != restaurantId) {
            cartDAO.clearCartByUserId(user.getUserId());
            cartDAO.updateCartRestaurant(user.getUserId(), restaurantId);
        }

        int cartId = cartDAO.getOrCreateCart(user.getUserId(), restaurantId);
        cartDAO.addToCart(cartId, itemId, 1);

        session.setAttribute("cartSuccess", "Item added to cart!");
        response.sendRedirect(request.getContextPath() + "/restaurant?id=" + restaurantId);
    }
}