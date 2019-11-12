package dao;

import java.util.List;

import model.New;

public interface NewDao {
		void addNew(New news);
		
		void delNew(int id);
		
		void updateNew(New news);
		
		List<New> search(String name);
		
		List<New> search(int categoryid);
		
		New getNewId(int id);
		New getId(int id);
		
		New getNewName(String name);
		
		List<New> limit(int offset);
}
