
<%@page import="Bean.khachhangbean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	String un1 = request.getParameter("txtun");
	String pass = request.getParameter("txtpass");
	%>
	<%-- <%
	//Lấy về un, pass
	String un = request.getParameter("txtun");
	String pass = request.getParameter("txtpass");
	//Nếu un="abc" và pass="123"
	if(un!=null && pass!=null){
		if(un.equals("abc") && pass.equals("123")){
			//Tạo ra 1 session tên là dn, gán un vào session
			session.setAttribute("dn", un);
			response.sendRedirect("menu.jsp");
			//Qua về trang menu
		}else{
			//Ngược lại: Hiển thị thông báo
			out.print("Sai tên đăng nhập hoặc mật khẩu!");
		}
	}
	%>	 --%>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">WebSiteName</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="sachcontroller">Trang chủ</a></li>
				<li><a href="dathangcontroller">Giỏ hàng</a></li>
				<li><a href="#">Thanh toán</a></li>
				<li><a href="#">Lịch sử mua hàng</a></li>
			</ul>
			<%-- <ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.dn != null}">
						<li><a href="#">Xin chào: <%=un%></a></li>
						<li><a href="dangxuat.jsp"><span
								class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="dangky.jsp"><span
								class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
						<li><a href="dangnhapcontroller"><span
								class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
					</c:otherwise>

				</c:choose>
			</ul> --%>
			 <ul class="nav navbar-nav navbar-right">
				<%
				khachhangbean un = (khachhangbean) session.getAttribute("dn");
				if (un != null) {
				%>
				<li><a href="#">Xin chào: <%=un.getHoten()%></a></li>
				<li><a href="dangxuat.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
				<%
				} else {
				%>
				<li><a href="dangky.jsp"><span
						class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
				<li><a href="dangnhapcontroller"><span
						class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
				<%
				}
				%>
			</ul> 
		</div>
	</nav>
	<form action="dangnhapcontroller" method="post">
		Username =<input type="text" name="txtun"> <br> Password
		=<input type="password" name="txtpass"><br> <input
			type="submit" name="th" value="Đăng nhập">
	</form>
	<%-- <c:choose>
	<c:when test="${requestScope.kt!=null}">
	<c:out value="<script>alert('thong tin khong hop le')</script>"></c:out>
	</c:when>
	</c:choose> --%>
	 <%if (request.getAttribute("kt") != null)
		out.print("thong tin khong hop le");
	%> 
</body>
</html>