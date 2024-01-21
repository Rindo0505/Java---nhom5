<%@page import="dao.KetNoi"%>
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
	for (int i = 1; i <= 5; i++) {
		out.print(i);
		out.println("<b>. Trương Bá Thưởng <b><br>");

	}
	%>
	<%=session.getAttribute("Tam")%>
	<%
	KetNoi kn = new KetNoi();
	kn.ketnoi();
	%>
</body>
</html>