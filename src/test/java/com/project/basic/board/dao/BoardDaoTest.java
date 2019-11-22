package com.project.basic.board.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.io.IOException;
import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.basic.board.domain.Board;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/test-applicationContext.xml")
public class BoardDaoTest {
	
	@Autowired
	BoardDao boardDao;
	
	@Test
	public void addAndGet() throws ClassNotFoundException, SQLException, IOException {
		boardDao.deleteAll();
		
		Board board = new Board();
		board.setName("백기선");
		board.setContent("married");
	
		boardDao.insert(board);
		
		Board board2 = boardDao.selectOne(board);
		
		assertThat(board2.getName(), is("백기선"));
		assertThat(board2.getContent(), is("married"));
	}
}
