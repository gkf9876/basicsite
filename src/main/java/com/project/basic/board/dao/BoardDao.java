package com.project.basic.board.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.basic.board.domain.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	public void insert(Board board) throws ClassNotFoundException, SQLException, IOException{
		SqlSession session = sqlSessionFactory.openSession();
		
		session.insert("com.project.basic.board.BoardMapper.insert", board);
		session.commit();
		session.close();
	}
	
	public Board selectOne(Board board) throws ClassNotFoundException, SQLException, IOException{
		SqlSession session = sqlSessionFactory.openSession();
		
		Board result = session.selectOne("com.project.basic.board.BoardMapper.select", board);
		session.close();
		
		return result;
	}
	
	public List<Board> selectList(Board board) throws ClassNotFoundException, SQLException, IOException{
		SqlSession session = sqlSessionFactory.openSession();
		
		List<Board> result = session.selectList("com.project.basic.board.BoardMapper.selectList", board);
		session.close();
		
		return result;
	}
	
	public void deleteAll() throws SQLException, IOException {
		SqlSession session = sqlSessionFactory.openSession();
		
		session.delete("com.project.basic.board.BoardMapper.deleteAll");
		session.commit();
		session.close();
	}
}
