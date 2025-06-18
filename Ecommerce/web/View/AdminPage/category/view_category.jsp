<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <title>View category</title>
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
        <!-- Style thứ hai giữ nguyên -->
        <style>
            .sidebar {
                height: 100vh;
                background-color: #ffffff;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            }
            .sidebar .btn-toggle {
                width: 100%;
                text-align: left;
                color: #333;
                font-weight: 500;
            }
            .sidebar .btn-toggle:hover {
                background-color: #bfdbfe;
            }
            .sidebar a {
                display: block;
                padding: 5px 15px;
                color: #555;
                text-decoration: none;
            }
            .sidebar a:hover {
                background-color: #bfdbfe;
                border-radius: 5px;
            }

            .active__sidebar {
                background-color: #93c5fd;
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s ease-in-out, transform 0.2s ease-in-out;
            }

            .active__sidebar__tiem  {
                background-color: #ffffff;
                border-left: 4px solid #93c5fd;
                border-radius: 5px;
                font-weight: bold;
                margin-top: 8px;
                margin-bottom: 8px;
                transition: background-color 0.3s ease-in-out, transform 0.2s ease-in-out;
            }

            .block-filter-sort .filter-sort__list-filter .btn-filter {
                align-items: center;
                background: #f3f4f6;
                border: 1px solid #e5e7eb;
                border-radius: 10px;
                color: #444;
                cursor: pointer;
                display: flex;
                font-size: 12px;
                height: 34px;
                margin: 0 10px 10px 0;
                padding: 5px 10px;
                white-space: nowrap;
            }
            .pagination {
                text-align: center;
                margin: 20px;
            }

            .pagination a, .pagination span {
                margin: 0 5px;
                padding: 8px 12px;
                text-decoration: none;
                color: #333;
            }

            .pagination .current {
                border: 1px solid #dee2e6;
            }


            /* Modern UI Styles */
            .product-type-container {
                display: flex;
                gap: 15px;
                margin-bottom: 20px;
            }

            .product_type {
                padding: 12px 18px;
                border-radius: 8px;
                text-decoration: none;
                font-size: 16px;
                font-weight: 500;
                color: #333;
                background: #f8f9fa;
                transition: all 0.3s ease;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .product_type:hover {
                background: #4CAF50;
                color: white;
                transform: translateY(-2px);
            }

            .active_ptype {
                background: #4CAF50 !important;
                color: white !important;
                font-weight: bold;
            }
        </style>
    </head>
    <body style="background: #f5f5f5">
        <header class="adm-header">
            <div class="adm-logo">
                <image src="logo.png" width="80px"/>
            </div>
            <div class="dropdown">
                <a
                    class="pc-head-link dropdown-toggle arrow-none me-0"
                    data-bs-toggle="dropdown"
                    href="#"
                    role="button"
                    aria-haspopup="false"
                    data-bs-auto-close="outside"
                    aria-expanded="false">
                    Menu
                </a>
                <div class="dropdown-menu dropdown-user-profile dropdown-menu-end pc-h-dropdown">
                    <div class="dropdown-header">
                        <div class="d-flex mb-1">
                            <div class="flex-shrink-0">
                                
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <c:set var="name" value="acc"></c:set>
                                <h6 class="mb-1">User Name: ${acc.username}</h6>
                                
                            </div>
                            
                        </div>
                    </div>
                   
                    <div class="tab-content" id="mysrpTabContent">
                        
                        <div class="tab-pane fade show active" id="drp-tab-1" role="tabpanel" aria-labelledby="drp-t1" tabindex="0">
                            

                            <a href="LogOutController" class="dropdown-item">
                                <i class="ti ti-power"></i>
                                <span>Logout</span>
                            </a>
                        </div>
                        

                    </div>
                </div>

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
                                <li class="active">
                                    <span class="adm-sidebar-menu-icon">◎</span>
                                    Manage Category
                                </li>
                            </a>
                            <a href="mange_product">
                                <li>
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
                <main class="col-md mt-5" style="padding: 0;">
                    <h2 class="text-center">View list category</h2>
                    <div class="container d-flex justify-content-between" style="flex-direction: column;">
                        <div>
                            <jsp:include page="./filter.jsp"/>
                        </div>
                        <div class="mt-3" style="flex: 1">
                            <jsp:include page="./category.jsp" />
                            <jsp:include page="./modal_add_category.jsp" />
                            <jsp:include page="./modal_update_category.jsp" />
                        </div>
                        <div>
                            <jsp:include page="./page_number.jsp" />
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- Phần còn lại giữ nguyên -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const successUpdateProduct = "${successUpdateProduct}";
                const errorUpdateProduct = "${errorUpdateProduct}";
                const error = "${error}";
                const errorAddCategory = "${errorAddCategory}";
                const successAddCategory = "${successAddCategory}";
                const errorUpdateCategory = "${errorUpdateCategory}";
                const successUpdateCategory = "${successUpdateCategory}";
                if (errorAddCategory) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: errorAddCategory,
                        timer: 3000,
                        showConfirmButton: false
                    });
                }
                if (errorUpdateCategory) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: errorUpdateCategory,
                        timer: 3000,
                        showConfirmButton: false
                    });
                }
                if (successAddCategory) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: successAddCategory,
                        timer: 2000,
                        showConfirmButton: false
                    });
                }
                if (successUpdateCategory) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: successUpdateCategory,
                        timer: 2000,
                        showConfirmButton: false
                    });
                }
                if (error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: error,
                        timer: 3000,
                        showConfirmButton: false
                    });
                }
                if (successUpdateProduct) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: successUpdateProduct,
                        timer: 2000,
                        showConfirmButton: false
                    });
                } else if (errorUpdateProduct) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: errorUpdateProduct,
                        timer: 3000,
                        showConfirmButton: false
                    });
                }
            });
        </script>
    </body>
</html>