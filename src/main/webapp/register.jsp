<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            margin-top: 50px;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .btn{
            background-color: #4c9daf;
            color: white;
            border: none;
            border-radius: 3px;
            padding: 10px 20px;
            cursor: pointer;
        }

        button:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
	<input type="hidden" id="status" value="<%=request.getAttribute("status")%>"/>
    <div class="container">
        <h2>Registration Form</h2>
        <form id="registrationForm" action="./registerServlet" method="post">

            <label for="First Name"><b>First Name</b></label>
            <input type="text" placeholder="Enter First Name" name="name" required><br>

            <label for="Last Name"><b>Last Name</b></label>
            <input type="text" placeholder="Enter Last Name" name="lname" required><br>

            <label for="username"><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="uname" required><br>

            <label for="password"><b> New Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required><br>
            
            <input class = 'btn'type="submit"  value="Register"/>
        </form>
    </div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	
	if(status=="success"){
	  swal("Congrast","Registration is  Successfully","success");
	}
		
	</script>
</body>
</html>