<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	ResultSet rs = (ResultSet) request.getAttribute("Result");
	int listCnt = (int) request.getAttribute("ListCnt");
	String nowPage = (String) request.getAttribute("page");
	int maxPage = listCnt % 10 == 0 ? listCnt / 10 : listCnt / 10 + 1;
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
		<input type="submit" value="新規登録">
	</form>

	<%
		if (Integer.parseInt(nowPage) == 1) {//1ページ目の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<%
		for (int i = Integer.parseInt(nowPage); i <= maxPage && i <= Integer.parseInt(nowPage) + 2; i++) {
				if (i == Integer.parseInt(nowPage)) {
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
	<a href="ListBL?page=<%=Integer.parseInt(nowPage) + 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>

	<%
		} else if (Integer.parseInt(nowPage) == maxPage) {//最終ページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=Integer.parseInt(nowPage) - 1%>"><%="<　"%></a>
	<%
		int n = maxPage == 2 ? 1 : 2;
			for (int i = Integer.parseInt(nowPage) - n; i <= Integer.parseInt(nowPage); i++) {
				if (i == Integer.parseInt(nowPage)) {
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
	<a href="ListBL?page=<%=Integer.parseInt(nowPage) - 1%>"><%="<　"%></a>
	<%
		int n = Integer.parseInt(nowPage) == 2 ? 1 : 2;
			for (int i = Integer.parseInt(nowPage) - n; i <= maxPage && i <= Integer.parseInt(nowPage) + 2; i++) {
				if (i == Integer.parseInt(nowPage)) {
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
	<a
		href="ListBL?page=<%=Integer.parseInt(nowPage) == maxPage ? maxPage : Integer.parseInt(nowPage) - 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		}
	%>





	<table border="1">
		<tr>
			<th>No.</th>
			<th>名前</th>
			<th>住所</th>
			<th>電話番号</th>
			<th>カテゴリ</th>
			<th colspan="2"></th>
		</tr>
		<%
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String address = rs.getString("address");
				String tel = rs.getString("tel");
				String cname = rs.getString("categoryname");
		%>

		<tr>
			<td><%=id%></td>
			<td><%=name%></td>
			<td><%=address%></td>
			<td><%=tel%></td>
			<td><%=cname%></td>
			<td>
				<form action="Edit.jsp" name="<%=id%>" method="get">
					<input type="hidden" name="id" value="<%=id%>"> <input
						type="hidden" name="name" value="<%=name%>"> <input
						type="hidden" name="sddress" value="<%=address%>"> <input
						type="hidden" name="tel" value="<%=tel%>"> <input
						type="hidden" name="category" value="<%=cname%>"> <input
						type="submit" value="編集">
				</form>
			</td>
			<td><form action="Delete.jsp" name="<%=id%>" method="get">
					<input type="hidden" name="id" value="<%=id%>"> <input
						type="hidden" name="name" value="<%=name%>"> <input
						type="hidden" name="sddress" value="<%=address%>"> <input
						type="hidden" name="tel" value="<%=tel%>"> <input
						type="hidden" name="category" value="<%=cname%>"> <input
						type="submit" value="削除">
				</form></td>
		</tr>

		<%
			}
		%>

	</table>

	<%
		if (Integer.parseInt(nowPage) == 1) {//1ページ目の処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<%
		for (int i = Integer.parseInt(nowPage); i <= maxPage && i <= Integer.parseInt(nowPage) + 2; i++) {
				if (i == Integer.parseInt(nowPage)) {
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
	<a href="ListBL?page=<%=Integer.parseInt(nowPage) + 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>

	<%
		} else if (Integer.parseInt(nowPage) == maxPage) {//最終ページの処理
	%>
	<a href="ListBL?page=1"><%="<<　"%></a>
	<a href="ListBL?page=<%=Integer.parseInt(nowPage) - 1%>"><%="<　"%></a>
	<%
		int n = maxPage == 2 ? 1 : 2;
			for (int i = Integer.parseInt(nowPage) - n; i <= Integer.parseInt(nowPage); i++) {
				if (i == Integer.parseInt(nowPage)) {
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
	<a href="ListBL?page=<%=Integer.parseInt(nowPage) - 1%>"><%="<　"%></a>
	<%
		int n = Integer.parseInt(nowPage) == 2 ? 1 : 2;
			for (int i = Integer.parseInt(nowPage) - n; i <= maxPage && i <= Integer.parseInt(nowPage) + 2; i++) {
				if (i == Integer.parseInt(nowPage)) {
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
	<a
		href="ListBL?page=<%=Integer.parseInt(nowPage) == maxPage ? maxPage : Integer.parseInt(nowPage) - 1%>"><%=">　"%></a>
	<a href="ListBL?page=<%=maxPage%>"><%=">>　"%></a>
	<%
		}
	%>

</body>
</html>