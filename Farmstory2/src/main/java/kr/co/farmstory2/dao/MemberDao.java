package kr.co.farmstory2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.farmstory2.db.DBConfig;
import kr.co.farmstory2.db.Sql;
import kr.co.farmstory2.vo.MemberVo;
import kr.co.farmstory2.vo.TermsVo;

public class MemberDao {

	private static MemberDao instance = new MemberDao();

	private MemberDao() {
	}

	public static MemberDao getInstacne() {
		return instance;
	}

	public void insertMember(MemberVo mv) {
		
		
		try {
			// 1, 2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			String uid = mv.getUid();
			String pwd = mv.getPass();
			String name = mv.getName();
			String nick = mv.getNick();
			String email = mv.getEmail();
			String hp = mv.getHp();
			String zip = mv.getZip();
			String addr1 = mv.getAddr1();
			String addr2 = mv.getAddr2();
			String regip = mv.getRegip();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pwd);
			psmt.setString(3, name);
			psmt.setString(4, nick);
			psmt.setString(5, email);
			psmt.setString(6, hp);
			psmt.setString(7, zip);
			psmt.setString(8, addr1);
			psmt.setString(9, addr2);
			psmt.setString(10, regip);

			// 4단계
			psmt.executeUpdate();

			
			
			conn.close();
		
		} catch (Exception e){
			e.printStackTrace();
		}
	}

	public TermsVo selectTerms() {
		TermsVo tv = new TermsVo();

		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);

			if (rs.next()) {
				tv.setTerms(rs.getString(1));
				tv.setPrivacy(rs.getString(1));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tv;
	}

	public int selectMemberCount(String uid) {
		
		int count = -1;

		try {
		// 1, 2 단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		// 3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
		psmt.setString(1, uid);

		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		// 6단계
		conn.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public int selectMemberNick(String nick) {
		int count = -1; // -1이 출력됐다는 것은 디비 연결이 안됐다는 것

		try {
		// 1, 2 단계
		Connection conn = DBConfig.getInstance().getConnection();

		// 3단계
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
		psmt.setString(1, nick);

		// 4단계
		ResultSet rs = psmt.executeQuery();
		
		// 5단계
		if(rs.next()) {
			count = rs.getInt(1);
		}
		
		// 6단계
		conn.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public MemberVo selectMember(String uid, String pwd) {
		
		MemberVo mb = null; // 참조 변수 초기값 멤버 변수 12개
		
		try{
			
			// 1, 2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pwd);

			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			if(rs.next()) {
				// 회원이 맞을 경우
				mb = new MemberVo();
				mb.setUid(rs.getString(1));
				mb.setPass(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setNick(rs.getString(4));
				mb.setEmail(rs.getString(5));
				mb.setHp(rs.getString(6));
				mb.setGrade(rs.getInt(7));
				mb.setZip(rs.getString(8));
				mb.setAddr1(rs.getString(9));
				mb.setAddr2(rs.getString(10));
				mb.setRegip(rs.getString(11));
				mb.setRdate(rs.getString(12));
			}
			
			// 6단계
			conn.close();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return mb;
	}

	public void selectMembers() {
	}

	public void updateMember() {
	}

	public void deleteMember() {
	}

}
