package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommonService;

public class List implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
	
		return "/member/list.jsp";
	}
}
