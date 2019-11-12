package dao;

import java.util.List;

import model.Category;


public interface CateDao {
	void add(Category category);
	
	void xoa(int id);

	List<Category> search(String name);

	void sua(Category category);
	
	Category getId(int id);
	
	Category getByName(String name);
	
}
