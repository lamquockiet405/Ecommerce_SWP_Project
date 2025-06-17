<%-- 
    Document   : ManagerCustomer
    Created on : Feb 27, 2022, 10:49:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.List"%>
<%@page import ="java.util.ArrayList"%>
<!DOCTYPE html>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Payment Method</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        <!-- Core theme CSS (includes Bootstrap)-->

        <style>
            body{
                font-size: medium;
            }
        </style>
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
    <body>
        <header>
            <div class="logo">
                <image src="logo.png" width="80px">
            </div>
            <div class="search-container">

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
                                <li>
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage User
                                </li>
                            </a>
                            <a href="ManageShopURL">
                                <li>
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage Shop
                                </li>
                            </a>
                            <a href="view_category">
                                <li class="">
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
                                <li class="active">
                                    <span class="sidebar-menu-icon">◎</span>
                                    Manage Payment Method
                                </li>
                            </a>
                        </ul>

                    </div>
                </div>
                <div class="main-content">
                    <div class="breadcrumb">
                        Home >> Manage Payment Method
                    </div>
                    <div class="col-md-9 p-3">
                        <div class="table-wrapper">
                            <div class="table-title d-flex justify-content-between">
                                <h4>Manage Payment Methods</h4>
                                <div class="btn-container">
                                    <button class="btn btn-danger" id="openModalBtn">Add New Payment Method</button>
                                </div>
                            </div>
                            <table class="table table-striped table-hover" id="userTable">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Payment Method</th>
                                        <th>Payment Method Status</th>
                                        <th>Change Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="id" value="0" />
                                    <c:forEach items="${PaymentMethodList}" var="pm" varStatus="loop">
                                        <tr>
                                            <c:set var="id" value="${loop.count}"/>
                                            <td>${id}</td>
                                            <td>${pm.paymentMethod}</td>
                                            <td>${pm.status == 1 ? "Active" : "Inactive"}</td>
                                            <td>
                                                <p style="color: ${pm.status == 0 ? 'red' : 'green'}">
                                                    ${pm.status == 0 ? 'Blocked' : 'Active'}
                                                </p>
                                            </td>
                                            <td>
                                                <form action="UpdatePaymentMethodStatus" method="post">
                                                    <input type="hidden" name="paymentId" value="${pm.paymentID}">
                                                    <div class="form-group">
                                                        <select class="form-control" name="status" onchange="this.form.submit()">
                                                            <option value="0" ${pm.status == 0 ? 'selected' : ''}>Inactive</option>
                                                            <option value="1" ${pm.status == 1 ? 'selected' : ''}>Active</option>
                                                        </select>
                                                    </div>
                                                </form>
                                            </td>
                                           
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div id="addAddressModal" class="modal-overlay">
                                <div class="modal-box">
                                    <div class="modal-header">
                                        <h3 class="modal-title">Add New Payment Method</h3>
                                    </div>
                                    <div class="modal-body">
                                        <form action="/Ecommerce_SWP/AddPaymentMethod" method="post">
                                            <div class="mb-3">
                                                <label class="form-label">Payment Method Name</label>
                                                <input type="text" class="form-control" name="methodName" required>
                                            </div>

                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" id="closeModalBtn">Back</button>
                                                <button type="submit" class="btn btn-danger">Confirm</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <style>/* Ẩn modal mặc định */
                    .modal-overlay {
                        display: none; /* Ban đầu ẩn modal */
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(0, 0, 0, 0.5);
                        justify-content: center;
                        align-items: center;
                    }


                    /* Hộp chứa modal */
                    .modal-box {
                        background: white;
                        padding: 20px;
                        border-radius: 8px;
                        width: 400px;
                        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                    }

                    /* Header của modal */
                    .modal-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        font-weight: bold;
                        border-bottom: 1px solid #ddd;
                        padding-bottom: 10px;
                    }

                    /* Nút đóng */
                    .btn-close {
                        background: none;
                        border: none;
                        font-size: 20px;
                        cursor: pointer;
                    }

                    /* Form input */
                    .form-control {
                        width: 100%;
                        padding: 8px;
                        margin-top: 5px;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                    }

                    /* Footer của modal */
                    .modal-footer {
                        margin-top: 15px;
                        text-align: right;
                    }

                    /* Nút */
                    .btn {
                        padding: 8px 12px;
                        border: none;
                        border-radius: 5px;
                        cursor: pointer;
                    }

                    .btn-danger {
                        background: red;
                        color: white;
                    }

                    .btn-secondary {
                        background: gray;
                        color: white;
                    }
                </style>

                <script>document.getElementById("openModalBtn").addEventListener("click", function () {
                        document.getElementById("addAddressModal").style.display = "flex";
                    });

                    document.getElementById("closeModalBtn").addEventListener("click", function () {
                        document.getElementById("addAddressModal").style.display = "none";
                    });

                    document.getElementById("closeModalBtn2").addEventListener("click", function () {
                        document.getElementById("addAddressModal").style.display = "none";
                    });
                </script>
                <script>
                    const urlParams = new URLSearchParams(window.location.search);
                    const message = urlParams.get("mess");
                    if (message) {
                        alert(message);
                    }
                </script>
                </body>
                </html>