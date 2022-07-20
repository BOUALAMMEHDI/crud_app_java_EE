<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="demo.crud_app.web.connection"%> 
 <%@page import="java.sql.Connection"%>
  <%@page import="java.sql.PreparedStatement"%>
  <%@page import="java.sql.Statement"%>
 <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>APP</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body class="container">
<%
Connection con = connection.seconnecter();
int id = Integer.parseInt(request.getParameter("id"));
ResultSet rs = con.createStatement().executeQuery("select * from client where id like '"+id+"'");
%>
<div class="topnav" id="myTopnav">
  <a href="Home.html" class="active">Home</a>
  <a href="AddClient.html">Add</a>
  <a href="ListClient.jsp">List</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
<%
	while(rs.next())
	{
	%>

<form action="Edit?id=<%=rs.getInt(1)%>" method="post" class="form card" id="frm">
<table class="table table-hover">
<tr>
<td>Id</td>
<td><input type="text" name="id" id="txt" disabled value="<%=rs.getInt(1)%>"></td>
</tr>
<tr>
<td>Nom</td>
<td><input type="text" name="nom" id="txt" value="<%=rs.getString(2)%>"></td>
</tr>
<tr>
<td>Prenom</td>
<td><input type="text" name="prenom" id="txt" value="<%=rs.getString(3)%>"></td>
</tr>
<tr>
<td>Ville</td>
<td><input type="text" name="ville" id="txt" value="<%=rs.getString(4)%>"></td>
</tr>
<tr>
<td><Button type="submit" class="btn btn-primary">UPDATE</Button></td>
</tr>
</table>
</form>
<%
	}
	rs.close();
	con.close();
%>
</body>
</html>
