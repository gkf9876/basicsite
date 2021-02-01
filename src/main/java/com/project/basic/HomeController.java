package com.project.basic;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.project.basic.board.domain.Board;
import com.project.basic.board.file.upload.FileUploadUtil;
import com.project.basic.board.service.BoardService;

import net.sf.json.JSONArray;

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
	 * @throws IOException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Board board, Locale locale, Model model) throws ClassNotFoundException, SQLException, IOException {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("board", board);
		model.addAttribute("list", boardService.selectList(board));
		
		return "home";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Board board, Model model) throws ClassNotFoundException, SQLException {
		model.addAttribute("board", board);
		
		return "write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board) throws ClassNotFoundException, SQLException, IOException {
		boardService.insert(board);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/websocket", method = RequestMethod.GET)
	public String websocket(Board board, Locale locale, Model model) throws ClassNotFoundException, SQLException, IOException {
		
		return "websocket";
	}
	
	@RequestMapping("/download1")
	public void downloadFile1(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fileNm = "";
		String header = request.getHeader("User-Agent");
		if (header.contains("MSIE") || header.contains("Trident")) {
			fileNm = URLEncoder.encode("IT경영.pdf", "UTF-8").replaceAll("\\+", "%20");
        } else {
    		fileNm = new String("IT경영.pdf".getBytes("UTF-8"), "ISO-8859-1");
        }
		fileNm = "\"" + fileNm + "\"";
		
		File file = new File("C:\\Users\\gkf9876\\Desktop\\IT경영.pdf");
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		
		response.setHeader("Content-Disposition", "attachment; filename=" + fileNm);
		//response.setContentType("application/smnet; charset=UTF-8");
		response.setContentType("application/unknown; charset=UTF-8");
		//response.setHeader("Content-Type", "application/octet-stream");
		
		byte abyte0[] = new byte[4096];
		int numberRead = 0;
		
		
		ServletOutputStream oput = response.getOutputStream();
		try {
			while((numberRead = in.read(abyte0, 0, 4096)) != -1){
				oput.write(abyte0, 0, numberRead);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(in != null) {
					in.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(oput != null) {
					oput.flush();
					oput.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/download2")
	public void downloadFile2(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fileNm = "";
		String header = request.getHeader("User-Agent");
		if (header.contains("MSIE") || header.contains("Trident")) {
			fileNm = URLEncoder.encode("20-0640 회신문.hwp", "UTF-8").replaceAll("\\+", "%20");
        } else {
    		fileNm = new String("20-0640 회신문.hwp".getBytes("UTF-8"), "ISO-8859-1");
        }
		fileNm = "\"" + fileNm + "\"";
		
		File file = new File("C:\\Users\\gkf9876\\Desktop\\20-0640 회신문.hwp");
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		
		response.setHeader("Content-Disposition", "attachment; filename=" + fileNm);
		//response.setContentType("application/smnet; charset=UTF-8");
		response.setContentType("application/unknown; charset=UTF-8");
		//response.setHeader("Content-Type", "application/octet-stream");
		
		byte abyte0[] = new byte[4096];
		int numberRead = 0;
		
		
		ServletOutputStream oput = response.getOutputStream();
		try {
			while((numberRead = in.read(abyte0, 0, 4096)) != -1){
				oput.write(abyte0, 0, numberRead);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(in != null) {
					in.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(oput != null) {
					oput.flush();
					oput.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(Board board, Locale locale, Model model) throws ClassNotFoundException, SQLException, IOException {
		
		return "upload";
	}
	
	@RequestMapping(value = "/uploadfiles")
	@ResponseBody
	public String uploadFile(HttpServletRequest request){
 
		Calendar calendar=Calendar.getInstance();
		List<String> filePathList = new ArrayList<String>();
		String filePath= "Test";
		String filePathUrl="C:\\Users\\gkf9876\\Desktop\\"+calendar.get(Calendar.YEAR)+calendar.get(Calendar.MONTH);
		filePath=filePath+File.separatorChar+calendar.get(Calendar.YEAR)+calendar.get(Calendar.MONTH);
		try {
			filePathList = FileUploadUtil.uploadFile(request, filePath,filePathUrl);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception ex){
			ex.printStackTrace();
		}
 
		if(filePathList.size() == 0){
			return "Invalid file type.";
		}else {
			return "1";
		}
		//JSONArray result = JSONArray.fromObject(filePathList);
		//return result;
	}
	
	@RequestMapping(value = "/kakaoLogin")
	public String kakaoLogin(HttpServletRequest request){
		return "kakaoLogin";
	}
	
	@ResponseBody
	@RequestMapping("/callback.do")
	public String kakaoCallBack(Model model, HttpServletRequest request) throws Exception{
		return "Hello World";
	}

	@ResponseBody
	@RequestMapping(value = "/kakaoClose")
	public String kakaoConnectClose(Model model, HttpServletRequest request) {
		String result = "";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("https://kapi.kakao.com/v1/user/unlink?target_id_type=user_id&target_id=1254511318");
		
		try {
			httpPost.addHeader("Authorization", "KakaoAK 4e9dd97c4fc8ecfd757d76e6f69faaad");
			CloseableHttpResponse response = httpClient.execute(httpPost);
			result = EntityUtils.toString(response.getEntity());
			System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Success";
	}

	@ResponseBody
	@RequestMapping(value = "/naverClose")
	public String naverConnectClose(Model model, HttpServletRequest request) {
		String result = "";
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("https://kapi.kakao.com/v1/user/unlink?target_id_type=user_id&target_id=1254511318");
		
		try {
			httpPost.addHeader("Authorization", "KakaoAK 4e9dd97c4fc8ecfd757d76e6f69faaad");
			CloseableHttpResponse response = httpClient.execute(httpPost);
			result = EntityUtils.toString(response.getEntity());
			System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "Success";
	}
}
