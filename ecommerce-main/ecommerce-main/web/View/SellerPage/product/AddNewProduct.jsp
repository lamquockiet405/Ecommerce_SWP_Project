<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>${action != null ? action : "Add new"} product</title>
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
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <a href="" ></a>
            <div class="row">
                <!-- Sidebar -->
                <div class="col-md-2" style="padding: 0;">
                    <jsp:include page="../common/sidebar.jsp"/>
                </div>
                <!-- Main content -->
                <main class="col-md-10" style="padding: 0;">
                    <jsp:include page="../common/header.jsp"/>
                    <div class="container d-flex justify-content-center">
                        <jsp:include page="./FormAddProduct.jsp"/>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- SweetAlert2 để hiển thị thông báo -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {

                const input = document.getElementById("product_name");
                const action = "${action}".trim();
                const success = "${success}";
                const error = "${error}";
                const errorAddProduct = "${errorAddProduct}";
                if (errorAddProduct) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: errorAddProduct,
                        timer: 3000,
                        showConfirmButton: false
                    });
                    input.classList.add("is-invalid");
                    input.classList.remove("is-valid");
                    setInvalidFeedback(input, errorAddProduct);
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

                if (action !== "") {
                    if (success) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: success,
                            timer: 2000,
                            showConfirmButton: false
                        });
                    }
                } else {
                    if (success) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: success,
                            timer: 2000,
                            showConfirmButton: false
                        }).then(() => {
                            window.location.href = "view_product?ptype=review";
                        });
                    }
                }


                function setInvalidFeedback(input, message) {
                    let feedback = input.parentNode.querySelector(".invalid-feedback");
                    if (feedback) {
                        feedback.textContent = message;
                    }
                }
            });
        </script>
    </body>
</html>
