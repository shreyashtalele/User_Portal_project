<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<center>
<h1>USER INFORMATION</h1>
<table border='5' cellpadding="20">
<tr>
<th>USER ID</th>
<th>USERNAME</th>
<th>NAME</th>
<th>LAST NAME</th>
<th>PASSWORD</th>
</tr>

<tr>
<td><%= session.getAttribute("id") %></td>
<td><%= session.getAttribute("uname") %></td>
<td><%= session.getAttribute("name") %></td>
<td><%= session.getAttribute("lname") %></td>
<td><%= session.getAttribute("password") %></td>
</tr>
</table>

</center>

</body>
</html>