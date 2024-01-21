<%@page import="Bean.ViewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<table class="table table-hover">
<div class="container" style="margin-top: 10px" >
		<div style="display: flex;">
			<form action="HienThiController" method="post">
				<input type="text" name="txttk" placeholder="Nhập vào để tìm kiếm">
				<input type="submit" name="th" value="Search"
					class="btn btn-primary">
				<input type="submit" name="un1" value="Trở về"
					class="btn btn-primary">

			</form>

			<div style="display: flex; margin-left: 5px">
			<form action="ThongKeController" method="post">
				<input type="submit" name="un1" value="Thống Kê"
					class="btn btn-primary">
			</form>
			</div>
		</div>
	</div>
	
	<h1 style="color: black;font: 30" align="center"> Lịch Sử Mua Hàng</h1>
	<table class="table table-bordered">
	
	<thead >
	<tr style="text-align: center;">
	<th style="text-align: center;">Mã Khách Hàng</th>
	<th style="text-align: center;">Mã Sách</th>
	<th style="text-align: center;">Tên Sách</th>
	<th style="text-align: center;">Giá</th>
	<th style="text-align: center;">Số Lượng Mua</th>
	<th style="text-align: center;">Thành Tiền</th>
	 
	</tr>
	</thead>
		<%
		ArrayList<ViewBean> ds = (ArrayList<ViewBean>) request.getAttribute("ds");
		for(ViewBean xls: ds){
		%>
		<tr>
			<td><%=xls.getMakh()%></td>
			<td><%=xls.getMaSach() %></td>
			<td><%=xls.getTenSach() %></td>
			<td><%=xls.getGia() %></td>
			<td><%=xls.getSoLuongMua() %></td>
			<td><%=xls.getThanhtien() %></td>

		</tr>
		<%} %>
	</table>
</body>
</html>