package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.khachhangbo;

/**
 * Servlet implementation class dangkycontroller
 */
@WebServlet("/dangkycontroller")
public class dangkycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangkycontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String ht = request.getParameter("txtht");
			String dc = request.getParameter("txtdc");
			String sdt = request.getParameter("txtsdt");
			String email = request.getParameter("txte");
			String un = request.getParameter("txtun");
			String pass = request.getParameter("txtpass");
			khachhangbo khbo = new khachhangbo();
			if(ht != null && dc != null && sdt != null && email != null && un!=null && pass!=null){
				if(khbo.Themtaikhoan(ht, dc, sdt, email, un, pass)==1){
					response.sendRedirect("dangnhapcontroller");
					return;
					//Qua về trang menu
				}else{
					//Ngược lại: Hiển thị thông báo
					request.setAttribute("tb", "Tài khoản này đã tồn tại!");
					RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
					rd.forward(request, response);
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
