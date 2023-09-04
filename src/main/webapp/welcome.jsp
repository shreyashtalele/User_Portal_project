<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Message</title>
    <style>

        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color:aqua;
        }
        
        #welcome-message {
            font-size: 24px;
            margin-top: 100px;
            
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
            width: 100px;
             margin-right: 10px;
        }
        
    </style>
</head>
<body>
    <div id="welcome-message"></div>
    
    <a id = "btn" href="edit.jsp">Edit Profile</a>
    
    
    <a id = "btn" href="profile.jsp">View Profile</a>
    
    <script>
        function updateWelcomeMessage() {
            const now = new Date();
            const currentHour = now.getHours();

            let greeting;

            if (currentHour >= 5 && currentHour < 12) {
                greeting ="Welcome...";
                greeting = "Good morning!";
            } else if (currentHour >= 12 && currentHour < 18) {
                greeting="Welcome...";
                greeting = "Good afternoon!";
            } else {
                greeting="Welcome..."
                greeting = "Good evening!";
            }

            const welcomeMessage = document.getElementById("welcome-message");
            welcomeMessage.textContent = greeting;
        }

        // Call the function initially to display the welcome message
        updateWelcomeMessage();

        // Update the welcome message every minute
        setInterval(updateWelcomeMessage, 60000);


        
    </script>
</body>
</html>