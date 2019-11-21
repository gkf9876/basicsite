package com.project.basic.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.basic.board.dao.BoardDao;
import com.project.basic.board.domain.Board;

@Service
public class BoardService {
	@Autowired
	BoardDao boardDao;
	
	public void insert(Board board) throws ClassNotFoundException, SQLException {
		boardDao.add(board);
	}
	
	public void update(Board board) {
	}
	
	public Board selectOne(String name) throws ClassNotFoundException, SQLException {
		return boardDao.get(name);
	}
	
	public List<Board> selectList() throws ClassNotFoundException, SQLException{
		return boardDao.getAll();
	}
}
