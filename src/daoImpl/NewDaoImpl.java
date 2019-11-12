package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import connection.JDBCconnect;
import dao.NewDao;
import model.Category;
import model.New;
import model.User;

public class NewDaoImpl extends JDBCconnect implements NewDao {

	@Override
	public void addNew(New news) {
		String sql="INSERT INTO news(name,description,image,date,categoryid,userid)" + "VALUE(?,?,?,?,?,?)";
		Connection con = super.getConnet();
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1,news.getName());
			preparedStatement.setString(2, news.getDescription());
			preparedStatement.setString(3, news.getImage());
			preparedStatement.setString(4, news.getDate());
			preparedStatement.setInt(5, news.getCategory().getId());
			preparedStatement.setInt(6, news.getUser().getId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("loi "+ e);
		}
		
	}

	@Override
	public void delNew(int id) {
		String sql = "DELETE FROM news WHERE id = ?";

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
	public void updateNew(New news) {
		String sql="UPDATE news set name=?,description=?,image=?,date=?,categoryid=?,userid=? WHERE id=?";
		Connection con = super.getConnet();
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1,news.getName());
			preparedStatement.setString(2, news.getDescription());
			preparedStatement.setString(3, news.getImage());
			preparedStatement.setString(4, news.getDate());
			preparedStatement.setInt(5, news.getCategory().getId());
			preparedStatement.setInt(6, news.getUser().getId());
			preparedStatement.setInt(7, news.getId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("loi "+ e);
		}
		
	}

	@Override
	public List<New> search(String name) {
		List<New> news = new ArrayList<>();

		String sql = "SELECT n.*, c.name as 'c_name',u.fullname FROM news n "
					+ "INNER JOIN category c ON n.categoryid = c.id " 
					+"INNER JOIN user u ON n.userid=u.id WHERE n.name LIKE ?";
		try {
			Connection conn = super.getConnet();
			PreparedStatement preparedStatement = conn.prepareStatement(sql);

			preparedStatement.setString(1, "%" + name + "%");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				New new1 = new New();
				new1.setId(resultSet.getInt("id"));
				new1.setName(resultSet.getString("name"));
				new1.setDescription(resultSet.getString("description"));
				new1.setImage(resultSet.getString("image"));
				new1.setDate(resultSet.getString("date"));
				
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("c_name"));
				new1.setCategory(category);
				
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFullname(resultSet.getString("fullname"));
				new1.setUser(user);

				news.add(new1);
			}
		} catch (Exception e) {
			System.out.println("Loi: " + e);
		}

		return news;
	}

	@Override
	public New getNewId(int id) {
		try {
			String sql = "SELECT n.*, c.name as 'c_name',u.fullname FROM news n "
					+ "INNER JOIN category c ON n.categoryid = c.id " 
					+"INNER JOIN user u ON n.userid=u.id WHERE n.id= ?";

			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);

			ResultSet resultSet = st.executeQuery();

			while (resultSet.next()) {
				New new1 = new New();
				new1.setId(resultSet.getInt("id"));
				new1.setName(resultSet.getString("name"));
				new1.setDescription(resultSet.getString("description").replaceAll("\\r?\\n", "<br>"));
				new1.setImage(resultSet.getString("image"));
				new1.setDate(resultSet.getString("date"));
				
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("c_name"));
				new1.setCategory(category);
				
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFullname(resultSet.getString("fullname"));
				new1.setUser(user);

				return new1;
			}
		} catch (Exception ex) {
			System.out.println("loi get " + ex);
		}
		return null;
	}

	@Override
	public New getNewName(String name) {
		try {
			String sql = "SELECT n.*, c.name as 'c_name',u.fullname FROM news n "
					+ "INNER JOIN category c ON n.categoryid = c.id " 
					+"INNER JOIN user u ON n.userid=u.id WHERE n.name  ?";

			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, name);

			ResultSet resultSet = st.executeQuery();

			while (resultSet.next()) {
				New new1 = new New();
				new1.setId(resultSet.getInt("id"));
				new1.setName(resultSet.getString("name"));
				new1.setDescription(resultSet.getString("description"));
				new1.setImage(resultSet.getString("image"));
				new1.setDate(resultSet.getString("date"));
				
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("c_name"));
				new1.setCategory(category);
				
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFullname(resultSet.getString("fullname"));
				new1.setUser(user);

				return new1;
			}
		} catch (Exception ex) {
			System.out.println("loi get " + ex);
		}
		return null;
	}

	@Override
	public List<New> search(int categoryid) {
		List<New> news = new ArrayList<>();
		try {
			String sql = "SELECT n.*, c.name as 'c_name',u.fullname FROM news n "
					+ "INNER JOIN category c ON n.categoryid = c.id " 
					+"INNER JOIN user u ON n.userid=u.id WHERE n.categoryid= ?";

			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, categoryid);

			ResultSet resultSet = st.executeQuery();

			while (resultSet.next()) {
				New new1 = new New();
				new1.setId(resultSet.getInt("id"));
				new1.setName(resultSet.getString("name"));
				new1.setDescription(resultSet.getString("description"));
				new1.setImage(resultSet.getString("image"));
				new1.setDate(resultSet.getString("date"));
				
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("c_name"));
				new1.setCategory(category);
				
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFullname(resultSet.getString("fullname"));
				new1.setUser(user);
				
				news.add(new1);
			}
		} catch (Exception ex) {
			System.out.println("loi get " + ex);
		}
		return news;
	}

	@Override
	public New getId(int id) {
		try {
			String sql = "SELECT n.*, c.name as 'c_name',u.fullname FROM news n "
					+ "INNER JOIN category c ON n.categoryid = c.id " 
					+"INNER JOIN user u ON n.userid=u.id WHERE n.id= ?";

			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);

			ResultSet resultSet = st.executeQuery();

			while (resultSet.next()) {
				New new1 = new New();
				new1.setId(resultSet.getInt("id"));
				new1.setName(resultSet.getString("name"));
				new1.setDescription(resultSet.getString("description"));
				new1.setImage(resultSet.getString("image"));
				new1.setDate(resultSet.getString("date"));
				
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("c_name"));
				new1.setCategory(category);
				
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFullname(resultSet.getString("fullname"));
				new1.setUser(user);

				return new1;
			}
		} catch (Exception ex) {
			System.out.println("loi get " + ex);
		}
		return null;
	}

	@Override
	public List<New> limit(int offset) {
		List<New> news = new ArrayList<>();
		try {
			String sql = "SELECT n.*, c.name as 'c_name',u.fullname FROM news n "
					+ "INNER JOIN category c ON n.categoryid = c.id " 
					+"INNER JOIN user u ON n.userid=u.id ORDER BY n.id DESC LIMIT ?,3 ";

			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, offset);

			ResultSet resultSet = st.executeQuery();

			while (resultSet.next()) {
				New new1 = new New();
				new1.setId(resultSet.getInt("id"));
				new1.setName(resultSet.getString("name"));
				new1.setDescription(resultSet.getString("description"));
				new1.setImage(resultSet.getString("image"));
				new1.setDate(resultSet.getString("date"));
				
				Category category = new Category();
				category.setId(resultSet.getInt("id"));
				category.setName(resultSet.getString("c_name"));
				new1.setCategory(category);
				
				User user = new User();
				user.setId(resultSet.getInt("id"));
				user.setFullname(resultSet.getString("fullname"));
				new1.setUser(user);
				
				news.add(new1);
			}
		} catch (Exception ex) {
			System.out.println("loi get " + ex);
		}
		return news;
	}		
}
