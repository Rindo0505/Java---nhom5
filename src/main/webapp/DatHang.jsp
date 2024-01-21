<%@page import="Tam.CgioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container mt-3">
		<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		%>
		<div class="w-25 border rounded p-3 color">
			<form action="DatHang.jsp" method="post">
				<h5>Tên hàng</h5> <input type="text" name="txtth" class="form-control" required><br>
				<h5>Giá</h5> <input type="text" name="txtgia" class="form-control" required><br>
				<h5>Số lượng</h5> <input type="text" name="txtsl" class="form-control" required><br>
				<input type="submit" name="un1" value="Đặt hàng" class="btn btn-primary">
			</form>
		</div>
		<h2 >Giỏ hàng</h2> 
		<%
		String th=request.getParameter("txtth");
		String gia=request.getParameter("txtgia");
		String sl=request.getParameter("txtsl");
		if(th!=null && gia!=null && sl!=null){
			CgioHang g= new CgioHang();
			//Nếu mua hàng lần đầu
			if(session.getAttribute("gh")==null){
				session.setAttribute("gh", g);//Tao gio
			}
			//Gán session: gh vào biến: g
			g=(CgioHang)session.getAttribute("gh");
			//Thêm giỏ hàng vào biến: g
			g.Them(th, Integer.parseInt(gia), Integer.parseInt(sl));
			//Lưu biến vào session
			session.setAttribute("gh", g);
		}
		//Hiển thị đồ trong session: gh
		if(session.getAttribute("gh")!=null){
			CgioHang g= new CgioHang();
			g=(CgioHang)session.getAttribute("gh");
			int sh=g.ds.size();%>
			<div>
			<form method="post" action="XoaTatCa.jsp">
				<input type="submit" name="xoatc" value="Xóa tất cả" class="btn btn-primary mb-2">
			</form>
			<form method="post" action="XoaChonLoc.jsp">
				<input type="submit" name="xoachonloc" value="Xóa hàng được chọn" class="btn btn-primary mb-2">
				<table border="1" width="100%" class="table">
				<thead class="table-success">
			      <tr class="text-center">
			        <th>Tên hàng</th>
			        <th>Giá</th>
			        <th>Số lượng</th>
			        <th></th>
			        <th>Tổng</th>
			      </tr>
			    </thead>
				<%for(int i=0;i<sh;i++){ %>
				<tr Align="middle">
					<td><%=g.ds.get(i).getTenhang() %></td>
					<td><%=g.ds.get(i).getGia() %></td>
					<td>
						<form></form>
						<p class="sl"><%=g.ds.get(i).getSoluong() %></p>
						<div class="btn-group">
						<form method="post" action="Sua.jsp?th=<%=g.ds.get(i).getTenhang()%>">
							<input type="text" name="txtsua" required>
							<input type="submit" name="tt" value="Sửa" class="btn btn-warning m-1">
						</form>
						<form method="post" action="Xoa.jsp?th=<%=g.ds.get(i).getTenhang()%>">
							<input type="submit" name="xxx" value="Xóa" class="btn btn-warning m-1">
						</form>
						</div>
					</td>
					<td><input name="XoaSelected" type="checkbox" value="<%=g.ds.get(i).getTenhang()%>"></td>
					<td><%=g.ds.get(i).getThanhtien()%></td>
				</tr>
				<%} %>
				</table>
			</form>
			</div>
			<div align="right" style="color: blue; font-weight: 700">Tổng tiền: <%=g.Tongtien() %></div>
		<%} %>
	</div>
</body>
</html>