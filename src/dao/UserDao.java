package dao;

import model.User;

public interface UserDao {
	void sua(User user);
	
	User getId(int id);
	
	void add(User user);
	
	void xoa(int id);
	
	User getByUsername(String username);
}
