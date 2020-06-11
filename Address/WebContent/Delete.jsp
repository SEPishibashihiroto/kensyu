<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.http.*"
	import="javax.servlet.*" import="Common.Common"%>
<%
	String id;
	String name;
	String address;
	String tel;
	String categoryid;
	String category;
	Common common = new Common();
	ResultSet rs = common.getCategoryAll();
%>
<%
	id = (String) request.getAttribute("id");
	name = (String) request.getAttribute("name");
	address = (String) request.getAttribute("address");
	tel = (String) request.getAttribute("tel");
	categoryid = (String) request.getAttribute("categoryid");
	category = common.getCategoryName(categoryid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除画面</title>
</head>
<body>
	<h1>下記住所録を削除します。よろしいですか？</h1>
	<br>



	<form action="./Delete" method="get">
		<input type="hidden" name="id" value="<%=id%>">
		<p>
			名前：<%=name%><input type="hidden" name="name" value="<%=name%>">
		</p>
		<p>
			住所：<%=address%><input type="hidden" name="address" value="<%=address%>">
		</p>
		<p>
			電話番号：<%=tel%><input type="hidden" name="tel" value="<%=tel%>">
		</p>
		<p>
			カテゴリ： <%=category%><input type="hidden" name="categoryid" value="<%=categoryid%>">
		</p>
		<input type="submit" value="確認">
	</form>

	<form action="./ListBL">
		<input type="submit" value="戻る">
	</form>
</body>
</html>