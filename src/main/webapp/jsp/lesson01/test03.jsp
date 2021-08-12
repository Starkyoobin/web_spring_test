<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ViewResolver로 jsp view 화면 띄우기</title>
</head>
<body>
	<h1>리스트 기억나시죠?</h1>
	<h3>나의 최애 메뉴!</h3>
	<%
		List<String> menuList = new ArrayList<>();
		menuList.add("제육덮밥");
		menuList.add("돈까스");
		menuList.add("살치살");
		
		for(String menu : menuList) {
	%>
	<ul>
		<li><%=menu %></li>
	</ul>
	<%
		}
	%>
</body>
</html>