<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.http.*"
	import="javax.servlet.*" import="Common.Common"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>テスト用JSP</title>
</head>
<body>
	<%
		String tel = "123-4567-8900";
		if (!(tel.length() > 0 && tel.matches("^\\\\d{3}-\\d{4}-\\d{4}$"))) {
	%>
	<p>OK</p>
	<%
		}
	%>

</body>
</html>