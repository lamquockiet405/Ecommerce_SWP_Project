<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <style>
            .adm-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px 20px;
                background-color: white;
                border-bottom: 1px solid #e0e0e0;
            }

            .adm-logo {
                display: flex;
                align-items: center;
                font-size: 20px;
                font-weight: bold;
                color: #333;
            }

            .adm-logo-icon {
                color: #0088cc;
                margin-right: 10px;
                font-size: 24px;
            }

            .adm-search-container {
                flex: 1;
                max-width: 400px;
                margin: 0 20px;
            }

            .adm-search-container input {
                width: 100%;
                padding: 8px 12px;
                border-radius: 4px;
                border: 1px solid #ddd;
            }

            .adm-user-profile {
                display: flex;
                align-items: center;
            }

            .adm-user-profile img {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                margin-left: 10px;
            }

            .adm-mail-icon {
                margin-right: 15px;
                color: #555;
            }

            .adm-sidebar-container {
                display: flex;
            }

            .adm-sidebar {
                width: 230px;
                background-color: white;
                height: calc(100vh - 60px);
                padding: 0px;
                left: 0px;
                border-right: 1px solid #e0e0e0;
            }

            .adm-sidebar-menu {
                list-style: none;
            }

            .adm-sidebar-menu li {
                padding: 10px 25px;
                margin: 5px 0;
                display: flex;
                align-items: center;
                color: #555;
            }

            .adm-sidebar-menu li.active {
                background-color: #e8f4ff;
                color: #0088cc;
                border-left: 3px solid #0088cc;
            }

            .adm-sidebar-menu-icon {
                margin-right: 10px;
                width: 20px;
            }

            .adm-sidebar-category {
                font-size: 12px;
                text-transform: uppercase;
                color: #777;
                padding: 15px 25px 5px;
                margin-top: 10px;
            }
            ul > a {
                text-decoration: none;
            }
            ul > a:hover {
                text-decoration: underline;
                color: black;
            }

        </style>
        <style>
            .product-image {
                max-width: 100%;
                height: auto;
                object-fit: contain;
            }
            .variant-table img {
                width: 100px;
                height: 100px;
                object-fit: contain;
            }
        </style>
    </head>
    <body>
        <header class="adm-header">
            <div class="adm-logo">
                <image src="logo.png" width="80px">
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div class="adm-mail-icon">✉</div>
                <img src="/api/placeholder/32/32" class="rounded-circle" height="40px" width="40px" alt="User Avatar">
            </div>
        </header>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 d-flex justify-content-center" style="padding: 0;">
                    <div class="adm-sidebar">
                        <ul class="adm-sidebar-menu" style="padding-left: 0">
                            <a href="AdminHome">
                                <li>
                                    <span class="adm-sidebar-menu-icon">◯</span>
                                    Dashboard
                                </li>
                            </a>
                        </ul>
                        <div class="adm-sidebar-category">Admin Manage</div>
                        <ul class="adm-sidebar-menu" style="padding-left: 0px">
                            <a href="ManagerUserURL">
                                <li class="">
                                    <span class="adm-sidebar-menu-icon">◎</span>
                                    Manage User
                                </li>
                            </a>
                            <a href="ManageShopURL">
                                <li>
                                    <span class="adm-sidebar-menu-icon">◎</span>
                                    Manage Shop
                                </li>
                            </a>
                            <a href="view_category">
                                <li >
                                    <span class="adm-sidebar-menu-icon">◎</span>
                                    Manage Category
                                </li>
                            </a>
                            <a href="mange_product">
                                <li class="active">
                                    <span class="adm-sidebar-menu-icon">◎</span>
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
                <main class="col-md" style="padding: 0;">
                    <div class="container d-flex justify-content-between" style="flex-direction: column;">
                        <div class="mt-3" style="flex: 1">
                            <jsp:include page="./detail.jsp" />
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SweetAlert2 để hiển thị thông báo -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const error = "${error}";
                const success = "${success}";

                if (error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: error,
                        timer: 3000,
                        showConfirmButton: false
                    });
                }

                if (success) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: success,
                        timer: 2000,
                        showConfirmButton: false
                    });
                }
            });
        </script>
    </body>
</html>