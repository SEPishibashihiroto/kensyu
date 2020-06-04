<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="Common.Common"%>
<%
	Common common = new Common();
	String name = (String) request.getAttribute("name");
	String address = (String) request.getAttribute("address");
	String tel = (String) request.getAttribute("tel");
	String categoryid = (String) request.getAttribute("categoryid");
	String categoryname = common.getCategoryName(categoryid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>追加確認画面</title>
</head>
<body>
	<h1>住所録管理システム：住所録登録</h1>
	<p>
		名前：<%=name%></p>
	<p>
		住所：<%=address%></p>
	<p>
		電話番号：<%=tel%></p>

	<form action="./AddCommitBL">
		<input type="submit" value="登録">
	</form>

	<form action="./ListBL">
		<input type="submit" value="戻る">
	</form>
</body>
</html>