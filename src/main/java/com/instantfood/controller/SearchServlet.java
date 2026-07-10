package com.instantfood.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import com.instantfood.dao.RestaurantDAO;
import com.instantfood.daoimpl.RestaurantDAOImpl;
import com.instantfood.model.Restaurant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() {
        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("q");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        if (keyword == null || keyword.trim().isEmpty()) {
            out.print("[]");
            out.flush();
            return;
        }

        List<Restaurant> results = restaurantDAO.searchRestaurants(keyword.trim());

        StringBuilder json = new StringBuilder();
        json.append("[");
        for (int i = 0; i < results.size(); i++) {
            Restaurant r = results.get(i);
            if (i > 0) json.append(",");
            json.append("{");
            json.append("\"id\":").append(r.getRestaurantId()).append(",");
            json.append("\"name\":\"").append(escapeJson(r.getName())).append("\",");
            json.append("\"cuisine\":\"").append(escapeJson(r.getCuisineType())).append("\",");
            json.append("\"image\":\"").append(escapeJson(r.getImageUrl())).append("\"");
            json.append("}");
        }
        json.append("]");

        out.print(json.toString());
        out.flush();
    }

    private String escapeJson(String value) {
        if (value == null) return "";
        return value.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}