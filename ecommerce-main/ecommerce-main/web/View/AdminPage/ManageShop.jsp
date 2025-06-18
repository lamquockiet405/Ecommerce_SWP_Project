<%-- 
    Document   : ManagerCustomer
    Created on : Feb 27, 2022, 10:49:45 PM
    Author     : Admin
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Shop</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->


        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            }

            body {
                background-color: #f5f5f5;
            }

            header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 20px;
                background-color: white;
                border-bottom: 1px solid #e0e0e0;
            }

            .logo {
                display: flex;
                align-items: center;
                font-size: 20px;
                font-weight: bold;
                color: #333;
            }

            .logo-icon {
                color: #0088cc;
                margin-right: 10px;
                font-size: 24px;
            }

            .search-container {
                flex: 1;
                max-width: 400px;
                margin: 0 20px;
            }

            .search-container input {
                width: 100%;
                padding: 8px 12px;
                border-radius: 4px;
                border: 1px solid #ddd;
            }

            .user-profile {
                display: flex;
                align-items: center;
            }

            .user-profile img {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                margin-left: 10px;
            }

            .mail-icon {
                margin-right: 15px;
                color: #555;
            }

            .container {
                display: flex;
            }

            .sidebar {
                width: 230px;
                background-color: white;
                height: calc(100vh - 60px);
                padding: 0px;
                left: 0px;
                border-right: 1px solid #e0e0e0;
            }

            .sidebar-menu {
                list-style: none;
            }

            .sidebar-menu li {
                padding: 10px 25px;
                margin: 5px 0;
                display: flex;
                align-items: center;
                color: #555;
            }

            .sidebar-menu li.active {
                background-color: #e8f4ff;
                color: #0088cc;
                border-left: 3px solid #0088cc;
            }

            .sidebar-menu-icon {
                margin-right: 10px;
                width: 20px;
            }

            .sidebar-category {
                font-size: 12px;
                text-transform: uppercase;
                color: #777;
                padding: 15px 25px 5px;
                margin-top: 10px;
            }

            .main-content {
                flex: 2;
                padding: 20px;
            }

            .breadcrumb {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                color: #555;
            }

            .breadcrumb span {
                margin: 0 5px;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin: 0 -10px;
            }

            .col {
                flex: 1;
                padding: 0 10px;
                min-width: 250px;
                margin-bottom: 20px;
            }

            .card {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                padding: 20px;
                height: 100%;
            }

            .stat-card {
                margin-bottom: 20px;
            }

            .stat-title {
                color: #777;
                font-size: 14px;
                margin-bottom: 8px;
            }

            .stat-value {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 8px;
            }

            .stat-change {
                display: inline-block;
                padding: 2px 8px;
                border-radius: 4px;
                font-size: 12px;
                margin-left: 8px;
            }

            .stat-change.up {
                background-color: rgba(0, 200, 0, 0.1);
                color: green;
            }

            .stat-change.down {
                background-color: rgba(255, 0, 0, 0.1);
                color: red;
            }

            .stat-extra {
                color: #777;
                font-size: 13px;
            }

            .stat-extra span {
                color: #0088cc;
            }

            .card-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 20px;
            }

            .card-title {
                font-size: 18px;
                font-weight: 500;
                color: #333;
            }

            .tabs {
                display: flex;
            }

            .tab {
                padding: 8px 16px;
                border-radius: 4px;
                margin-left: 8px;
                cursor: pointer;
                font-size: 14px;
            }

            .tab.active {
                background-color: #0088cc;
                color: white;
            }

            .chart-container {
                height: 250px;
                position: relative;
            }

            .bar-chart {
                display: flex;
                height: 200px;
                align-items: flex-end;
                margin-top: 20px;
            }

            .bar-group {
                flex: 1;
                display: flex;
                justify-content: center;
                margin: 0 5px;
            }

            .bar {
                width: 20px;
                background-color: #26c6da;
                border-radius: 4px 4px 0 0;
            }

            .days {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
                color: #777;
                font-size: 12px;
            }

            .day {
                flex: 1;
                text-align: center;
            }

            .upgrade-box {
                padding: 20px;
                text-align: center;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
                margin-top: 20px;
            }

            .upgrade-img {
                width: 80px;
                height: 80px;
                margin: 0 auto 10px;
            }

            .upgrade-title {
                font-weight: bold;
                margin-bottom: 8px;
            }

            .upgrade-desc {
                color: #555;
                font-size: 14px;
                margin-bottom: 15px;
            }

            .btn {
                display: inline-block;
                padding: 8px 20px;
                border-radius: 4px;
                text-decoration: none;
                font-weight: 500;
            }

            .btn-success {
                background-color: #66bb6a;
                color: white;
            }

            .url-bar {
                padding: 8px 15px;
                background-color: #f0f0f0;
                color: #777;
                font-size: 12px;
                text-align: left;
                border-top: 1px solid #ddd;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th {
                text-align: left;
                padding: 12px 15px;
                border-bottom: 1px solid #e0e0e0;
                color: #555;
            }

            td {
                padding: 12px 15px;
                border-bottom: 1px solid #f0f0f0;
            }

            .status-circle {
                display: inline-block;
                width: 10px;
                height: 10px;
                border-radius: 50%;
                margin-right: 5px;
            }

            .status-red {
                background-color: #f44336;
            }

            .status-green {
                background-color: #4caf50;
            }

            .status-orange {
                background-color: #ff9800;
            }

            .analytics-card {
                margin-bottom: 12px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .analytics-title {
                font-size: 14px;
                color: #555;
            }

            .analytics-value {
                font-weight: 500;
            }

            .analytics-value.positive {
                color: green;
            }

            .line-chart {
                height: 150px;
                margin-top: 20px;
                position: relative;
            }

            .line {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }

            .transaction {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                padding-bottom: 20px;
                border-bottom: 1px solid #f0f0f0;
            }

            .transaction-icon {
                width: 36px;
                height: 36px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
                font-size: 18px;
            }

            .icon-green {
                background-color: rgba(76, 175, 80, 0.1);
                color: #4caf50;
            }

            .icon-blue {
                background-color: rgba(33, 150, 243, 0.1);
                color: #2196f3;
            }

            .icon-red {
                background-color: rgba(244, 67, 54, 0.1);
                color: #f44336;
            }

            .transaction-info {
                flex: 1;
            }

            .transaction-title {
                font-weight: 500;
                margin-bottom: 4px;
            }

            .transaction-date {
                color: #777;
                font-size: 13px;
            }

            .transaction-amount {
                text-align: right;
            }

            .transaction-value {
                font-weight: 500;
                font-size: 18px;
                margin-bottom: 4px;
            }

            .transaction-percentage {
                display: inline-block;
                padding: 2px 8px;
                border-radius: 4px;
                font-size: 12px;
                background-color: #f0f0f0;
            }

            .footer {
                padding: 15px 20px;
                color: #777;
                font-size: 13px;
                display: flex;
                justify-content: space-between;
                border-top: 1px solid #e0e0e0;
                margin-top: 20px;
            }
        </style>
        <style>
            body{
                font-size: medium;
            }
        </style>
    </head>

    <body>
        <header>
            <div class="logo">
                <img src="logo.png" width="80px">
            </div>
            <div class="search-container">
                <form action="SearchShop" method="Post">
                    <input type="text" placeholder="Search shop by email..." name="email">
                </form>
            </div>
            <div class="dropdown">
                <a class="pc-head-link dropdown-toggle" data-bs-toggle="dropdown" href="#">
                    Menu
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                    <div class="dropdown-header">
                        <h6 class="mb-1">User Name: ${acc.username}</h6>
                    </div>
                    <a href="LogOutController" class="dropdown-item">
                        <i class="ti ti-power"></i> <span>Logout</span>
                    </a>
                </div>
            </div>
        </header>


        <div class="container-fluid">

            <div class="row">
                <div class="col-md-3 bg-light p-3" style="width: 300px">
                    <div class="sidebar">
                        <ul class="sidebar-menu">
                            <a href="AdminHome">
                                <li >
                                    <span class="sidebar-menu-icon">◯</span>
                                    Dashboard
                                </li>
                            </a>
                        </ul>

                        <div class="sidebar-category">Admin Manage</div>
                        <ul class="sidebar-menu">
                            <a href="ManagerUserURL">
                                <li >
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage User
                                </li>
                            </a>
                            <a href="ManageShopURL">
                                <li class="active">
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage Shop
                                </li>
                            </a>
                            <a href="view_category">
                                <li >
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage Category
                                </li>
                            </a>
                            <a href="mange_product">
                                <li>
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage Product
                                </li>
                            </a>
                            <a href="GetPaymentMethodList">
                                <li>
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage Payment Method
                                </li>
                            </a>
                        </ul>


                    </div>
                </div>

                <div class="table-wrapper">
                    <div class="table-title" style="width: 1300px">
                        <div class="main-content">
                            <div class="breadcrumb">
                                Home >> Manage Shop
                            </div>

                        </div>
                        <table class="table table-striped table-hover" id="shopTable">
                            <thead>
                                <tr>
                                    <th>Shop Name</th>

                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Shop Detail</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${ShopList}" var="shop">
                                    <tr>
                                        <td>${shop.name}</td>



                                        <%-- Khởi tạo biến lưu thông tin user --%>
                                        <c:set var="foundUserName" value="" scope="page"/>
                                        <c:set var="foundEmail" value="" scope="page"/>
                                        <c:set var="foundFirstName" value="" scope="page"/>
                                        <c:set var="foundLastName" value="" scope="page"/>
                                        <c:set var="foundPhoneNumber" value="" scope="page"/>

                                        <%-- Tìm user có userID khớp với shop.userId --%>
                                        <c:forEach items="${UserList}" var="user">
                                            <c:if test="${shop.userId == user.userID}">
                                                <c:set var="foundUserName" value="${user.username}" scope="page"/>
                                                <c:set var="foundEmail" value="${user.email}" scope="page"/>
                                                <c:set var="foundFirstName" value="${user.firstName}" scope="page"/>
                                                <c:set var="foundLastName" value="${user.lastName}" scope="page"/>
                                                <c:set var="foundPhoneNumber" value="${user.phoneNumber}" scope="page"/>
                                            </c:if>
                                        </c:forEach>

                                        <%-- Hiển thị thông tin user --%>

                                        <td>${foundEmail}</td>

                                        <td>${foundPhoneNumber}</td>
                                        <td><a href="${pageContext.request.contextPath}/ViewShopInformation?id=${shop.id}">Detail</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody>

                        </table>
                        <div id="pagination" class="d-flex justify-content-center mt-3"></div>

                        <div id="descriptionModal" class="modal">
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <h4>Mô tả chi tiết</h4>
                                <p id="fullDescription"></p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <!-- JavaScript xử lý sự kiện xem mô tả -->

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const modal = document.getElementById("descriptionModal");
                const modalContent = document.getElementById("fullDescription");
                const closeBtn = document.querySelector(".close");
                const rowsPerPage = 9; // Hiển thị 9 shop trên 1 trang
                const table = document.getElementById("shopTable");
                const tbody = table.querySelector("tbody");
                const rows = tbody.querySelectorAll("tr");
                const totalRows = rows.length;
                const totalPages = Math.ceil(totalRows / rowsPerPage);
                const pagination = document.getElementById("pagination");

                document.querySelectorAll(".view-full-description").forEach(item => {
                    item.addEventListener("click", function (event) {
                        event.preventDefault();
                        const description = this.getAttribute("data-description");

                        // Tự động xuống dòng sau mỗi 80 ký tự
                        let formattedText = description.replace(/(.{80})/g, "$1\n");

                        modalContent.innerText = formattedText;
                        modal.style.display = "block";
                    });
                });

                closeBtn.onclick = function () {
                    modal.style.display = "none";
                };
                function showPage(page) {
                    let start = (page - 1) * rowsPerPage;
                    let end = start + rowsPerPage;

                    rows.forEach((row, index) => {
                        row.style.display = index >= start && index < end ? "" : "none";
                    });
                }

                function createPaginationButtons() {
                    pagination.innerHTML = "";
                    for (let i = 1; i <= totalPages; i++) {
                        let button = document.createElement("button");
                        button.innerText = i;
                        button.className = "btn btn-primary mx-1";
                        button.onclick = function () {
                            showPage(i);
                            highlightActivePage(i);
                        };
                        pagination.appendChild(button);
                    }
                }

                function highlightActivePage(activePage) {
                    let buttons = pagination.querySelectorAll("button");
                    buttons.forEach((button, index) => {
                        button.classList.toggle("btn-secondary", index + 1 !== activePage);
                        button.classList.toggle("btn-primary", index + 1 === activePage);
                    });
                }

                if (totalPages > 1) {
                    createPaginationButtons();
                    showPage(1);
                    highlightActivePage(1);
                }

                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                };
            });

        </script>
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.4);
            }

            .modal-content {
                background-color: white;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 50%;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            .close {
                float: right;
                font-size: 20px;
                font-weight: bold;
                cursor: pointer;
            }
        </style>


    </body>
</html>
