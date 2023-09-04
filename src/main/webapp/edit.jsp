<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
        }

        .profile-form {
            margin-top: 20px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        #btn {
            background-color: #4c9daf;
            color: white;
            border: none;
            border-radius: 3px;
            padding: 10px 20px;
            cursor: pointer;
        }

        #btn:hover {
            opacity: 0.8;
        }
    </style>
</head>
<body>
	<input type="hidden" id="status" value="<%=request.getAttribute("status")%>"/>
    <div class="container">
        <h1>Edit Profile</h1>
        <form class="profile-form" method="post" action="./editServlet">
          

            <label for="name">Enter New Name:</label>
            <input type="text" id="name" name="name" placeholder="Your New Name">


            <label for="uname">Enter New Username:</label>
            <input type="text" id="unamer" name="uname" placeholder="Your New  Username">

            <label for="Password">New Password</label>
            <input type="Password" id="Password" name="password" placeholder="Enter New Password">

            <label for="Password">Confirm Password</label>
            <input type="Password" id="Password" name="password1" placeholder="Confirm  Password">
            

            <div style="text-align: center;">
                <input id="btn" type="submit" value="Save"/>
            </div>
        </form>
    </div>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type="text/javascript">
	var status = document.getElementById("status").value;
	
	if(status=="success"){
	  swal("Your","Record is Update Successfully ","success");
	}

		
		
	</script>
</body>
</html>