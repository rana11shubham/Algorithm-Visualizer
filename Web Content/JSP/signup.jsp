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
<html lang="en-us">
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel="stylesheet" href="css/style.css">
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
       return false;
    }
    return true;
	}
function sendGender()
{
	var gm=document.getElementById("g_male");
	var gf=document.getElementById("g_female");
	if(gm.checked==true)
		{
			return "male";
		}
	else
		{
			return "female";
		}
	
	}
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
function signup()
{
	if(validateE()&&checkPass())
	{ $("#signup_button").attr("disabled", "disabled");
		$.post("Signup",
   {
	name:$('#name').val().trim(),
     em:$("#email").val().trim(),
     pswd:$("#password").val(),
     cpswd:$('#c_password').val(),
     gender:sendGender()
   },
   function(data,status){
   	if(status=="success")
   		{
   		if(data==="user_already")
   			{
   				document.getElementById("notify_status").innerHTML="User Already Exist";
		        document.getElementById("email").focus();
		        $("#signup_button").removeAttr("disabled");
   			}
   			if(data==="name")
   				{
   				document.getElementById("notify_status").innerHTML="Enter your Name";
   		        document.getElementById("name").focus();
   		     $("#signup_button").removeAttr("disabled");
   				}
   			if(data==="email")
   				{
   				document.getElementById("notify_status").innerHTML="Enter valid Email address";
   		        document.getElementById("email").focus();
   		     $("#signup_button").removeAttr("disabled");
   				}
   			if(data==="password")
				{
				document.getElementById("notify_status").innerHTML="Passwords doesn't match";
		        document.getElementById("password").focus();
		        $("#signup_button").removeAttr("disabled");
				}
   			if(data==="gender")
				{
				document.getElementById("notify_status").innerHTML="Enter your Gender";
		        document.getElementById("gender").focus();
		        $("#signup_button").removeAttr("disabled");
				}
   			if(data==="s")
   				{
   					document.getElementById("notify_status").innerHTML="Verify your email."
   					document.getElementById("name").value="";
   					document.getElementById("email").value="";
   					document.getElementById("password").value="";
   					document.getElementById("c_password").value="";
   					$("#signup_button").removeAttr("disabled");
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
        <div class="panel-heading"> <strong class="">Signup</strong></div>
        <div class="panel-body">
          <form class="form-horizontal" role="form">
          	
          	 <div class="form-group">
             	 <label for="name" class="col-md-4 control-label">Name</label>
              	<div class="col-md-6">
                	<input id="name" type="text" class="form-control" name="name" value="" required autofocus>
              	</div>
            </div>
            
            <div class="form-group">
              <label for="email" class="col-md-4 control-label">E-Mail Address</label>
              <div class="col-md-6">
                <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
              </div>
            </div>
			
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
               
            <div class="form-group">
              <label for="gender" class="col-md-4 control-label">Gender</label>
			  	<div class="col-md-6">
  				<input id="g_male" type="radio" name="gender" value="male" checked>&nbsp;Male&nbsp;
  				<input id="g_female" type="radio" name="gender" value="female">&nbsp;Female&nbsp;
  				</div>
            </div>
            <p style="color:red;" id="notify_status"></p>
            </form>
			  <div class="form-group">
              	<div class="col-md-8 col-md-offset-4">
              	<button id="signup_button" onclick="signup();" class="btn btn-primary">Signup</button>
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