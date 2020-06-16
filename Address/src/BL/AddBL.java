package BL;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Common.Common;

/**
 * Servlet implementation class AddBL
 */
@WebServlet("/AddBL")
public class AddBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBL() {
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

		//宣言
		String name;
		String address;
		String tel;
		String categoryid;
		String errmsg;

		//値の代入
		name = request.getParameter("name");
		address = request.getParameter("address");
		tel = request.getParameter("tel");
		categoryid = request.getParameter("categoryid");
		errmsg = Common.getErr(name, address, tel);

		//値のセット
		request.setAttribute("name", name);
		request.setAttribute("address", address);
		request.setAttribute("tel", tel);
		request.setAttribute("categoryid", categoryid);
		request.setAttribute("errmsg", errmsg);

		//画面推移
		if (errmsg.equals("")) {
			//何もエラーがない場合確認画面へ
			getServletContext().getRequestDispatcher("/AddCheck.jsp").forward(request, response);
		} else {
			//エラーがあったらもう一度入力しなおしてもらう
			getServletContext().getRequestDispatcher("/Add.jsp").forward(request, response);
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
