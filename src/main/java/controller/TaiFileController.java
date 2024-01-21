package controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import bo.ViewLichSubo;
import bo.loaibo;
import bo.taifilesachbo;

/**
 * Servlet implementation class TaiFileController
 */
@WebServlet("/TaiFileController")
public class TaiFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaiFileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); // Client gửi dữ liệu lên server bằng utf-8
		response.setCharacterEncoding("utf-8"); // Ngược lại
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
		String dirUrl1 = request.getServletContext().getRealPath("") + File.separator + "image_sach";
		response.getWriter().println(dirUrl1);
		
		taifilesachbo Fbo= new taifilesachbo();
		loaibo lbo = new loaibo();
		
		if(request.getContentLength()<=0) {//Chay lan dau
		try {
			
			String dl = request.getParameter("dl");
			
			
			
			request.setAttribute("dsl",lbo.getloai());
			request.setAttribute("ds", Fbo.getfilesach());
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd= 
				request.getRequestDispatcher("TaiFile.jsp");
		rd.forward(request, response);
		return;
		}
		
		
		try {
			String masach = null, tensach = null, tacgia = null, anh = null, gia = null, ngaynhap = null, maloai = null, soluong = null, sotap = null;

			// Lấy loại về
			request.setAttribute("dsloai", lbo.getloai());
			request.setAttribute("dssach", Fbo.getfilesach());
			
			List<FileItem> fileItems = upload.parseRequest(request);// Lấy về các đối tượng gửi lên
			
			// duyệt qua các đối tượng gửi lên từ client gồm file và các control
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()) {// Nếu ko phải các control=>upfile lên
					// xử lý file
					String nameimg = fileItem.getName();
					if (!nameimg.equals("")) {
						
						// Lấy đường dẫn hiện tại, chủ ý xử lý trên dirUrl để có đường dẫn đúng
						String dirUrl = request.getServletContext().getRealPath("") + File.separator + "image_sach";
						File dir = new File(dirUrl);
						if (!dir.exists()) {// nếu ko có thư mục thì tạo ra
							dir.mkdir();
						}
						
						String fileImg = dirUrl + File.separator + nameimg;
						File file = new File(fileImg);// tạo file
						
						try {
							fileItem.write(file);// lưu file
							anh = "image_sach/" + nameimg;
							System.out.println("UPLOAD THÀNH CÔNG...!");
							System.out.println("Đường dẫn lưu file là: " + dirUrl);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					
				} else// Neu la control
				{
					String tentk = fileItem.getFieldName();
					
					if (tentk.equals("txtms"))
						masach = fileItem.getString();
					
					if (tentk.equals("txtts")) {
						
						tensach = fileItem.getString("utf-8");
					System.out.println(tensach);
//						String tams=URLEncoder.encode(tensach,"utf-8");
//						System.out.println(tams);
						//String tams2=URLDecoder.decode(tensach,"utf-8");
						//System.out.println(tams2);
						
					}
					if (tentk.equals("txttg"))
						tacgia = fileItem.getString("utf-8");
					if (tentk.equals("txtgia"))
						gia = fileItem.getString();
					if (tentk.equals("txtsl"))
						soluong = fileItem.getString();
					if (tentk.equals("txtngaynhap"))
						ngaynhap = fileItem.getString();
					if (tentk.equals("txtst"))
						sotap = fileItem.getString();
					if (tentk.equals("selectml"))
						maloai = fileItem.getString();
				}
			}
			int kq =Fbo.Add(masach, tensach, tacgia, Integer.parseInt(sotap), Long.parseLong(soluong), Long.parseLong(gia), anh, ngaynhap, maloai);
			if(kq == 1)
				request.setAttribute("tb", "Thêm sách thành công!");
			else
				request.setAttribute("tb", "Thêm sách thất bại");
			RequestDispatcher rd = request.getRequestDispatcher("TaiFile.jsp");
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
