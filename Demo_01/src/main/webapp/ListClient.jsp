<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@page import="demo.crud_app.web.connection"%> 
 <%@page import="java.sql.Connection"%>
 <%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>APP</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body class="container">
<%
Connection con = connection.seconnecter();
ResultSet rs = con.createStatement().executeQuery("select * from client");
%>
<div class="topnav" id="myTopnav">
  <a href="Home.html" class="active">Home</a>
  <a href="AddClient.html">Add</a>
  <a href="ListClient.jsp">List</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
<div id="tbl">
<div class="bg-primary text-white text-center"><h1>List Client</h1></div>
<table class="table  table-bordered table-hover">
<tr>
<th>Id</th>
<th>Nom</th>
<th>Prenom</th>
<th>Ville</th>
<th>DELETE</th>
<th>UPDATE</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
<td><%=rs.getInt(1) %></td>
<td><%=rs.getString(2)%></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4)%></td>
<td><a class="btn btn-danger" href="Supprimerclient?id=<%=rs.getInt(1)%>">Delete</a></td>
<td><a class="btn btn-success" href="modifier.jsp?id=<%=rs.getInt(1)%>">Update</a></td>
</tr>
<%
	}
	rs.close();
	con.close();
%>
</table>
</div>
<script src="myscript.js"></script>
</body>		
</html>