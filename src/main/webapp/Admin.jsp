<%@page import="Bean.Filebean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý bán sách</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="input-group input-group-sm mb-3">
		<form method="post" action="AdminController" enctype="multipart/form-data">
			Mã sách <br> <input type="text" name="txtms"> <br>
			Tên sách <br> <input type="text" name="txtts"> <br>
			Tác giả <br> <input type="text" name="txttg"> <br>
			Giá <br> <input type="number" name="txtgia"> <br>
			Số lượng <br> <input type="number" name="txtsl"> <br>
			Ngày nhập <br> <input type="date" name="txtngaynhap"> <br>
			Ảnh <br> <input type="file" name="txtfile"><br> 
			Số tập <br> <input type="number" name="txtst"> <br> 
			Mã loại 
			<select name="selectml">
				<c:forEach items="${dsloai}" var="loai">
					<option>${loai.getMaloai()}</option>
				</c:forEach>
			</select> <br>
			<input type="submit" value="Add">
			<input type="submit" value="Save">
		</form>
		<%
		String tb = (String) request.getAttribute("tb");
		if(tb!=null)
			out.print(tb);
		%>
		<table class="table">
			<tr>
				<thead class="table-success">
					<td>Mã sách</td>
					<td>Tên sách</td>
					<td>Tác giả</td>
					<td>Số tập</td>
					<td>Giá</td>
					<td>Ảnh</td>
					<td>Số lượng</td>
					<td>Ngày nhập</td>
					<td>Chọn</td>
					<td>Xóa</td>
				</thead>
			</tr>
			<c:forEach items="${dssach}" var="sach">
				<tr>
					<td>${sach.getMasach()}</td>
					<td>${sach.getTensach()}</td>
					<td>${sach.getTacgia()}</td>
					<td>${sach.getSotap()}</td>
					<td>${sach.getGia()}</td>
					<td>${sach.getAnh()}</td>
					<td>${sach.getSoluong()}</td>
					<td>${sach.getNgaynhap()}</td>
					<td><input type="button" value="Select"></td>
					<td><input type="button" value="Delete"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>