package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import kr.co.jboard2.db.DBConfig;
import kr.co.jboard2.db.Sql;
import kr.co.jboard2.vo.ArticleVo;
import kr.co.jboard2.vo.FileVo;

// DAO(Database Access Object) 클래스
public class ArticleDao {
	
	private static ArticleDao instance = new ArticleDao();
	private ArticleDao() {}
	
	public static ArticleDao getInstance() {
		return instance;
	}
	
	public int[] getPageGroup(int currentPage, int lastPageNum) {
		
		int groupCurrent = (int)Math.ceil(currentPage / 10.0);
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupCurrent * 10;
		
		if(groupEnd > lastPageNum) {
			groupEnd = lastPageNum;
		}
		
		int[] groups = {groupStart, groupEnd};
		return groups;
		
	}
	
	public int getPageStartNum(int total, int start) {
		return total - start;
	}
	
	public int getLimitStart(int currentPage) {
		return (currentPage - 1) * 10;
	}
	
	public int getCurrentPage(String pg) {
		int currentPage = 1;

		//로그인해서 list에 들어올 때는 pg값을 가져오지 않기 때문에 null 값을 받아온다. 
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		
		return currentPage;
	}
	
	public int getlastPageNum(int total) {
		
		int lastPageNum = 0;
		
		if(total % 10 == 0) {
			lastPageNum = total / 10;
		} else {
			lastPageNum = total / 10 + 1;
		}
		
		return lastPageNum;
	}
	
	public int selectCountArticle() {

		int total = 0;
		
		try {
			// 1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_ARTICLES);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			// 6단계
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return total;
	}
	
	
	
	public int insertArticle(ArticleVo vo) {
		
		int seq = 0;
		try {
			
			// 1,2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt =  conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setInt(3, vo.getFile());
			psmt.setString(4, vo.getUid());
			psmt.setString(5, vo.getRegip());
			
			psmt.executeUpdate();
			
			
			conn.close();
			
			
			
			} catch(Exception e) {
				e.printStackTrace();
			}
		return selectMaxSeq();
	}
	
	public void insertComment(ArticleVo comment) {
		
		int parent = comment.getParent();
		String content = comment.getContent();
		String uid = comment.getUid();
		String regip = comment.getRegip();
		
		try {
			
			// 1,2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt =  conn.prepareStatement(Sql.INSERT_COMMENT);
			psmt.setInt(1, parent);
			psmt.setString(2, content);
			psmt.setString(3, uid);
			psmt.setString(4, regip);

			// 4단계
			psmt.executeUpdate();
			
			// 5단계
			
			
			// 6단계
			conn.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}

	}
	
	public void insertFile(int seq, String fname, String newName) {
		
		try {
			
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, seq);
			psmt.setString(2, fname);
			psmt.setString(3, newName);
			psmt.executeUpdate();
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int selectMaxSeq() {
		
		int seq = 0;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
			
			if(rs.next()) {
				
				seq = rs.getInt(0);
				
			}
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return seq;
	}
	
	public ArticleVo selectArticle(String seq) {
		
		ArticleVo article = new ArticleVo();
		FileVo fb = new FileVo();
		
		try {
			
			// 1,2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			
			// 4 단계
			ResultSet rs = psmt.executeQuery();
			
			// 5 단계
			if(rs.next()) {
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				
				// 추가필드
				fb.setSeq(rs.getInt(12));
				fb.setParent(rs.getInt(13));
				fb.setOriName(rs.getString(14));
				fb.setNewName(rs.getString(15));
				fb.setDownload(rs.getInt(16));
				fb.setRdate(rs.getString(17));
				
				article.setFb(fb);
			}
			// 6 단계
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return article;
	}
	
	public List<ArticleVo> selectArticles(int start) {
		List<ArticleVo> articles = new ArrayList<>();
		
		try {
			// 1, 2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, start);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			while(rs.next()) {
				ArticleVo article = new ArticleVo();
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				articles.add(article);
			}
			
			// 6단계
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	public List<ArticleVo> selectComments(String parent) {
		
		List<ArticleVo> articles = new ArrayList<>();
		
		try {
			// 1, 2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, parent);
			
			// 4단계
			ResultSet rs = psmt.executeQuery();
			
			// 5단계
			while(rs.next()) {
				ArticleVo article = new ArticleVo();
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
				
				articles.add(article);
			}
			
			// 6단계
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return articles;
	}
	
	public FileVo selectFile(String seq) {
		
		FileVo fb = new FileVo();
		
		try {
			
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, seq);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				fb.setSeq(rs.getInt(1));
				fb.setParent(rs.getInt(2));
				fb.setOriName(rs.getString(3));
				fb.setNewName(rs.getString(4));
				fb.setDownload(rs.getInt(5));
				fb.setRdate(rs.getString(6));
			}
			
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return fb;
	}
	
	public void updateArticle(String title, String content, String seq) {
		
		try {
			
			Connection conn = DBConfig.getInstance().getConnection();
			
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, seq);
			
			psmt.executeUpdate(); // 업데이트 성공 1 리턴 실패 0
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateComment(String content, String seq) {
		
		int result = 0;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, seq);
			
			psmt.executeUpdate();
			result = psmt.executeUpdate(); // 업데이트 성공 1 리턴 실패 0
			
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void updateArticleHit(String seq) {
		try {
					
			// 1,2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, seq);
			
			// 4 단계
			psmt.executeUpdate();
			
			// 6 단계
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateArticleCommentCountUp(String seq) {
		try {
			
			// 1,2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_COUNT_UP);
			psmt.setString(1, seq);
			
			// 4 단계
			psmt.executeUpdate();
			
			// 6 단계
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateArticleCommentCountDown(String seq) {
		try {
			
			// 1,2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_COUNT_DOWN);
			psmt.setString(1, seq);
			
			// 4 단계
			psmt.executeUpdate();
			
			// 6 단계
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateFileDownload(String seq) {
		
		try {
			// 1,2 단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_FILE_DOWNLOAD);
			psmt.setString(1, seq);
			
			// 4 단계
			psmt.executeUpdate();
			
			// 6 단계
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteArticle(String seq) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_ARTICLE);
			psmt.setString(1, seq);
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteComment(String seq) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
			psmt.setString(1, seq);
			
			psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
