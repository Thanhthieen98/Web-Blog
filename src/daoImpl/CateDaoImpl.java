package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import connection.JDBCconnect;
import dao.CateDao;
import model.Category;

public class CateDaoImpl extends JDBCconnect implements CateDao {

	@Override
	public void add(Category category) {
		try {
			String sql = "insert into category(name) values(?)";
			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, category.getName());
			st.executeUpdate();
		} catch (Exception ex) {
			System.out.println("loi them moi" + ex);
		}
	}

	@Override
	public void xoa(int id) {
		try {
			String sql = "delete from category where  id =?";
			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);
			st.executeUpdate();
		} catch (Exception ex) {
			System.out.println("loi them moi" + ex);
		}
	}

	@Override
	public List<Category> search(String name) {
		List<Category> list = new ArrayList<>();
		try {
			String sql = "select * from category where name like  ? ";

			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);

			st.setString(1, "%" + name + "%");

			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));

				list.add(c);
			}
		} catch (Exception ex) {
			System.out.println("loi search moi" + ex);
		}

		return list;
	}

	@Override
	public void sua(Category category) {
		try {
			String sql = "update category name = ? where id = ?";
			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, category.getName());
			st.setInt(2, category.getId());

			st.executeUpdate();
		} catch (Exception ex) {
			System.out.println("loi update moi" + ex);
		}
	}

	@Override
	public Category getId(int id) {
		try {
			String sql = "select * from category where id = ? ";
			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				return c;
			}
		} catch (Exception ex) {
			System.out.println("loi getId " + ex);
		}
		return null;
	}

	@Override
	public Category getByName(String name) {
		try {
			String sql = "select * from category where name = ? ";
			Connection conn = super.getConnet();
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, name);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				return c;
			}
		} catch (Exception ex) {
			System.out.println("loi getId " + ex);
		}
		return null;
	}
	

}
