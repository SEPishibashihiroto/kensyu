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
			<td><%=id%><input type="hidden" name="id" value="<%=id%>"></td>
			<td><%=name%><input type="hidden" name="name" value="<%=name%>"></td>
			<td><%=address%><input type="hidden" name="sddress" value="<%=address%>"></td>
			<td><%=tel%><input type="hidden" name="tel" value="<%=tel%>"></td>
			<td><%=cname%><input type="hidden" name="category" value="<%=cname%>"></td>
			<td><form action="Edit.jsp">
					<input type="submit" value="編集">
				</form></td>
			<td><form action="Add.jsp">
					<input type="submit" value="削除">
				</form></td>
		</tr>

		<%
			}
		%>

	</table>
</body>
</html>