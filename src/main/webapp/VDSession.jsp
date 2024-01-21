<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ví dụ session</title>
</head>
<body> 
	<%
	//Kiểm tra xem đã tạo biến session chưa
	if(session.getAttribute("ss")==null)
			session.setAttribute("ss", (int) 0);
	String tamn = request.getParameter("txtn");
	if(tamn!=null){
		int n= Integer.parseInt(tamn);
		//B1: Gán session vào biến
		int s=(int)session.getAttribute("ss");
		//B2: Thay đổi biến
		s=s+n;
		//B3: Gán biến vào session
		session.setAttribute("ss", s);
	}
	%>
	<form action="VDSession.jsp" method="post">
		n = <input type="number" name="txtn" value="0">
		<input type="submit" value="Hien thi"><br>
	</form>
	Tổng: <%=session.getAttribute("ss")%>
</body>
</html>