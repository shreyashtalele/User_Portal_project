<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .container {
            width: 300px;
            margin: 0 auto;
            margin-top: 100px;
            text-align: center;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        #btn{
            display:inline-block;
            text-decoration:none;
            background-color: #4c9daf;
            color: white;
            padding: 12px 18px;
            margin: 10px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        #btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>

	<input type="hidden" id="status" value="<%=session.getAttribute("status")%>"/>
    <div class="container">
        <h2>Login</h2>
        <form id="loginForm" method="post" action="./loginServlet">
            <label for="username"><b>Username</b></label>
            <input type="text" placeholder="Enter Username" name="username" required><br>

            <label for="password"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" required><br>

             <input  id="btn" type="submit" value="Login"/>
             <a id = "btn" href="register.jsp">Register Here</a>
           
        </form>
    </div>

   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	
	if(status=="fail"){
	  swal("Sorry","Wrong Username and Password","error");
	}
	</script>
</body>
</html>