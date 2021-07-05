package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.dao.MemberDao;
import kr.co.jboard2.service.CommonService;
import kr.co.jboard2.vo.MemberVo;

public class LoginService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		if(req.getMethod().equals("GET")) {
			// GET
			return "/user/login.jsp";
		} else {
			// POST
			// 전송 데이터 수신
			String uid = req.getParameter("uid");
			String pass = req.getParameter("pass");
			
			// DB
			MemberVo mv = MemberDao.getInstacne().selectMember(uid, pass);
			
			if(mv != null) {
				//로그인 성공 리다이렉트
				//session.setAttribute("sessMember", mv);
				HttpSession sess = req.getSession();
				sess.setAttribute("sessMember", mv);
				return "redirect:/Jboard2/list.do";
			} else {
				return "redirect:/Jboard2/user/login.do?sucess=100";
			}
		}
	}
}
