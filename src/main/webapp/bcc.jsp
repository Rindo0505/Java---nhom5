<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bảng cửu chương</title>
</head>
<body>
	<%
		String tamn = request.getParameter("txtn");
		int n=0;
		if(tamn!=null)
			n = Integer.parseInt(tamn);
	%>
	<form action="bcc.jsp" method="post">
		n = <input type="number" name="txtn" value="<%=n %>" min="1" max="9">
		<input type="submit" value="Hien thi"><br>
		<%
			for(int i=1;i<=10;i++){
				out.print(i+" x "+n+" = ");
				out.println(n*i+"<br>");
			}
		%>
	</form>
</body>
</html>