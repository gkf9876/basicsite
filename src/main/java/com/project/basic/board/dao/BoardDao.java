package com.project.basic.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.basic.board.domain.Board;

@Repository
public class BoardDao {
	@Autowired
	private DataSource dataSource;
	
	public void add(Board board) throws ClassNotFoundException, SQLException{
		Connection c = dataSource.getConnection();
		
		PreparedStatement ps = c.prepareStatement("insert into board(name, content) values(?, ?)");
		ps.setString(1, board.getName());
		ps.setString(2, board.getContent());
		
		ps.executeUpdate();
		
		ps.close();
		c.close();
	}
	
	public Board get(String name) throws ClassNotFoundException, SQLException{
		Connection c = dataSource.getConnection();
		
		PreparedStatement ps = c.prepareStatement("select * from board where name = ?");
		ps.setString(1, name);
		
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		Board board = new Board();
		board.setIndex(rs.getInt("index"));
		board.setName(rs.getString("name"));
		board.setContent(rs.getString("content"));
		
		rs.close();
		ps.close();
		c.close();
		
		return board;
	}
	
	public List<Board> getAll() throws ClassNotFoundException, SQLException{
		Connection c = dataSource.getConnection();
		
		PreparedStatement ps = c.prepareStatement("select * from board");
		
		ResultSet rs = ps.executeQuery();
		List<Board> result = new ArrayList<Board>();
		
		while(rs.next()) {
			Board board = new Board();
			board.setIndex(rs.getInt("index"));
			board.setName(rs.getString("name"));
			board.setContent(rs.getString("content"));
			result.add(board);
		}
		
		rs.close();
		ps.close();
		c.close();
		
		return result;
	}
	
	public void deleteAll() throws SQLException {
		Connection c = dataSource.getConnection();
		
		PreparedStatement ps = c.prepareStatement("delete from board");
		ps.executeUpdate();
		
		ps.close();
		c.close();
	}
}
