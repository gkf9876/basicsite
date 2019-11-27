package com.project.basic.board.dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.basic.board.domain.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(Board board) throws ClassNotFoundException, SQLException, IOException{
		sqlSession.insert("com.project.basic.board.BoardMapper.insert", board);
	}
	
	public Board selectOne(Board board) throws ClassNotFoundException, SQLException, IOException{
		return sqlSession.selectOne("com.project.basic.board.BoardMapper.select", board);
	}
	
	public List<Board> selectList(Board board) throws ClassNotFoundException, SQLException, IOException{
		return sqlSession.selectList("com.project.basic.board.BoardMapper.selectList", board);
	}
	
	public void deleteAll() throws SQLException, IOException {
		sqlSession.delete("com.project.basic.board.BoardMapper.deleteAll");
	}
}
