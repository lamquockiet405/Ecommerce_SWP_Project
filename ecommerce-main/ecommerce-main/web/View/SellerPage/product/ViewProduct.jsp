<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <title>Dashboard</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body {
                background-color: #f8f9fa;
            }
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
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2" style="padding: 0;">
                    <jsp:include page="../common/sidebar.jsp"/>
                </div>
                <main class="col-md-10" style="padding: 0;">
                    <jsp:include page="../common/header.jsp"/>
                    <h2 class="text-center">View list product</h2>
                    
                    <div class="container d-flex justify-content-between" style="flex-direction: column;">
                        <div>
                            <jsp:include page="filter/filterProduct.jsp" />
                        </div>
                        <div class="mt-3" style="flex: 1">
                            <jsp:include page="displayProduct/product.jsp" />
                        </div>
                        <div>
                            <jsp:include page="displayProduct/displayPageNumber.jsp" />
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- SweetAlert2 để hiển thị thông báo -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const successUpdateProduct = "${successUpdateProduct}";
            const errorUpdateProduct = "${errorUpdateProduct}";
            const error = "${error}";

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
