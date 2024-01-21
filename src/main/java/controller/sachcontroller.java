package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.sachbean;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class sachcontroller
 */
@WebServlet("/sachcontroller")
public class sachcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sachcontroller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// lấy loại và sách về
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			loaibo lbo = new loaibo();
			sachbo sbo = new sachbo();
			// đọc thêm JSTL của java
			// lấy loại về
			request.setAttribute("dsloai", lbo.getloai());
			String maloai = request.getParameter("ml");
			String key = request.getParameter("txttk");


			ArrayList<sachbean> ds = sbo.getsach();
			if (maloai != null)// kich ben trai
				ds = sbo.TimMa(maloai);
			else if (key != null)
				ds = sbo.Tim(key);
			request.setAttribute("dssach", ds);
			// chuyển về loai và sách sang trang menu.jsp
			RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}

		// chuyển loại và sách sang trang menu.jsp

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
