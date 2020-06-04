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
		Common common = new Common();
		ResultSet rs = common.getCategoryAll();
		while (rs.next()) {
			String number = rs.getString("categoryid");
			String s = rs.getString("categoryname");
			//teset
	%>

	<p><%=number%></p>
	<p><%=s%></p>
	<%
		}
	%>

</body>
</html>