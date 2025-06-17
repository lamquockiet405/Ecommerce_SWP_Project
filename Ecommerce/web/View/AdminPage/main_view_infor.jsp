<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Information</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
            }
            .info-container {
                max-width: 700px;
                margin: 50px auto;
                background: #fff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            }
            .profile-header {
                display: flex;
                align-items: center;
                gap: 15px;
                border-bottom: 1px solid #ddd;
                padding-bottom: 15px;
                margin-bottom: 15px;
            }
            .profile-header img {
                width: 90px;
                height: 90px;
                padding: 2px;
                border-radius: 50%;
                object-fit: cover;
                border: 1px solid #333;
            }
            .profile-header h2 {
                margin: 0;
                color: #333;
            }
            .table th {
                background-color: #f8f9fa;
                text-align: left;
                width: 30%;
            }
            .table td {
                text-align: left;
            }
            .btn-container {
                display: flex;
                justify-content: space-between;
            }
            .btn-primary {
                background-color: #1877f2;
                border: none;
            }
            .btn-primary:hover {
                background-color: #1558c5;
            }
            .btn-secondary {
                background-color: #42b72a;
                border: none;
            }
            .btn-secondary:hover {
                background-color: #369924;
            }
        </style>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            
           
         
           
        </style>
    </head>
<main class="container">
    <div class="info-container">
        <c:if test="${not empty error}">
            <div class="alert alert-danger d-flex justify-content-between align-items-center" role="alert">
                <span>${error}</span>
                <a href="LoginController" class="btn btn-danger">Login</a>
            </div>
        </c:if>
        <c:if test="${empty error}">
            <div class="profile-header">
                <c:choose>
                    <c:when test="${not empty user.image}">
                        <img src="${user.image}" alt="Avatar" class="profile-img">
                    </c:when>
                    <c:otherwise>
                        <img src="images/avtdf.jpg" alt="Avatar" class="profile-img">
                    </c:otherwise>
                </c:choose>                        
                <h2 id="fullName">${user.firstName} ${user.lastName}</h2>
            </div>
            <table class="table">
                <tr>
                    <th>Username</th>
                    <td id="username">${user.username}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td id="email">${user.email}</td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td id="phoneNumber">${user.phoneNumber}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td id="address">${user.address}</td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td id="gender">${user.gender == true ? "Male" : "Female"}</td>
                </tr>
                <tr>
                    <th>Date of birth</th>
                    <td id="dateOfBirth">${user.dateOfBirth}</td>
                </tr>
                <tr>
                    <th>User Role</th>
                    <td id="dateOfBirth">${user.userRole}</td>
                </tr>
                <tr>
                    <th>Created At</th>
                    <td id="dateOfBirth">${user.createAt}</td>
                </tr>
                
            </table>
        </c:if>
        <div class="btn-container mt-3">
            
            <a href="/Ecommerce_SWP/ManagerUserURL" class="btn btn-secondary text-end" style="padding: 8px 32px">Back</a>
        </div>
    </div>
</main>