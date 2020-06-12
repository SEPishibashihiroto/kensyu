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
 * Servlet implementation class AddCommitBL
 */
@WebServlet("/AddCommitBL")
public class AddCommitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://localhost:3306/ishibashi?serverTimezone=JST";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String PASSWORD2 = "ishi1196";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCommitBL() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connect;
		Statement stmt;
		ResultSet rs;
		String InsQuery;
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String categoryid = request.getParameter("categoryid");

		tel = tel.replace("-", "");

		InsQuery = "insert into `jyusyoroku` (`id`, `name`, `address`, `tel`, `categoryid`, `delete_flg`) values (null, '"
				+ name + "', '" + address + "', '" + tel + "', '" + categoryid + "', '0');";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect = DriverManager.getConnection(URL, USERNAME, PASSWORD2);
			stmt = connect.createStatement();
			stmt.executeUpdate(InsQuery);

			stmt.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		getServletContext().getRequestDispatcher("/ListBL").forward(request, response);
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
