package BL;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Common.Common;

/**
 * Servlet implementation class EditBL
 */
@WebServlet("/EditBL")
public class EditBL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditBL() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//宣言
		String id;
		String name;
		String address;
		String tel;
		String categoryid;
		String errmsg;

		//値を取得
		id = request.getParameter("id");
		name = request.getParameter("name");
		address = request.getParameter("address");
		tel = request.getParameter("tel");
		categoryid = request.getParameter("categoryid");
		errmsg = Common.getErr(name, address, tel);

		//値をセット
		request.setAttribute("id", id);
		request.setAttribute("name", name);
		request.setAttribute("address", address);
		request.setAttribute("tel", tel);
		request.setAttribute("categoryid", categoryid);
		request.setAttribute("errmsg", errmsg);

		if (errmsg.equals("")) {
			//エラーが無ければEditCheckへ遷移
			getServletContext().getRequestDispatcher("/EditCheck.jsp").forward(request, response);
		} else {
			//エラーがあったらもう一度入力する
			getServletContext().getRequestDispatcher("/Edit.jsp").forward(request, response);
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
