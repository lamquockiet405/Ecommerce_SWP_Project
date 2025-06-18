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
                    <c:when test="${not empty shop.logo}">
                        <img src="${shop.logo}" alt="Avatar" class="profile-img">
                    </c:when>
                    <c:otherwise>
                        <img src="images/avtdf.jpg" alt="Avatar" class="profile-img">
                    </c:otherwise>
                </c:choose>                        
                <h2 id="fullName">${shop.name}</h2>
            </div>
            <table class="table">
                <tr>
                    <th>Tax</th>
                    <td id="email">${shop.tax}</td>
                </tr>
                <tr>
                    <th>Owner</th>
                    <td id="phoneNumber">${user.firstName} ${user.lastName} || <a href="${pageContext.request.contextPath}/ViewUserInformation?userID=${user.userID}">View Owner Details</a></td>
                    
                </tr>
                <tr>
                    <th>Describe</th>
                    <td id="address">${shop.describe}</td>
                </tr>
               
                
            </table>
        </c:if>
        <div class="btn-container mt-3">
            
            <a href="/Ecommerce_SWP/ManageShopURL" class="btn btn-secondary text-end" style="padding: 8px 32px">Back</a>
        </div>
    </div>
</main>