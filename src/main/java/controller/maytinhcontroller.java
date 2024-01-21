package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class maytinhcontroller
 */
@WebServlet("/maytinhcontroller")
public class maytinhcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public maytinhcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tama=request.getParameter("txta");
		String tamb=request.getParameter("txtb");
		String butc=request.getParameter("butc");
		String butt=request.getParameter("butt");
		String butn=request.getParameter("butn");
		String butchia=request.getParameter("butchia");
		int a=0, b=0, kq=0;
		if(tama!=null && tamb!=null){
			a= Integer.parseInt(tama);
			b= Integer.parseInt(tamb);
		}
		if(butc!=null)
			kq = a+b;
		if(butt!=null)
			kq = a-b;
		if(butn!=null)
			kq = a*b;
		if(butchia!=null)
			kq = a/b;
		request.setAttribute("a", a);
		request.setAttribute("b", b);
		request.setAttribute("kq", kq);
		RequestDispatcher rd = request.getRequestDispatcher("maytinh.jsp");
		rd.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
