package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class testcontroller
 */
@WebServlet("/testcontroller")
public class testcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// tạo ra đối tượng out
		PrintWriter Out= response.getWriter();
		Out.print("<html><body>Alo</body></html>");
		// tạo ra đối tượng session
		HttpSession session= request.getSession();
		session.setAttribute("Tam", "xin chào session");
		
		request.setAttribute("a", (long)10);
		String[] ds = {"hùng","nga","lan","huệ"};
		request.setAttribute("ds", ds);
		
		//chuyển dữ liệu tiếp về trang abc.jsp
		RequestDispatcher rd = request.getRequestDispatcher("abc.jsp?ts=1");
		rd.forward(request, response);
		
		
		//response.sendRedirect("t2.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
