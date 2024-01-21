<%@page import="Tam.CgioHang" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Sửa</title>
</head>
<body>
	<%
	CgioHang g=(CgioHang)session.getAttribute("gh");
	String th= request.getParameter("th");
	String sl= request.getParameter("txtsua");
	g.Them(th, 111, Integer.parseInt(sl));
	session.setAttribute("gh", g);
	response.sendRedirect("DatHang.jsp");
	%>
</body>
</html>