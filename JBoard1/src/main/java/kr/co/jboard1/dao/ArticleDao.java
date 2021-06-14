package kr.co.jboard1.dao;


// DAO(Database Access Object) 클래스
public class ArticleDao {
	
	private static ArticleDao instance = new ArticleDao();
	private ArticleDao() {}
	
	public static ArticleDao getInstance() {
		return instance;
	}
	
	public void insertArticle() {}
	public void selectArticle() {}
	public void selectArticles() {}
	public void updateArticle() {}
	public void deleteArticle() {}

}
