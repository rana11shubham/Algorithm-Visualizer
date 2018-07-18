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
  <title>AlgoVisualiser</title>
  
  
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>

      <link rel="stylesheet" href="css/style.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
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
    document.getElementById("notify_status").innerHTML="";
    return true;
	}
  function sendData()
  {
	  var ema=$('#email').val().trim();
	  if(validateE()){
	  $.post('Forg_Pass',{em:ema},function(data,status){
		  if(status=="success")
		{
			  if(data==="user_not_exist")
				  {
				  document.getElementById("notify_status").innerHTML="This User doesn't exist";
				  }
			  else if(data==="sent")
				  {
				  document.getElementById("notify_status").innerHTML="A link with the password reset details is sent to your email.";
				  }
			  else if(data==="error")
				  {
				  document.getElementById("notify_status").innerHTML="Sorry Some error Occurred.Please try again later.";
				  }
		}
	  });
	  }
  }
  </script>
</head>

<body>

  <div id="particles-js"></div>
<!-- /.particles div -->
<div class="container-fluid">
  <div class="row">
    <div class="col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3 col-xs-12">
      <div class="title-container text-center">
        <h1>Forgotten Password ?</h1>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
        </div>
        <div class="panel-body">
         
            <div class="form-group">
              <label for="email" class="col-md-4 control-label">E-Mail Address</label>
              <div class="col-md-6">
                <input id="email" type="email" class="form-control" name="email" value="" required autofocus>
              </div>
            </div>

         <div class="form-group">
              <div class="col-md-6 col-md-offset-4">
               <p id="notify_status" style="color:red;"></p>
              </div>
            </div>

            <div class="form-group">
              <div class="col-md-8 col-md-offset-4">
                <button onclick='sendData();' class="btn btn-primary">
                                    Confirm
                                </button>

              </div>
            </div>
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
<%
}
%>