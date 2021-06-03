<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	/*
		날짜 : 2021/06/03
		이름 : 이진유
		내용 : XML 실습하기
		
		XML(Extensible Markup Language)
		 - JSON과 더불어 이기종간의 데이터 전송을 위한 문서 포멧
		 - 사용자가 직접 태그를 정의
		 - Json 보다 파싱속도가 느리다는 단점
	*/

	String xml = "<members>";
		   xml += "<member>";
		   xml += "<uid>a101</uid>";
		   xml += "<name>김유신</name>";
		   xml += "<hp>010-1111-2222</hp>";
		   xml += "<pos>사원</pos>";
		   xml += "<dep>101</dep>";
		   xml += "<rdate>2021-06-03 10:40:12</rdate>";
		   xml += "</member>";
		   xml += "<member>";
		   xml += "<uid>a102</uid>";
		   xml += "<name>김춘추</name>";
		   xml += "<hp>010-1212-2222</hp>";
		   xml += "<pos>대리</pos>";
		   xml += "<dep>102</dep>";
		   xml += "<rdate>2021-06-03 10:40:12</rdate>";
		   xml += "</member>";
		   xml += "</members>";
		   
	
	out.print(xml);
%>

