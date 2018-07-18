<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.ConnectDB"%>
<%
String email=(String)session.getAttribute("email");
if(email!=null)
{
	response.sendRedirect("home.jsp");
}
else
{	String ema="";
	String url=request.getParameter("url");
	if(url==null)
	{
		response.sendRedirect("index.jsp");
	}
	else
	{
		try
		{
			Connection con=ConnectDB.getInstance().getConnection();
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select email from sent_links where url='"+url+"' and reason='forget_password'");
			if(!rs.isBeforeFirst())
			{
				response.sendRedirect("index.jsp");
			}
			else
			{
				rs.next();
				ema=rs.getString(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
function checkPass()
{
	var pswd=$("#password").val();
	var cpswd=$("#c_password").val();
	if(pswd===cpswd)
		{
		return true;
		}
	else
		{
		alert("Password doesn't match !!");
		return false;
		}
	
}
function changep()
{
	if(checkPass())
	{ $("#changep_button").attr("disabled", "disabled");
		$.post("Changepass",
   {
	em:'<%=ema%>',
     pswd:$("#password").val(),
     cpswd:$('#c_password').val()
   },
   function(data,status){
   	if(status=="success")
   		{
   			if(data==="password")
				{
				document.getElementById("notify_status").innerHTML="Passwords doesn't match";
		        document.getElementById("password").focus();
		        $("#changep_button").removeAttr("disabled");
				}
   			
   			if(data==="changed")
   				{
   					alert('Your Password is Successfully changed.You may login now.');
   					window.location="index.jsp";
   				}
   			else
   				{
   					document.getElementById("notify_status").innerHTML="Sorry some Error Occured.Please try again later";
   					
   				}
   		}
   });
	}
	}
</script>
</head>
<body>
<div id="particles-js"></div>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3 col-xs-12">
      <div class="title-container text-center">
        <h1>Algorithm Visualizer</h1>
        </div>
      
      <div class="panel panel-default">
        <div class="panel-heading"> <strong class="">Change Password</strong></div>
        <div class="panel-body">
          <form class="form-horizontal" role="form">
			<div class="form-group">
              <label for="password" class="col-md-4 control-label">Password</label>
				<div class="col-md-6">
                <input id="password" type="password" class="form-control" name="password" required>
              </div>
            </div>
             
             <div class="form-group">
              <label for=" password" class="col-md-4 control-label">Confirm Password</label>
				<div class="col-md-6">
                <input id="c_password" type="password" class="form-control" name="c_password" required>
              </div>
            </div>
               
            
            <p style="color:red;" id="notify_status"></p>
            </form>
			  <div class="form-group">
              	<div class="col-md-8 col-md-offset-4">
              	<button id="changep_button" onclick="changep();" class="btn btn-primary">Change Password</button>
              	</div>
              </div>
              
      </div>
    </div>
</body>
<script src='js/jquery.min.js'></script>
<script src='js/particles.js'></script>
<script  src="js/index.js"></script>
</body>
</html>
<%}%>