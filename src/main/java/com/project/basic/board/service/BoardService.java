package com.project.basic.board.service;

import java.io.IOException;
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
	
	public void insert(Board board) throws ClassNotFoundException, SQLException, IOException {
		boardDao.insert(board);
	}
	
	public void update(Board board) {
	}
	
	public Board selectOne(Board board) throws ClassNotFoundException, SQLException, IOException {
		return boardDao.selectOne(board);
	}
	
	public List<Board> selectList(Board board) throws ClassNotFoundException, SQLException, IOException{
		return boardDao.selectList(board);
	}
}
