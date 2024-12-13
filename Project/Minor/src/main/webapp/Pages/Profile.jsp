<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile Page</title>
    <!-- Link to your CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        .profile-header {
            background-color: #6200ea;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .profile-header h1 {
            margin: 0;
            font-size: 2rem;
        }
        .profile-picture {
            display: flex;
            justify-content: center;
            margin-top: -50px;
        }
        .profile-picture img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 5px solid #fff;
            object-fit: cover;
        }
        .profile-details {
            padding: 20px;
            text-align: center;
        }
        .profile-details h2 {
            margin: 10px 0;
            color: #333;
        }
        .profile-details p {
            margin: 5px 0;
            color: #666;
        }
        .profile-footer {
            padding: 10px;
            background-color: #f4f4f4;
            text-align: center;
        }
        .profile-footer a {
            color: #6200ea;
            text-decoration: none;
            margin: 0 10px;
        }
        .profile-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<form action="Profile" method="post">
    <div class="profile-container">
        <div class="profile-header">
            <h1>User Profile</h1>
        </div>
        <div class="profile-details">
            <h2>${requestScope.userName}</h2>
            <p>Email: ${requestScope.userEmail}</p>
            <p>Location: ${requestScope.userAddress}</p>
        </div>
        <div class="profile-footer">
            <a href="#">Edit Profile</a>
            <a href="#">Logout</a>
        </div>
    </div>
    </form>
</body>
</html>