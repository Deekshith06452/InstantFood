package com.instantfood.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.instantfood.dao.UserDAO;
import com.instantfood.model.User;
import com.instantfood.util.DBConnection;

public class UserDAOImpl implements UserDAO {

	@Override
	public boolean registerUser(User user) {

		String sql = "INSERT INTO users (full_name, email, phone, password, address, city) VALUES (?,?,?,?,?,?)";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getCity());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public User loginUser(String email, String password) {

		String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return mapUser(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public boolean isEmailExists(String email) {

		String sql = "SELECT email FROM users WHERE email = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public User getUserById(int userId) {

		String sql = "SELECT * FROM users WHERE user_id = ?";

		try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {

			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return mapUser(rs);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	private User mapUser(ResultSet rs) throws Exception {

		User user = new User();
		user.setUserId(rs.getInt("user_id"));
		user.setFullName(rs.getString("full_name"));
		user.setEmail(rs.getString("email"));
		user.setPhone(rs.getString("phone"));
		user.setPassword(rs.getString("password"));
		user.setAddress(rs.getString("address"));
		user.setCity(rs.getString("city"));
		user.setRole(rs.getString("role"));
		user.setCreatedAt(rs.getTimestamp("created_at"));

		return user;
	}
}