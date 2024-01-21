<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">WebSiteName</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="sachcontroller">Trang chủ</a></li>
	      <li><a href="giohangcontroller">Giỏ hàng</a></li>
	      <li><a href="#">Thanh toán</a></li>
	      <li><a href="#">Lịch sử mua hàng</a></li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="dangkycontroller"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
	      <li><a href="dangnhapcontroller"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
	    </ul>
	  </div>
	</nav>
	<%
		String tb = (String) request.getAttribute("tb");
		if(tb!=null)
			out.print(tb);
	%>
	<form action="dangkycontroller" method="post">
		<div>
	            <label>Họ tên: </label> <br/>
	            <input type="text" name="txtht">
	        </div>
	        <div class="mt-2">
	            <label>Địa chỉ: </label> <br/>
	            <input type="text" name="txtdc">
	        </div>
	        <div>
	            <label>Số điện thoại: </label> <br/>
	            <input type="text" name="txtsdt">
	        </div>
	        <div class="mt-2">
	            <label>Email: </label> <br/>
	            <input type="email" name="txte">
	        </div>
	        <div>
	            <label>Tên đăng nhập: </label> <br/>
	            <input type="text" name="txtun">
	        </div>
	        <div class="mt-2">
	            <label>Mật khẩu: </label> <br/>
	            <input type="password" name="txtpass">
	        </div><br>
	        <div class="mt-2">
	        	<input type="submit" value="Đăng ký">
	        </div>
	</form>

</body>
</html>