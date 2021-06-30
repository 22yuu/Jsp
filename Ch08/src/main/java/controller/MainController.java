package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommonService;

public class MainController extends HttpServlet{
	
	private static final long serialVersionUID = 1L; // 1번 서블릿 
	private Map<String, Object> instances = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// 프로퍼티 파일(액션주소 맵핑 파일) 경로 구하기
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF")+"/urlMapping.properties";
		
		// 프로퍼티 파일 입력스토림 연결 후 프로퍼티 객체 생성
		Properties prop = new Properties();
		
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 프로퍼티 객체로 부터 서비스 객체(Map 구조체) 생성
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k,  instance);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
		
	}
	
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 요청주소에서 Service객체 key 구하기
		String path = req.getContextPath();
		String uri = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// Map에서 Service 객체 꺼내기
		CommonService instance = (CommonService) instances.get(key);
		
		// Service 객체 실행 후 View 리턴 받기
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// redirect
			String redirectUrl = result.substring(9);
			resp.sendRedirect(redirectUrl);
		} else {
			// View 포워드
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp);
		}
		
	} // requestProc end...
	
} // MainController end...
