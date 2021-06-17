package kr.co.jboard1.db;

public class Sql {

	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `JBOARD_MEMBER` WHERE `email`=?;";
	public static final String SELECT_COUNT_HP = "SELECT COUNT(`hp`) FROM `JBOARD_MEMBER` WHERE `hp`=?;";
	public static final String SELECT_COUNT_NICK = "SELECT COUNT(`nick`) FROM `JBOARD_MEMBER` WHERE `nick`=?;";
	public static final String SELECT_COUNT_UID = "SELECT COUNT(`uid`) FROM `JBOARD_MEMBER` WHERE `uid`=?;";
	
	public static final String SELECT_MEMBER = "SELECT * FROM `JBOARD_MEMBER` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	public static final String INSERT_MEMBER = "INSERT INTO `JBOARD_MEMBER` SET "
			+ "`uid`=?,"
			+ "`pass`=PASSWORD(?),"
			+ "`name`=?,"
			+ "`nick`=?,"
			+ "`email`=?,"
			+ "`hp`=?,"
			+ "`zip`=?,"
			+ "`addr1`=?,"
			+ "`addr2`=?,"
			+ "`regip`=?,"
			+ "`rdate`=NOW();";
	
	public static final String SELECT_TERMS = "SELECT * FROM `JBOARD_TERMS`;";
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `JBOARD_ARTICLE`;";
	
	public static final String SELECT_COUNT_ARTICLES = "SELECT COUNT(*) FROM `JBOARD_ARTICLE` WHERE `title` is not null;";
	
	public static final String SELECT_ARTICLE = "SELECT * FROM `JBOARD_ARTICLE` AS a "
													+ "LEFT JOIN `JBOARD_FILE` AS b "
													+ "ON a.seq = b.parent "
													+ "WHERE a.`seq` = ?";
			
	public static final String SELECT_ARTICLES = "SELECT a.*, b.`nick` FROM `JBOARD_ARTICLE` AS a "
													+ "JOIN `JBOARD_MEMBER` AS b "
													+ "ON a.uid = b.uid "
													+ "WHERE `title` is NOT NULL "
													+ "ORDER BY seq DESC "
													+ "LIMIT ?, 10;";
	
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
													+ "JOIN `JBOARD_MEMBER` AS b "
													+ "ON a.uid = b.uid "
													+ "WHERE `parent`=? "
													+ "ORDER BY `seq` ASC;";
	
	public static final String SELECT_FILE = "SELECT * FROM `JBOARD_FILE` WHERE `seq`=?";
	
	
	public static final String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
											   + "`title`=?,"
											   + "`content`=?,"
											   + "`file`=?,"
											   + "`uid`=?,"
											   + "`regip`=?, "
											   + "`rdate`=NOW();";
	
	public static final String INSERT_COMMENT = "INSERT INTO `JBOARD_ARTICLE` SET "
													+ "`parent`=?,"
													+ "`content`=?,"
													+ "`uid`=?,"
													+ "`regip`=?,"
													+ "`rdate`=NOW();";
	
	public static final String INSERT_FILE = "INSERT INTO `JBOARD_FILE` SET "
												+ "`parent`=?,"
												+ "`oriName`=?,"
												+ "`newName`=?,"
												+ "`rdate`=NOW();";

	public static final String UPDATE_ARTICLE = "UPDATE `JBOARD_ARTICLE` SET "
													+ "`title`=?, "
													+ "`content`=? "
													+ "WHERE `seq`=?;";
	
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `JBOARD_ARTICLE` "
												+ "SET `hit` = `hit` + 1 "
												+ "WHERE `seq`=?";
	
	public static final String UPDATE_COMMENT = "UPDATE `JBOARD_ARTICLE` "
												+ "SET `content` =? "
												+ "WHERE `seq`=?;";
	
	public static final String UPDATE_ARTICLE_COMMENT_COUNT_UP = "UPDATE `JBOARD_ARTICLE` "
																	+ "SET `comment` = `comment` + 1 "
																	+ "WHERE `seq`=?";
	
	public static final String UPDATE_ARTICLE_COMMENT_COUNT_DOWN = "UPDATE `JBOARD_ARTICLE` "
																	+ "SET `comment` = `comment` - 1 "
																	+ "WHERE `seq`=?";
	
	public static final String UPDATE_FILE_DOWNLOAD = "UPDATE `JBOARD_FILE` "
														+ "SET `download` = `download` + 1 "
														+ "WHERE `seq`=?";
	
	public static final String DELETE_ARTICLE =  "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=?"; 
	
	public static final String DELETE_COMMENT = "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=?";
}