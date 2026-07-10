package com.instantfood.dao;

import com.instantfood.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email, String password);

    boolean isEmailExists(String email);

    User getUserById(int userId);
}