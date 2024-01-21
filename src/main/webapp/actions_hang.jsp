<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bo.giohangbo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		File gồm các chức năng sau:
		- Cập nhật số lượng
		- Xóa 1 mặt hàng
		- Xóa checkbox
	 -->
	<%
	
	String suaBtn = request.getParameter("btnsua");
	String sl = request.getParameter(suaBtn);
	
	String xoaBtn = request.getParameter("btnxoa");
	
	String[] ds = request.getParameterValues("c1");

	giohangbo gh = null;
	
	if (suaBtn != null && sl != null) {
			gh = (giohangbo) session.getAttribute("gh");
			gh.CapNhatSL(suaBtn, Long.parseLong(sl));
	} 
	
	if (xoaBtn != null) {
		gh = (giohangbo) session.getAttribute("gh");
		gh.Xoa(xoaBtn);
	}
	
	if (ds != null) {
		gh = (giohangbo) session.getAttribute("gh");
		for (String item : ds) {
			gh.Xoa(item);
		}
	}

	session.setAttribute("gh", gh);

	response.sendRedirect("htgio.jsp");
	%>
</body>
</html>