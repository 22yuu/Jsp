package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.bean.ArticleBean;
import kr.co.jboard1.db.DBConfig;
import kr.co.jboard1.db.Sql;

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
	
	public void insertArticle() {}
	public ArticleBean selectArticle(String seq) {
		
		ArticleBean article = new ArticleBean();
		
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
			}
			// 6 단계
			conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return article;
	}
	
	public List<ArticleBean> selectArticles(int start) {
		List<ArticleBean> articles = new ArrayList<>();
		
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
				ArticleBean article = new ArticleBean();
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
	
	public void updateArticle() {}
	public void deleteArticle() {}

}
