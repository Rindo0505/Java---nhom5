<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">WebSiteName</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="giohangcontroller">Trang chủ</a></li>
	      <li><a href="giohang.jsp">Giỏ hàng</a></li>
	      <li><a href="#">Thanh toán</a></li>
	      <li><a href="#">Lịch sử mua hàng</a></li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	    	<%
	    	String un=(String)session.getAttribute("dn");
	    		if(un!=null){
	    	%>
	    	<li><a href="#">Xin chào: <%=un %></a></li>
	    	<li><a href="dangxuat.jsp">
	    		<span class="glyphicon glyphicon-log-in"></span>
	    		Đăng xuất</a></li>	
	    	<%}else{%>
	      <li><a href="dangky.jsp"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
	      <li><a href="dangnhap.jsp"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
	      <%}%>
	    </ul>
	  </div>
	</nav>
</body>
</html>