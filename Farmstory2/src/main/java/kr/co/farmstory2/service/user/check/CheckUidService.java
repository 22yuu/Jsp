package kr.co.farmstory2.service.user.check;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.service.CommonService;

public class CheckUidService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		
		String uid = req.getParameter("uid");
		
		return "/user/proc/checkUid.jsp?uid="+uid;
	}
}
