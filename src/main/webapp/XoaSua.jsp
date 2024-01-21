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
	String[] ds = request.getParameterValues("c1");
	out.print("danh sách các mã sách vừa chọn: ");
	if (ds != null)
		for (String pt : ds) {
			out.print(pt + "<br>");
		}
	String ms = request.getParameter("but1");
	String slsua = request.getParameter(ms);
	out.print(ms + ":" + slsua);
	%>
</body>
</html>