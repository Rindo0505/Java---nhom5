<%@page import="java.util.Calendar"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả xổ số kiến thiết</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	Calendar c= Calendar.getInstance(); //Lay ngay gio he thong
	int ngay=c.get(Calendar.DAY_OF_MONTH);
	int thang=c.get(Calendar.MONTH)+1;
	int nam=c.get(Calendar.YEAR);
	int ngayct=c.get(Calendar.DAY_OF_MONTH);
	int thangct=c.get(Calendar.MONTH)+1;
	int namct=c.get(Calendar.YEAR);
	String tamsn = request.getParameter("sn");
	String tamst = request.getParameter("st");
	String tamsnm = request.getParameter("snm");
	
	int sn=ngay, st=thang, snm=nam;
	if(tamsn!=null && tamst!=null && tamsnm!=null){
		sn = Integer.parseInt(tamsn);
		st = Integer.parseInt(tamst);
		snm = Integer.parseInt(tamsnm);
	}
	ngay=sn;
	thang=st;
	nam=snm;
	%>
	<div Align = "right" style = "color: red">
		<b>Hôm nay, ngày <%=ngayct %> tháng <%=thangct %> năm <%=namct %></b>
	</div>
	<b>
	<form action="xoso.jsp" method="post">
		Chọn ngày
		<select name="sn">
			<%
			for(int i=1; i<=31;i++){
			%>	<%
				if(i==ngay){
				%>
					<option selected> <%=i %></option>
				<%
				}else{
				%>
					<option><%=i %></option>
			<%
				}
			}
			%>
		</select>
		Chọn tháng
		<select name="st">
			<%
			for(int i=1; i<=12;i++){
			%>	<%
				if(i==thang){
				%>
					<option selected> <%=i %></option>
				<%
				}else{
				%>
					<option><%=i %></option>
			<%
				}
			}
			%>
		</select>
		Chọn năm
		<select name="snm">
			<%
			for(int i=namct-10; i<=namct;i++){
			%>	<%
				if(i==nam){
				%>
					<option selected> <%=i %></option>
				<%
				}else{
				%>
					<option><%=i %></option>
			<%
				}
			}
			%>
		</select>
		<input type="submit" value="Xem kết quả" class="btn btn-primary">
		<!-- Hiện d m y hiện tại, hiện kết quả, hiện kq xổ số-->
	</form>
	</b>
	<%
		if(snm<namct){
			Random r = new Random();
			out.print("Kết quả xổ số: Ngày "+sn+" tháng "+st+" năm "+snm+"<br>");
			out.print(r.nextInt(100));
		}
		else if(sn<=ngayct && st<=thangct && snm==namct){
			Random r = new Random();
			out.print("Kết quả xổ số: Ngày "+sn+" tháng "+st+" năm "+snm+"<br><br>");
			out.print("<b>"+r.nextInt(100)+"</b>");
		}
		else{
			out.print("Ngày vừa chọn không hợp lệ, vui lòng chọn lại!");
		}	
	%>
</body>
</html>