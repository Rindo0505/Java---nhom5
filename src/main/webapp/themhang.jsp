<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	String ms = request.getParameter("ms");
	String ts = request.getParameter("ts");
	String giatam = request.getParameter("gia");
	if (ms != null && ts != null && giatam != null) {

		// dua hang vao gio
		giohangbo gh = null;
		if (session.getAttribute("gh") == null) {
			//mua lan dau
			gh = new giohangbo();
			session.setAttribute("gh", gh);
		}
		gh = (giohangbo) session.getAttribute("gh");
		gh.Them(ms, ts, Long.parseLong(giatam), (long) 1);
		session.setAttribute("gh", gh);

		response.sendRedirect("htgio.jsp");
	}
	%>
</body>
</html>