<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%String t= request.getParameter("ts");
	if(t==null)
		t="1";
	%>
	Nội dung của trang:
	<%=t %> <br>
	<table width = "1000" align = "center">
		<tr><td colspan = "3" bgcolor = "blue"> Logo </td></tr>
		<a href="t1.jsp"> Trang 1 </a> <hr>
		<a href="https://student.husc.edu.vn/"> Tín chỉ </a> <hr>
		<a href="bt.docx"> Tải bài giảng </a> <hr>
		<tr>
			<td valign="top" width="200"> Menu 1 </td>
			<td align="top" width="600">
				<img src ="test.jpg" width="200"> <hr>
				<%for(int i=1;i<=20;i++){ %>
					<a href="CreateTable.jsp?ts=<%=i %>"> <%=i %></a>
				<%} %>
			</td>
			<td> Tìm kiếm </td>
		</tr>
		<tr><td colspan = "3">	Bản quyền </td></tr>
	</table>
</body>
</html>