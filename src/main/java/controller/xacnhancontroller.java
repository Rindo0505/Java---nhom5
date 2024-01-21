package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.giohangbean;
import Bean.khachhangbean;
import bo.chitiethoadonbo;
import bo.giohangbo;
import bo.hoadonbo;

/**
 * Servlet implementation class xacnhancontroller
 */
@WebServlet("/xacnhancontroller")
public class xacnhancontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xacnhancontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// kiem tra dang nhap
		try {
			String xnd =request.getParameter("xnd");
			HttpSession session= request.getSession();
			khachhangbean kh= (khachhangbean)session.getAttribute("dn");
			if(session.getAttribute("dn")==null) {
				response.sendRedirect("dangnhapcontroller");
			}
			else {
				hoadonbo hdbo= new hoadonbo();
				chitiethoadonbo ctbo = new chitiethoadonbo();
				// tao ra them mot hoa don
				hdbo.Them(kh.getMakh());
				long maxhd= hdbo.getMaxHD();
				//them vao bang chi tiet hoa don
				giohangbo gh= (giohangbo)session.getAttribute("gh");
				for(giohangbean h: gh.ds) {
					ctbo.Them(h.getMasach(),h.getSoluongmua(),maxhd);
				}
				
				
				session.removeAttribute("gh");
				response.sendRedirect("sachcontroller");
			}
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
