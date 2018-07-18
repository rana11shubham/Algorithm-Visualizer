<%
String email=(String)session.getAttribute("email");
if(email!=null)
{
	response.sendRedirect("home.jsp");
}
else
{
%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Login</title>
 
  
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

  <div id="particles-js"></div>
<!-- /.particles div -->
<div class="container-fluid">
  <div class="row">
    <div class="col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3 col-xs-12">
      <div class="title-container text-center">
        <h1>Algorithm Visualizer</h1>
        
      </div>
      <div class="panel panel-default">
        <div class="panel-heading"> <strong class="">Login</strong>
        </div>
        <div class="panel-body">
          <form class="form-horizontal" role="form">
            <div class="form-group">
              <label for="email" class="col-md-4 control-label">E-Mail Address</label>
              <div class="col-md-6">
                <input id="email" type="email" class="form-control" name="email" onblur="validateE();" required autofocus>
              </div>
            </div>

            <div class="form-group">
              <label for="password" class="col-md-4 control-label">Password</label>

              <div class="col-md-6">
                <input id="password" type="password" class="form-control" name="password" required>
              </div>
            </div>

            <div class="form-group">
              <div class="col-md-6 col-md-offset-4">
               <p id="notify_status" style="color:red;"></p>
              </div>
            </div>

            <div class="form-group">
              <div class="col-md-8 col-md-offset-4">
                <button"type="submit"  class="btn btn-primary" onclick="login();">
                                    Login
                                         </button>
                                          
                <a class="btn btn-link" href="forg_pass.jsp">
                                    Forgot Your Password?
                                </a>
              </div>
            </div>
          </form>
        </div>
        <div class="panel-footer">Not Registered? <a href="signup.jsp" class="">Register here</a>
        </div>
      </div>
    </div>
       <script src='js/jquery.min.js'></script>

  <script src='js/particles.js'></script>

    <script  src="js/index.js"></script>
    <script type="text/javascript">
function validateE()
{
	var emailID = document.getElementById("email").value;
    atpos = emailID.indexOf("@");
    dotpos = emailID.lastIndexOf(".");
    if(emailID.trim()==="")
   	 {return false;}
    if (atpos < 1 || ( dotpos - atpos < 2 )) 
    {
       document.getElementById("notify_status").innerHTML="Enter valid Email address";
       document.getElementById("email").focus();
       document.getElementById("password").disabled=true;
       return false;
    }
    document.getElementById("notify_status").innerHTML="";
    document.getElementById("password").disabled=false;
    return true;
	}
function login()
{
	if(validateE())
	{ $.post("Login",
   {
     em:$("#email").val().trim(),
     pswd:$("#password").val()
   },
   function(data,status){
   	if(status=="success")
   		{
   			if(data==="0")
   				{
   				document.getElementById("notify_status").innerHTML="Enter valid Email address";
   		        document.getElementById("email").focus();
   		        document.getElementById("password").disabled=true;
   				}
   			if(data==="v")
   				{
   				document.getElementById("notify_status").innerHTML="Please verify your email first.";
   				}
   			if(data==="p")
   				{
   				document.getElementById("notify_status").innerHTML="Invalid Credentials.";
   		        document.getElementById("password").focus();
   				}
   			if(data==="s")
   				{
   				window.location="home.jsp";
   				}
   		}
   });
	}
	}
</script>

  </body>




</html>
<%}%>
