<%@page import="java.sql.Statement"%>
<%@page import="util.ConnectDB"%>
<%
String email=(String)session.getAttribute("email");
if(email==null)
{
	response.sendRedirect("index.jsp");
}
else
{	String em=request.getParameter("em");
if(em.equals(email))
{
	session.invalidate();
	Statement s=ConnectDB.getInstance().getConnection().createStatement();
	s.execute("delete from user_details where email='"+email+"'");
}
	response.sendRedirect("index.jsp");
}
%>