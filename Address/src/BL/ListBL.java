package BL;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListBL
 */
@WebServlet("/ListBL")
public class ListBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String URL = "jdbc:mysql://localhost:3306/ishibashi?serverTimezone=JST";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String PASSWORD2 = "ishi1196";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListBL() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String pagerq = request.getParameter("page");
		String senarq = request.getParameter("SerchName");

		Connection connect;
		Statement stmt;
		ResultSet rs = null;
		int listCnt = 0;
		String SelectQuery;
		String CntQuery;
		String nowPage;
		String SerchName;
		int limitSta;

		try {
			nowPage = pagerq == null ? "1" : pagerq;
			limitSta = (Integer.parseInt(nowPage) - 1) * 10;
			request.setCharacterEncoding("UTF-8");

			Class.forName("com.mysql.cj.jdbc.Driver");

			connect = DriverManager.getConnection(URL, USERNAME, PASSWORD2);
			stmt = connect.createStatement();
			CntQuery = "select count(*) as cnt from jyusyoroku;";
			rs = stmt.executeQuery(CntQuery);
			rs.next();
			listCnt = rs.getInt("cnt");
			rs.close();

			if (senarq == null) {
				SelectQuery = "select id,name,address,tel,categoryname from jyusyoroku join category on jyusyoroku.categoryid = category.categoryid where delete_flg = 0  order by id asc limit "
						+ limitSta + "," + 10 + ";";
			} else {
				SerchName = "%" + senarq + "%";
				SelectQuery = "select id,name,address,tel,categoryname from jyusyoroku join category on jyusyoroku.categoryid = category.categoryid where delete_flg = 0 order by id asc address like "
						+ SerchName + " limit " + limitSta + "," + 10 + ";";
			}
			rs = stmt.executeQuery(SelectQuery);
			//			rs.next();
			//			StringBuilder sb = new StringBuilder(rs.getString("tel"));
			//			sb.insert(3, "-");
			//			sb.insert(8, "-");
			//リクエストの追加
			request.setAttribute("ListCnt", listCnt);
			request.setAttribute("Result", rs);
			request.setAttribute("page", nowPage);

			getServletContext().getRequestDispatcher("/List.jsp").forward(request, response);

			rs.close();
			stmt.close();
			connect.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
