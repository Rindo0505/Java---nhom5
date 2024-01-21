package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;
import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class dathangcontroller
 */
@WebServlet("/dathangcontroller")
public class dathangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dathangcontroller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			request.setCharacterEncoding("utf-8");// client gui dl len server bang utf-8
			response.setCharacterEncoding("utf-8");// ngược lại

			String suaBtn = request.getParameter("btnsua");
			String sl = request.getParameter(suaBtn);

			String xoaBtn = request.getParameter("btnxoa");

			String[] ds = request.getParameterValues("c1"); // checkbox

			giohangbo gh = null;

			loaibo lbo = new loaibo();
			sachbo sbo = new sachbo();

			request.setAttribute("dsloai", lbo.getloai());

			HttpSession session = request.getSession();

			String ms = request.getParameter("ms");
			String ts = request.getParameter("ts");
			String giatam = request.getParameter("gia");
			if (ms != null && ts != null && giatam != null) {

				if (session.getAttribute("gh") == null) {
					// mua lan dau
					gh = new giohangbo();
					session.setAttribute("gh", gh);
				}
				gh = (giohangbo) session.getAttribute("gh");
				gh.Them(ms, ts, Long.parseLong(giatam), (long) 1);
				session.setAttribute("gh", gh);
			}

			if (suaBtn != null && sl != null) {
				gh = (giohangbo) session.getAttribute("gh");
				gh.CapNhatSL(suaBtn, Long.parseLong(sl));
			}

			if (xoaBtn != null) {
				gh = (giohangbo) session.getAttribute("gh");
				gh.Xoa(xoaBtn);
			}

			if (ds != null) {
				gh = (giohangbo) session.getAttribute("gh");
				for (String item : ds) {
					gh.Xoa(item);
				}
			}

			session.setAttribute("gh", gh);

			response.sendRedirect("hienthicontroller");

		} catch (Exception e) {
			e.printStackTrace();
		}
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
