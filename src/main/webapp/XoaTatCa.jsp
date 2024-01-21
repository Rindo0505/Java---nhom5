<%@page import="Tam.CgioHang" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xóa tất cả</title>
</head>
<body>
	<%
	CgioHang g=(CgioHang)session.getAttribute("gh");
	g.XoaTatCa();
	session.setAttribute("gh", g);
	response.sendRedirect("DatHang.jsp");
	%>
</body>
</html>