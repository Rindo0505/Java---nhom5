package controller;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.khachhangbean;
import bo.khachhangbo;
import dao.khachhangdao;

/**
 * Servlet implementation class dangnhapcontroller
 */
@WebServlet("/dangnhapcontroller")
public class dangnhapcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public dangnhapcontroller() {
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
				khachhangbean khbean= new khachhangbean();
				khachhangdao khdao= new khachhangdao();
				khachhangbo khbo= new khachhangbo();
				HttpSession session=request.getSession();
				// Lấy về un, pass
				String un = request.getParameter("txtun");
				String pass = request.getParameter("txtpass");
				// Nếu un="abc" và pass="123"
				//for (khachhangbean kh : khbo.getkhachhang()) {
					
				//}
				if(un!=null && pass!=null){
					khachhangbean kh = khbo.getkhachhang(un, pass);
					
					if(kh != null){
						//Tạo ra 1 session tên là dn, gán un vào session
						session.setAttribute("dn", khbo.getkhachhang(un, pass));
						response.sendRedirect("sachcontroller");
						return;
						//Qua về trang menu
					} else {
						
						request.setAttribute("kt", "dns");
						RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
						rd.forward(request, response);
						return;
					}
					
				}
				
				RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
				rd.forward(request, response);
	
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
