package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.JDBCconnect;
import dao.UserDao;
import model.User;

public class UserDaoImpl extends JDBCconnect implements UserDao {

	@Override
	public void sua(User user) {
		String sql = "UPDATE user SET username=?,password=?,fullname=? WHERE id=? ";
		try {
			Connection conn = super.getConnet();
			PreparedStatement preparedStatement = conn.prepareStatement(sql);

			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getFullname());
			preparedStatement.setInt(4, user.getId());


			preparedStatement.executeUpdate();

		} catch (Exception e) {
			System.out.println("Loi: " + e);
		}
	}

	@Override
	public User getId(int id) {
		String sql = "SELECT * FROM user WHERE id = ?";

		try {
			Connection conn = super.getConnet();

			PreparedStatement preparedStatement = conn.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				User user = new User();

				user.setId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setFullname(resultSet.getString("fullname"));
				user.setImage(resultSet.getString("image"));
				user.setAddress(resultSet.getString("address"));
				user.setInfomation(resultSet.getString("infomation"));
				user.setPhone(resultSet.getString("phone"));
				user.setMail(resultSet.getString("mail"));
				return user;
			}

		} catch (Exception e) {
			System.out.println("Loi: " + e);
		}

		return null;
	}

	@Override
	public void add(User user) {
		String sql = "INSERT INTO user(username,password,fullname) "
				+ "VALUES (?, ?, ?);";
		try {
			Connection conn = super.getConnet();
			PreparedStatement preparedStatement = conn.prepareStatement(sql);

			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getFullname());


			preparedStatement.executeUpdate();

		} catch (Exception e) {
			System.out.println("Loi: " + e);
		}
		
	}

	@Override
	public void xoa(int id) {
		String sql = "DELETE FROM user WHERE id = ?";

		try {
			Connection conn = super.getConnet();
			PreparedStatement preparedStatement = conn.prepareStatement(sql);

			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();

		} catch (Exception e) {
			System.out.println("Loi: " + e);
		}
		
	}

	@Override
	public User getByUsername(String username) {
		String sql = "SELECT * FROM user WHERE username = ?";

		try {
			Connection conn = super.getConnet();

			PreparedStatement preparedStatement = conn.prepareStatement(sql);

			preparedStatement.setString(1, username);;

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				User user = new User();

				user.setId(resultSet.getInt("id"));
				user.setUsername(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setFullname(resultSet.getString("fullname"));
				
				return user;
			}

		} catch (Exception e) {
			System.out.println("Loi: " + e);
		}

		return null;
	}

}
