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
 * Servlet implementation class DeletCommitBL
 */
@WebServlet("/DeletCommitBL")
public class DeleteCommitBL extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://localhost:3306/ishibashi?serverTimezone=JST";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String PASSWORD2 = "ishi1196";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCommitBL() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//宣言
		Connection connect;
		Statement stmt;
		ResultSet rs;
		String UpdQuery;
		String id;

		//値を取得
		id = request.getParameter("id");
		String tel = request.getParameter("tel");

		//ハイフンをなくす
		tel = (tel.equals("")) ? tel : tel.replace("-", "");

		//SQL文の作成
		UpdQuery = "update `jyusyoroku` set `delete_flg` = '" + 1 + "' where `jyusyoroku`.`id` = " + id + ";";

		try {
			//DBへ接続
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = connect.createStatement();
			stmt.executeUpdate(UpdQuery);

			//接続したDBを閉じる
			stmt.close();
			connect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		//ListBLへ遷移
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
