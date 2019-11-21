package com.project.basic;

import com.project.basic.board.service.BoardService;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.basic.board.domain.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	BoardService boardService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Board board, Locale locale, Model model) throws ClassNotFoundException, SQLException {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("board", board);
		model.addAttribute("list", boardService.selectList());
		
		return "home";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Board board, Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("board", board);
		
		return "write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board) throws ClassNotFoundException, SQLException {
		boardService.insert(board);
		
		return "redirect:/";
	}
}
