<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.http.*"
	import="javax.servlet.*" import="Common.Common"%>
<%
	String id;
	String name;
	String address;
	String tel;
	String categoryid;
	String errmsg;
	String category;
	Common common = new Common();
	ResultSet rs = common.getCategoryAll();
	String catename;
%>
<%
	id = (String) request.getParameter("id");
	name = (String) request.getParameter("name");
	address = (String) request.getParameter("address");
	tel = (String) request.getParameter("tel");
	category = (String) request.getParameter("categoryid");
	errmsg = (String) request.getParameter("errmsg");
	catename=(String)request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編集画面</title>
</head>
<body>
	<h1>住所録管理システム：住所録編集</h1>
	<br>

	<form action="./EditBL">
		<p>
			　　名前：<input type="text" name="name">
		</p>
		<p>
			　　住所：<input type="text" name="address">
		</p>
		<p>
			電話番号：<input type="text" name="tel">
		</p>
		<p>
			カテゴリ： <select name="categoryid">
				<%
					while (rs.next()) {
						String cid = rs.getString("categoryid");
						String cname = rs.getString("categoryname");
				%><option value="<%=cid%>">
					<%=cname%>
				</option>
				<%
					}
				%>
			</select>
		</p>
		<input type="hidden" name="id" value="<%=id%>"> <input
			type="submit" value="確認" style="background-color: #777777;">
	</form>

	<form action="./ListBL">
		<input type="submit" value="戻る" style="background-color: #777777;">
	</form>
</body>
</html>