package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import vo.MemberVO;

public class MemberDao {

	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	private final String HOST = "jdbc:mysql://54.180.160.240:3306/22jinuu";
	private final String USER = "22jinuu";
	private final String PASS = "1234";
	
	public void insertMember(MemberVO vo) {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			
			String sql = "INSERT INTO `MEMBER` VALUES (?,?,?,?,?,NOW())";
			
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setString(4, vo.getPos());
			psmt.setInt(5, vo.getDep());
			
			psmt.executeUpdate();
			
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void selectMember() {}
	public void selectMembers() {}
	public void updateMember() {}
	public void deleteMember() {}
	
}
