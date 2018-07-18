<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DateTime"%>
<%@page import="util.ConnectDB"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging Out</title>
</head>
<body>
</body>
</html>
<%
String email=(String)session.getAttribute("email");
if(email==null)
{
	response.sendRedirect("index.jsp");
}
else
{
	session.invalidate();
	String date=DateTime.getInstance().getDate()+"+"+DateTime.getInstance().getTime();
	try
	{
		PreparedStatement ps=ConnectDB.getInstance().getConnection().prepareStatement("update user_details set last_login=? where email='"+email+"'");
		ps.setString(1, date);
		ps.executeUpdate();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	response.sendRedirect("index.jsp");
}
%>