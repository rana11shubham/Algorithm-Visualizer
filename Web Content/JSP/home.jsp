<%
String email=(String)session.getAttribute("email");
if(email==null)
{
	response.sendRedirect("index.jsp");
}
else
{	
%>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/dropdown.css">
    <link rel="stylesheet" href="css/modal.css">
    <link rel="stylesheet" href="css/freezeframe_styles.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <script type="text/javascript" src="js/modal.js"></script>
    <script type="text/javascript" src="js/freezeframe.pkgd.js"></script>
    <script type="text/javascript" src="js/freezeframe.pkgd.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.0/jquery-confirm.min.js"></script>

<script type="text/javascript">
	function delete_acc(){
			$.confirm({
    title: 'Confirm Deletion',
    content: 'Do you really want to delete your account ?',
    buttons: {
        confirm: function () {
            $.alert({title:'',content:'You will be logged out and your account will be deleted'});
           window.location='delacc.jsp?em=<%=email%>';
       },
        cancel: function () {}
        }
});
	}
	</script>

    <style>
        body {
            margin-bottom: 8%;
            margin-left: 8%;
            margin-right: 8%;
            margin-top: 2%;
        }
        
        .grid-container {
            display: grid;
            grid-template-columns: 32% 32% 32%;
            grid-template-rows: 32% 32% 32%;
            grid-gap: 25px;
            padding: 10px;
        }
        
        .grid-container>div {
            text-align: center;
            font-size: 30px;
            padding: 20px 0;
            background-color: rgb(165, 215, 245);
        }
        
        .Box {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            /*width: 40%;*/
            border-radius: 5px;
        }
        
        .Box:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.5);
        }
        
        img {
            border-radius: 5px 5px 0 0;
        }
        
        .fill {
            object-fit: unset;
        }
        
        .icon-bar {
            width: 100%;
            background-color: #555555;
            overflow: auto;
            border-radius: 7px;
        }
        
        .icon-bar a {
            color: white;
            transition: all 0.3 ease;
            font-size: 25px;
            width: 10%;
            text-align: center;
        }
        
        .heading {
            margin: 10px;
            margin-left: 15px;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            font-size: 25px;
            color: white;
        }
        
        .des {
            color: black;
            font-size: 20px;
            text-align: center;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            first = new freezeframe('.my_class_1').freeze();
            second = new freezeframe({
                'selector': '.my_class_2',
                'animation_play_duration': Infinity,
                'non_touch_device_trigger_event': 'click'
            }).freeze();
            third = new freezeframe('.my_class_3').capture().setup();
            $('.start').click(function(e) {
                e.preventDefault();
                third.trigger();
            });
            $('.stop').click(function(e) {
                e.preventDefault();
                third.release();
            });
            $('.my_class_4').freezeframe();

            $('.my_class_5').freezeframe({
                overlay: true
            });
        })
    </script>
   
</head>

<body>

    <div class="icon-bar">

        <a href="#">
            <p class="heading" style="float: left;" title="A better way of becoming master">VISUAL ALGO</p>
        </a>
        <div class="dropdown">
            <a href="#" style="float:right;margin-top:10px " id="myBtn" class="dropbtn"><i class="fa fa-ellipsis-v"></i></a>

            <div id="myDropdown" class="dropdown-content">
                <a href="#" style="font-size: 20px" id="about">About</a>
                <a href="logout.jsp" style="font-size: 20px">SignOut</a>
                <a onclick="delete_acc();" style="font-size: 20px" title="Delete Account">Delete</a>

            </div>
        </div>
    </div>

    <div>
        <p class="heading des">VISUAL ALGO</p><br>
        <p class="heading des">Visualizing data structures and algorithms through animation</p>
    </div>

    <div class="grid-container">

        <div class="Box LS" onclick="window.location='linearsearchnew.jsp';">
            <img class="fill my_class_1" src="images/linear_search.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Linear Search</p>
        </div>

        <div class="Box BS" onclick="window.location='binarysearchnew.jsp';">
            <img class="fill my_class_1" src="images/binary_search.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Binary Search</p>
        </div>

        <div class="Box IS" onclick="window.location='insertionsortnew.jsp';">
            <img class="fill my_class_1" src="images/insertion_sort.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Insertion Sort</p>
        </div>

        <div class="Box SS" onclick="window.location='selectionsortnew.jsp';">
            <img class="fill my_class_1" src="images/selectionsort.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Selection Sort</p>
        </div>

        <div class="Box RS" onclick="window.location='bubblesortnew.jsp';">
            <img class="fill my_class_1" src="images/bubble_sort.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Bubble Sort</p>
        </div>

        <div class="Box S" onclick="window.location='stack.jsp';">
            <img class="fill my_class_1" src="images/stack.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Stack</p>
        </div>

        <div class="Box Q" onclick="window.location='queue.jsp';">
            <img class="fill my_class_1" src="images/queue.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Queue</p>
        </div>

        <div class="Box SE" onclick="window.location='sieve.jsp';">
            <img class="fill my_class_1" src="images/sieve.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Sieve Of Eratosthenes</p>
        </div>

        <div class="Box BST" onclick="window.location='bst.jsp';">
            <img class="fill my_class_1" src="images/bst.gif" width=100%>
            <p class="heading des" style="color:black;font-size:20px ">Binary Search Tree</p>
        </div>

    </div>

    <div id="myModal" class="modal">

        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h2 class="heading">Algorithm Visualizer</h2>
            </div>
            <div class="modal-body">

                <pre>
                <p class="des" style="text-align:justify;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif" ><b> 
                     The best way to understand complex data structures is to see them in action.
                     We've developed interactive animations for a variety of data structures and algorithms.
                     Our visualization tool is written in javascript using the HTML5 and CSS
                     elements, and run in just about any modern browser.
                     We've provided an option for custom input which helps in analyzing the algorithms 
                     more efficiently. </b></p>
                </pre>
            </div>
        </div>

        <script>
            document.getElementById("myBtn").onclick = function() {
                myFunction()
            };

            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
        </script>

        <script>
            var modal = document.getElementById('myModal');

            var btn = document.getElementById("about");

            var span = document.getElementsByClassName("close")[0];

            btn.onclick = function() {
                modal.style.display = "block";
            }

            span.onclick = function() {
                modal.style.display = "none";
            }

            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>
</body>
</html>
<%}%>