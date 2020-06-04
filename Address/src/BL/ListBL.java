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

	static final String URL = "jdbc:mysql://localhost:3306/address?serverTimezone=JST";
	static final String USERNAME = "root";
	static final String PASSWORD = "ishi1196";

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
		//response.getWriter().append("Served at: ").append(request.getContextPath());

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

			connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = connect.createStatement();
			CntQuery = "select count(*) as cnt from jyusyoroku;";
			rs = stmt.executeQuery(CntQuery);
			rs.next();
			listCnt = rs.getInt("cnt");

			if (senarq == null) {
				SelectQuery = "select id,name,address,tel,categoryname from jyusyoroku join category on jyusyoroku.categoryid = category.categoryid where delete_flg = 0 limit "
						+ limitSta + ";";
			} else {
				SerchName = "%" + senarq + "%";
				SelectQuery = "select id,name,address,tel,categoryname from jyusyoroku join category on jyusyoroku.categoryid = category.categoryid where delete_flg = 0 address like "
						+ SerchName + " limit " + limitSta + ";";
			}
			rs = stmt.executeQuery(SelectQuery);

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
