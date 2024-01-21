<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	giá trị của session<%=session.getAttribute("Tam")%><hr>
	giá trị của các biến request:
	<br> a=<%=request.getAttribute("a")%>
	<%
	String[] ds = (String[]) request.getAttribute("ds");
	for (String pt : ds)
		out.print(pt);
	%>
</body>
</html>