<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
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
<title>住所録一覧</title>
</head>
<body>
	<h1>住所管理システム：住所録一覧</h1>


	<form action="Add.jsp">
		<input type="submit" value="新規登録" style="background-color: #777777;">
	</form>

	<form action="./ListBL">
		<input type="text" name="SerchName"> <input type="submit"
			value="検索" style="background-color: #777777;">
	</form>

	<%
		if (nowpage == 1) {//1ページ目の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<%
		for (int i = nowpage; i <= maxPage && i <= nowpage + 2; i++) {
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
		} else if (nowpage == maxPage) {//最終ページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		int n = maxPage == 2 ? 1 : 2;
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

	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
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





	<table border="1"
		style="border-collapse: collapse; border-color: black">
		<tr>
			<th style="background-color: #75A9FF;">No.</th>
			<th style="background-color: #75A9FF;">名前</th>
			<th style="background-color: #75A9FF;">住所</th>
			<th style="background-color: #75A9FF;">電話番号</th>
			<th style="background-color: #75A9FF;">カテゴリ</th>
			<th colspan="2" style="background-color: #75A9FF;"></th>
		</tr>
		<%
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String address = rs.getString("address");
				String tel = new StringBuilder(rs.getString("tel")).insert(3, "-").insert(8, "-").toString();
				String cname = rs.getString("categoryname");
		%>

		<tr>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=address%></td>
			<td><%=tel%></td>
			<td><%=cname%></td>
			<td>
				<form action="Edit.jsp" name="<%="ed" + id%>">
					<input type="hidden" name="id" value="<%=id%>"> <input
						type="hidden" name="name" value="<%=name%>"> <input
						type="hidden" name="address" value="<%=address%>"> <input
						type="hidden" name="tel" value="<%=tel%>"> <input
						type="hidden" name="category" value="<%=cname%>"> <input
						type="submit" value="編集" style="background-color: #777777;">
				</form>
			</td>
			<td>
				<form action="Delete.jsp" name="<%="del" + id%>" method="get">
					<input type="hidden" name="id" value="<%=id%>"> <input
						type="hidden" name="name" value="<%=name%>"> <input
						type="hidden" name="address" value="<%=address%>"> <input
						type="hidden" name="tel" value="<%=tel%>"> <input
						type="hidden" name="category" value="<%=cname%>"> <input
						type="submit" value="削除" style="background-color: #777777;">
				</form>
			</td>
		</tr>

		<%
			}
		%>

	</table>

	<%
		if (nowpage == 1) {//1ページ目の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<%
		for (int i = nowpage; i <= maxPage && i <= nowpage + 2; i++) {
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
		} else if (nowpage == maxPage) {//最終ページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=nowpage - 1%>"><%="<　"%></a>
	<%
		int n = maxPage == 2 ? 1 : 2;
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

	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
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

	<form action="Add.jsp">
		<input type="submit" value="新規登録" style="background-color: #777777;">
	</form>

</body>
</html>