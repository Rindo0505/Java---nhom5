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
	<%
	int a=0,b=0,kq=0;
	a= (int) request.getAttribute("a");
	b= (int) request.getAttribute("b");
	kq= (int) request.getAttribute("kq");
	%>
	<form action="maytinhcontroller" method="post">
		a = <input type="number" name="txta" value=<%=a %>> <br>
		b = <input type="number" name="txtb" value=<%=b %>> <br>
		kq = <input readonly type="number" name="txtkq" value=<%=kq %>> <br>
		<input type="submit" name="butc" value="+" class="btn btn-primary">
		<input type="submit" name="butt" value="-" class="btn btn-secondary">
		<input type="submit" name="butn" value="*" class="btn btn-success">
		<input type="submit" name="butchia" value="/" class="btn btn-danger">
	</form>
</body>
</html>