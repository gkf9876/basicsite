package springbook.user.dao;

import java.sql.SQLException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import springbook.user.domain.Board;

public class BoardDaoTest {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		BoardDao dao = context.getBean("boardDao", BoardDao.class);
		
		Board board = new Board();
		board.setName("백기선");
		board.setContent("married");
		
		dao.add(board);
		
		System.out.println(board.getIndex() + " 등록 성공");
		
		Board board2 = dao.get(board.getName());
		System.out.println(board2.getName());
		System.out.println(board2.getContent());
		
		System.out.println(board2.getIndex() + " 조회 성공");
	}
}
