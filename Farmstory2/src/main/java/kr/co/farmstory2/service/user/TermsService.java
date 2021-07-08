package kr.co.farmstory2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.dao.MemberDao;
import kr.co.farmstory2.service.CommonService;
import kr.co.farmstory2.vo.TermsVo;

public class TermsService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		TermsVo tv = MemberDao.getInstacne().selectTerms();
		
		req.setAttribute("tv", tv);
		
		return "/user/terms.jsp";
	}
}
