<!-- jspで使用するものをインポートする -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.http.*"
	import="javax.servlet.*" import="Common.Common"%>

<!-- 宣言 -->
<%
	String id;
	String name;
	String address;
	String tel;
	String categoryid;
	String category;
%>

<!-- 値を取得 -->
<%
	id = (String) request.getParameter("id");
	name = (String) request.getParameter("name");
	address = (String) request.getParameter("address");
	tel = (String) request.getParameter("tel");
	category = (String) request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>削除画面</title>
</head>
<body>
	<h1>下記住所録を削除します。よろしいですか？</h1>
	<br>

<!-- List.jspで削除ボタンが押されたid番号の値を表示
	 また、OKボタンが押されたらid、telの値を持ってDeletCommitBLへ遷移
 -->
	<form action="./DeletCommitBL" method="get">
		<input type="hidden" name="id" value="<%=id%>">
		<p>
			　　名前：<%=name%>
		</p>
		<p>
			　　住所：<%=address%>
		</p>
		<p>
			電話番号：<%=tel%><input type="hidden" name="tel" value="<%=tel%>">
		</p>
		<p>
			カテゴリ：<%=category%>
		</p>
		<input type="submit" value="OK" class="btn">
	</form>

	<!-- ボタンが押されたら住所録一覧画面へ遷移 -->
	<form action="./ListBL">
		<input type="submit" value="キャンセル" class="btn">
	</form>
</body>
</html>