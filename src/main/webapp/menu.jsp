<%@page import="Bean.khachhangbean"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="bo.sachbo"%>
<%@page import="Bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<article class="all-browss">


		<%
		request.setCharacterEncoding("utf-8");//client gui dl len server bang utf-8
		response.setCharacterEncoding("utf-8");//ngược lại
		%>
		<%-- <c:out value="${request.setCharacterEncoding("utf-8")}"></c:out>
		<c:out value="${response.setCharacterEncoding("utf-8")}"></c:out> --%>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="sachcontroller">Trang chủ</a></li>
					<li><a href="dathangcontroller">Giỏ hàng</a></li>
					<li><a href="#">Thanh toán</a></li>
					<li><a href="ViewLichSuController">Lịch sử mua hàng</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">

					<%-- <c:choose>
						<c:when test="${sessionScope.dn!= null}">
							<li><a href="#">Xin chào: <c:out
										value="${requestScope.dn}"></c:out></a></li>
							<li><a href="dangxuatcontroller"><span
									class="glyphicon glyphicon-log-in"></span>Đăng xuất</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="dangky.jsp"><span
									class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
							<li><a href="dangnhap.jsp"><span
									class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
						</c:otherwise>
					</c:choose> --%>
					<%
				khachhangbean un = (khachhangbean) session.getAttribute("dn");
				if (un != null) {
				%> 
				<li><a href="#">Xin chào: <%=un.getHoten()%></a></li>
				<li><a href="dangxuatcontroller"><span
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

		<%
		//lấy về danh sách loại
		%>
		<table class="table">
			<tr>
				<td valign="top" width="200">
					<table class="table table-hover">
						<%
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
				<td valign="top" , width="800">Hiển thị sách của loại: <%=request.getParameter("ml")%>
					<table class="table">
						<%
						//lấy về danh sahcs sahcs
						ArrayList<sachbean> ds = (ArrayList<sachbean>) request.getAttribute("dssach");
						int n = ds.size();
						for (int i = 0; i < n; i++) {
							sachbean s = ds.get(i);
						%>
						<tr>
							<td><img src="<%=s.getAnh()%>"> <br> <%=s.getTensach()%><br>
								<%=s.getGia()%><br> <a
								href="dathangcontroller?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>"><img
									src="buynow.jpg"> </a></td>
							<%
							i++;
							if (i < n) {
								s = ds.get(i);
							%>
							<td><img src="<%=s.getAnh()%>"> <br> <%=s.getTensach()%><br>
								<%=s.getGia()%><br> <a
								href="dathangcontroller?ms=<%=s.getMasach()%> &ts= <%=s.getTensach()%>&gia=<%=s.getGia()%>"><img
									src="buynow.jpg"> </a></td>

							<%
							}
							%>
							<%
							}
							%>
						</tr>
					</table>
				<td>Tìm kiếm
					<form action="sachcontroller" method="post">
						<input type="text" name="txttk" class="form-control"><br>
						<input type="submit" name="th" value=" search" class="btn-primary">
					</form>
				</td>
			</tr>
		</table>
		<!--<%@include file = "CreateTable.jsp" %>-->
	</article>
</body>
</html>