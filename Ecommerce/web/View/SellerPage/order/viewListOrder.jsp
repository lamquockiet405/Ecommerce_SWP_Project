<%-- 
    Document   : ViewListOrder
    Created on : Mar 16, 2025, 1:35:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Order</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <h2 class="text-center">View list order</h2>
                    <div class="container d-flex justify-content-between" style="flex-direction: column;">
                        <div>
                            <jsp:include page="./filter.jsp" />
                        </div>
                        <div class="mt-3" style="flex: 1">
                            <jsp:include page="./order.jsp" />
                        </div>
                        <div>
                            <jsp:include page="./displayPageNumber.jsp" />
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const successMessage = "${success}";
            const errorMessage = "${error}";
            const errorGetData = "${errorGetData}";

           

            if (successMessage) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: successMessage,
                    timer: 3000,
                    showConfirmButton: false
                }).then(() => {
                    window.location.href = "manager_view_list_order";
                });
            } else if (errorMessage) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: errorMessage,
                    showConfirmButton: true
                });
            }
        });
    </script>
</html>
