<%@page import="Bean.AdminXacNhanbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover">
		<%
		ArrayList<AdminXacNhanbean> ds = (ArrayList<AdminXacNhanbean>) request.getAttribute("ds");
		for(AdminXacNhanbean xn: ds){
		%>
		<tr>
			<td><%=xn.getGia()%></td>
			<td><%=xn.getGia() %></td>
			<td><%=xn.getSoLuongMua() %></td>
			<td><%=xn.getThanhtien() %></td>
			<td><a href="AdminXacNhanController?mct=<%=xn.getMaChiTietHD()%>"> xác nhận</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>