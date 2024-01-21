<%@page import="Bean.Filebean"%>
<%@page import="Bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="java.security.acl.LastOwnerException"%>
<%@page import="bo.ViewLichSubo"%>
<%@page import="Bean.ViewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

		<div class="input-group input-group-sm mb-3">
		<form method="post" action="TaiFileController" enctype="multipart/form-data">
				Mã sách <br> <input type="text" name="txtms"> <br>
			Tên sách <br> <input type="text" name="txtts"> <br>
			Tác giả <br> <input type="text" name="txttg"> <br>
			Giá <br> <input type="number" name="txtgia"> <br>
			Số lượng <br> <input type="number" name="txtsl"> <br>
			Ngày nhập <br> <input type="date" name="txtngaynhap"> <br>
			Số tập <br> <input type="number" name="txtst"> <br> 

			<div class="form-floating mb-3 mt-3">
				file<input type="file" name="txtfile"><br> 
				Mãloại <select name="selectml" class="form-select-sm mt-3 mb-3" aria-label="Default select example">
				
					<%
					ArrayList<loaibean> dsl = (ArrayList<loaibean>) request.getAttribute("dsl");
					for (loaibean dsml : dsl ){ %>
					<option><%=dsml.getMaloai()%></option>
					<%} %>
				</select><br>
				
				<button type="submit" class="btn btn-primary">Add</button>
				<button type="submit" class="btn btn-primary">Save</button>
			</div>

		</form>
	</div>
	<%
		String tb = (String) request.getAttribute("tb");
		if(tb!=null)
			out.print(tb);
		%>
<table class="table table-bordered">
	
	<thead >
	<tr style="text-align: center;">
	<th style="text-align: center;">Mã Sách</th>
	<th style="text-align: center;">Tên Sách</th>
	<th style="text-align: center;">Số Lượng</th>
	<th style="text-align: center;">Giá</th>
	<th style="text-align: center;">Mã Loại</th>
	<th style="text-align: center;">Số Tập</th>
	<th style="text-align: center;">Ảnh</th>
	<th style="text-align: center;">Ngày Nhập</th>
	<th style="text-align: center;">Tác Giả</th>
	 
	</tr>
	</thead>
		<%
		
		ArrayList<Filebean> ds = (ArrayList<Filebean>) request.getAttribute("ds");
		for(Filebean dlf: ds){
		%>
		<tr>
			<td><%=dlf.getMasach()%></td>
			<td><%=dlf.getTensach() %></td>
			<td><%=dlf.getSoluong() %></td>
			<td><%=dlf.getGia()%></td>
			<td><%=dlf.getMaloai() %></td>
			<td><%=dlf.getSotap() %></td>
			<td><%=dlf.getAnh()%></td>
			<td><%=dlf.getNgaynhap() %></td>
			<td><%=dlf.getTacgia()%></td>
			<td><input type="button" value="Select"></td>
			<td><input type="button" value="Delete"></td>
			
		</tr>
		<%} %>
	</table>
</body>
</html>