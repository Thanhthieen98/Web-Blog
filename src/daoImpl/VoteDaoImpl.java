package daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.JDBCconnect;
import dao.VoteDao;
import model.New;
import model.Vote;

public class VoteDaoImpl extends JDBCconnect implements VoteDao {

	@Override
	public void add(Vote vote) {
		String sql="INSERT INTO vote(id,vote,postid) " + " VALUE(?,?,?)";
		Connection con = super.getConnet();
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, vote.getId());
			preparedStatement.setInt(2, vote.getVote());
			preparedStatement.setInt(3, vote.getPost().getId());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("loi "+ e);
		}
		
	}

	@Override
	public void upvote(Vote vote) {
		String sql="UPDATE vote set vote=? WHERE id=? ";
		Connection con = super.getConnet();
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			
			statement.setInt(1, vote.getVote());
			statement.setInt(2, vote.getId());
				
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.println("loi"+e);
		}
		
	}

	@Override
	public Vote search(int postid) {
		String sql = "SELECT vote FROM vote WHERE id=? ";
		Connection con = super.getConnet();
		
		try {
			PreparedStatement statement = con.prepareStatement(sql);
			statement.setInt(1, postid);
			ResultSet resultSet = statement.executeQuery();
			if(resultSet.next()) {
			Vote vote = new Vote();
			vote.setVote(resultSet.getInt("vote"));
			return vote;
			}
		} catch (SQLException e) {
			System.out.println("loi "+ e);
		}
		return null;
	}

	@Override
	public List<Vote> vote() {
		List<Vote> votes = new ArrayList<>();
		
		String sql = "SELECT vote.id,n.name,vote FROM vote inner join news n on postid=n.id order by vote desc ";
		Connection con = super.getConnet();
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Vote vote = new Vote();
				vote.setId(resultSet.getInt("id"));
				vote.setVote(resultSet.getInt("vote"));
				
				New new1 = new New();
				new1.setName(resultSet.getString("name"));
				
				vote.setPost(new1);
				votes.add(vote);
			}
		} catch (SQLException e) {
			System.out.println("loi "+e);
		}
		return votes;
	}

}
