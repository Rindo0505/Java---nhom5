<%@page import="Bean.khachhangbean"%>
<%@page import="Bean.giohangbean"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="bo.sachbo"%>
<%@page import="Bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");//client gui dl len server bang utf-8
	response.setCharacterEncoding("utf-8");//ngược lại
	%>
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
			<ul class="nav navbar-nav navbar-right">
				<%
				khachhangbean un = (khachhangbean) session.getAttribute("dn");
				if (un != null) {
				%>
				<li><a href="#">Xin chào: <%=un.getHoten()%></a></li>
				<li><a href="dangxuat.jsp"><span
						class="glyphicon glyphicon-log-in"></span>Đăng xuất</a></li>
				<%
				} else {
				%>
				<li><a href="dangky.jsp"><span
						class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
				<li><a href="dangnhap.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>



	<table class="table">
		<tr>
			<td valign="top" width="200">
				<table class="table table-hover">
					<%
					/* for (loaibean l : lbo.getloai()) */
					ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
					for (loaibean l : dsloai) {
					%>
					<tr>
						<td><a href="sachcontroller?ml=<%=l.getMaloai()%>"><%=l.getTenloai()%></a>
						</td>
					</tr>
					<%
					}
					%>


				</table>
			</td>
			<td valign="top" width="1000">Hiển thị gio hang:
				<form method="post" action="dathangcontroller">

					<input class="btn btn-danger" type="submit" name="xoachon"
						value="Xóa chọn">

					<table class="table">
						<%
						giohangbo gh = (giohangbo) session.getAttribute("gh");
						if (gh != null) {
							for (giohangbean g : gh.ds) {
						%>
						<tr>

							<td><%=g.getMasach()%></td>
							<td><%=g.getTensach()%></td>
							<td><%=g.getGia()%></td>
							<td><%=g.getSoluongmua()%></td>
							<td><%=g.getThanhtien()%></td>
							<td><input type="number" name="<%=g.getMasach()%>" value="0">
								<button class="btn btn-warning text-light" type='submit'
									name='btnsua' value='<%=g.getMasach()%>'>Cập nhật</button></td>
							<td>
								<button class="btn btn-danger text-light" type='submit'
									name='btnxoa' value='<%=g.getMasach()%>'>Trả lại</button>
							</td>
							<td class="text-center align-middle"><input type="checkbox"
								name="c1" value="<%=g.getMasach()%>"></td>

						</tr>
						<%
						}
						%>

					</table>
				</form>
				<form  method="post" action="xacnhancontroller">
				<input type="submit" name="txtxacnhan " value="xac nhan mua"
				class="btn-primary">
				</form>
				<div align="right" style="color: blue; font-weight: 700">
					Tổng tiền:
					<%=gh.Tongtien()%></div> <%
 }
 %>


			</td>
			<td>Tìm kiếm
				<form action="sachcontroller" method="post">
					<input type="text" name="txttk" class="form-control"><br>
					<input type="submit" name="th" value=" search" class="btn-primary">
				</form>
			</td>
		</tr>
	</table>


	<!--<%@include file = "CreateTable.jsp" %>-->
</body>
</html>