<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.http.*"
	import="javax.servlet.*" import="Common.Common"%>

<%
	String name;
	String address;
	String tel;
	String categoryid;
	String errmsg;
	String category;
	Common common = new Common();
	ResultSet rs = common.getCategoryAll();
%>
<%
	if ((String) request.getAttribute("name") == null) {
		name = "";
		address = "";
		tel = "";
		category = "";
		errmsg = "";
	} else {
		name = (String) request.getAttribute("name");
		address = (String) request.getAttribute("address");
		tel = (String) request.getAttribute("tel");
		category = (String) request.getAttribute("categoryid");
		errmsg = (String) request.getAttribute("errmsg");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>住所録登録</title>
</head>
<body>
	<h1>住所録管理システム：住所録登録</h1>
	<br>
	<h2>
		※<%=errmsg%>
	</h2>

	<form action="./AddBL" method="get">
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
		<input type="submit" value="確認">
	</form>

	<form action="./ListBL">
		<input type="submit" value="戻る">
	</form>
</body>
</html>