package dao;

import java.util.List;

import model.Vote;

public interface VoteDao {
	
	void add(Vote vote);
	
	void upvote(Vote vote);
	
	Vote search(int postid);
	
	List<Vote> vote();
}	
