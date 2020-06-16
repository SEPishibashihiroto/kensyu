<!-- jspで使用するものをインポートする -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<!-- 宣言、値を取得 -->
<%
	ResultSet rs = (ResultSet) request.getAttribute("Result");
	int listCnt = (int) request.getAttribute("ListCnt");
	String nowPage = (String) request.getAttribute("page");
	int maxPage = listCnt % 10 == 0 ? listCnt / 10 : listCnt / 10 + 1;
	int nowpage = Integer.parseInt(nowPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>住所録一覧</title>
</head>
<body>
	<h1>住所管理システム：住所録一覧</h1>

	<!-- 登録画面へ遷移するためのボタン -->
	<form action="Add.jsp">
		<input type="submit" value="新規登録"  class="btn">
	</form>

	<!-- 住所を検索し、絞り込むためのテキストボックス、ボタン -->
	<form action="./ListBL">
		<p>住所：</p><input type="text" name="SerchName"><br> <input type="submit"
			value="検索" class="serchbtn">
	</form>


	<!-- ページング処理　ここから -->
	<%
		if (nowpage == 1) {//1ページ目の処理
	%>
	<a><%="<<　"%></a>
	<a><%="<　"%></a>
	<%
		for (int i = nowpage; i <= maxPage && i <= 5; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>

	<%
		}
	%>
	<a href="ListBL?page=<%=nowpage + 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		} else if (nowpage == 2) {//2ページ目の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		for (int i = nowpage - 1; i <= maxPage && i <= 5; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>

	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		} else if (nowpage == maxPage - 1) {//最終ページの1ページ前の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		for (int i = maxPage - 4; i <= maxPage; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>
	<a href="ListBL?page=<%=nowPage + 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>

	<%
		} else if (nowpage == maxPage) {//最終ページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		int n = maxPage == 2 ? 1 : 4;
			for (int i = nowpage - n; i <= nowpage; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>
	<a><%=">　"%></a>
	<a><%=">>　"%></a>
	<%
		} else {//それ以外のページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		int n = nowpage == 2 ? 1 : 2;
			for (int i = nowpage - n; i <= maxPage && i <= nowpage + 2; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>
	<a href="ListBL?page=<%=nowpage == maxPage ? maxPage : nowpage - 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		}
	%>
	<!-- ページング処理  ここまで -->

	<!-- 住所録一覧のテーブル -->
	<table border="1"
		style="border-collapse: collapse; border-color: black; width:80%;">
		<tr>
			<th class="tid">No.</th>
			<th class="tname">名前</th>
			<th class="tadres">住所</th>
			<th class="ttel">電話番号</th>
			<th class="tcategory">カテゴリ</th>
			<th colspan="2" class="tbrank"></th>
		</tr>
		<!-- ListBLで行ったリザルトを実行 -->
		<%
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String address = rs.getString("address");
				String tel = (rs.getString("tel").equals("")) ? rs.getString("tel")
						: new StringBuilder(rs.getString("tel")).insert(3, "-").insert(8, "-").toString();
				String cname = rs.getString("categoryname");
		%>

		<tr>
			<td class="tid"><%=id%></td>
			<td class="tname"><%=name%></td>
			<td class="tadres"><%=address%></td>
			<td class="ttel"><%=tel%></td>
			<td class="tcategory"><%=cname%></td>
			<td>
				<!--
					編集画面へ行くためのボタン
					id、name、address、tel、cnameを持ってEdit.jspへ遷移
				 -->
				<form action="Edit.jsp" name="<%="ed" + id%>">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="name" value="<%=name%>">
					<input type="hidden" name="address" value="<%=address%>">
					<input type="hidden" name="tel" value="<%=tel%>">
					<input type="hidden" name="category" value="<%=cname%>">
					<input type="hidden" name="errmsg" value="<%=""%>">
					<input type="submit" value="編集"  class="btn tbtn">
				</form>
			</td>
			<td>
				<!--
					削除画面へ行くためのボタン
					idを持ってDelete.jspへ遷移
				 -->
				<form action="Delete.jsp" name="<%="del" + id%>" method="get">
					<input type="hidden" name="id" value="<%=id%>"> <input
						type="hidden" name="name" value="<%=name%>"> <input
						type="hidden" name="address" value="<%=address%>"> <input
						type="hidden" name="tel" value="<%=tel%>"> <input
						type="hidden" name="category" value="<%=cname%>"> <input
						type="submit" value="削除"  class="btn tbtn">
				</form>
			</td>
		</tr>

		<%
			}
		%>

	</table>

	<!-- ページング処理　ここから -->
	<%
		if (nowpage == 1) {//1ページ目の処理
	%>
	<a><%="<<　"%></a>
	<a><%="<　"%></a>
	<%
		for (int i = nowpage; i <= maxPage && i <= 5; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>

	<%
		}
	%>
	<a href="ListBL?page=<%=nowpage + 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		} else if (nowpage == 2) {//2ページ目の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		for (int i = nowpage - 1; i <= maxPage && i <= 5; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>

	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		} else if (nowpage == maxPage - 1) {//最終ページの1ページ前の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		for (int i = maxPage - 4; i <= maxPage; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>
	<a href="ListBL?page=<%=nowPage + 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>

	<%
		} else if (nowpage == maxPage) {//最終ページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		int n = maxPage == 2 ? 1 : 4;
			for (int i = nowpage - n; i <= nowpage; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>
	<a><%=">　"%></a>
	<a><%=">>　"%></a>
	<%
		} else {//それ以外のページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		int n = nowpage == 2 ? 1 : 2;
			for (int i = nowpage - n; i <= maxPage && i <= nowpage + 2; i++) {
				if (i == nowpage) {
	%>
	<a><%=i + " |　"%></a>
	<%
		} else {
	%>
	<a href="ListBL?page=<%=i%>"><%=i + " |　"%></a>
	<%
		}
	%>
	<%
		}
	%>
	<a href="ListBL?page=<%=nowpage == maxPage ? maxPage : nowpage - 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		}
	%>
	<!-- ページング処理  ここまで -->

	<!-- 登録画面へ遷移するためのボタン -->
	<form action="Add.jsp">
		<input type="submit" value="新規登録"  class="btn">
	</form>


</body>
</html>