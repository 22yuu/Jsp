<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//DB 정보
	String host = "jdbc:mysql://15.164.100.88:3306/mydb";
	String user = "bigdata";
	String pass = "bigdata";

	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(host, user, pass);

		Statement stmt = conn.createStatement();

		String sql = "SELECT * FROM `JBOARD_TERMS`;";

		ResultSet rs = stmt.excuteQuery(sql);

		conn.close();
	
	} catch {

	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="/JBoard1/css/style.css"/>    
</head>
<body>

    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly>약관내용</textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly>개인정보 내용</textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/JBoard1/user/login.jsp">취소</a>
                <a href="/JBoard1/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>