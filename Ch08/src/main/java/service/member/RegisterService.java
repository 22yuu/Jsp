package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommonService;
import vo.MemberVO;

public class RegisterService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			// GET
			return "/member/register.jsp";
		} else {
			// POST
			
			// 전송 파라미터 수신
			String uid = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String pos = req.getParameter("pos");
			String dep = req.getParameter("dep");
			
			MemberVO vo = new MemberVO();
			
			vo.setUid(uid);
			vo.setName(name);
			vo.setHp(hp);
			vo.setPos(pos);
			vo.setDep(dep);
			
			MemberDao.getInstance().insertMember(vo);
			
			return "redirect:/Ch08/member/list.do"; // 스프링의 리다이렉트 형식
		}
	}
}
