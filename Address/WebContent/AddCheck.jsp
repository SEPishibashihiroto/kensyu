<!-- jspで使用するものをインポートする -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="Common.Common"%>

<!-- 宣言 -->
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
<link rel="stylesheet" href="check.css">
<title>追加確認画面</title>
</head>
<body>
	<h1>住所録管理システム：住所録登録</h1>

	<!-- Add.jspで入力したものを表示
		 また、その値を持ってAddCommitBLへ遷移
	 -->
	<form action="./AddCommitBL">

		<p>
			　　名前：<%=name%>
			<input type="hidden" name="name" value="<%=name%>">
		</p>

		<p>
			　　住所：<%=address%>
			<input type="hidden" name="address" value="<%=address%>">
		</p>

		<p>
			電話番号：<%=tel%>
			<input type="hidden" name="tel" value="<%=tel%>">
		</p>
		<input type="hidden" name="categoryid" value="<%=categoryid%>">
		<input type="submit" value="登録" class="btn">
	</form>

	<!-- 登録画面へ遷移 -->
	<form action="./Add.jsp">
		<input type="submit" value="戻る" class="btn">
	</form>
</body>
</html>