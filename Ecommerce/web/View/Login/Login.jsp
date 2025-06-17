

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.0.0/mdb.min.js"></script>

<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            <%@ include file="LoginCSS.css" %>
        </style>
        <style>
            /* Container chính */
            .head {
                display: flex;
                align-items: center;
                padding: 20px 30px; /* Căn chỉnh giống Shopee */

            }

            /* Logo */
            .logo {
                display: flex;
                align-items: center;
                text-decoration: none;
            }

            .logo img {
                height: 40px; /* Điều chỉnh kích thước logo */
                margin-right: 8px; /* Khoảng cách với chữ Shopee */
            }



            /* Chữ "Đăng nhập" */
            .login {
                font-size: 18px;
                margin-left: 20px; /* Khoảng cách giữa Shopee và Đăng nhập */
                color: black;
                text-decoration: none;
            }


        </style>
    </head>
    <body>
        <div class="head">
            <a href="${pageContext.request.contextPath}/homePage" class="logo">
                <img src="logo.png" alt="Shopee Logo">

            </a>
            <span class="login">Đăng nhập</span>
        </div>
        <section class="vh-100">
            <div class="container-fluid h-custom " style="
                 height: 550px;"
                 >
                <div class="row d-flex justify-content-center align-items-center h-50">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="484642829_625080040682257_1102424871640656189_n.png">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                        <form action="${pageContext.request.contextPath}/LoginController" method="post">


                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">Or</p>
                            </div>

                            <p class="text-danger ">${message}</p>


                            <!-- Email input -->
                            <div data-mdb-input-init class="form-outline mb-4">
                                Email: 
                                <input name="email" type="email" id="form3Example3" class="form-control form-control-lg"
                                       placeholder="Enter a valid email address" />

                            </div>

                            <!-- Password input -->
                            <div data-mdb-input-init class="form-outline mb-3">
                                Password:
                                <input name="pass" type="password" id="form3Example4" class="form-control form-control-lg"
                                       placeholder="Enter password" />

                            </div>

                            <div class="d-flex justify-content-between align-items-center">
                                <!-- Checkbox -->
                                <div class="form-check mb-0">
                                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                                    <label class="form-check-label" for="form2Example3">
                                        Remember me
                                    </label>
                                </div>
                                <a href="${pageContext.request.contextPath}/forgotPassword" class="text-body">Forgot password?</a>
                            </div>

                            <a href="https://accounts.google.com/o/oauth2/v2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Ecommerce_SWP/View/Login/Login.jsp&response_type=code&client_id=150176701023-okr4h6qcemj6lph7a0gfk5v24doobk45.apps.googleusercontent.com&prompt=consent" class="btn btn-lg btn-danger">
                                <i class="fab fa-google"></i>
                                <span class="ms-2 fs-6">Sign in with Google</span>
                            </a>



                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
                                         style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
                                <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="${pageContext.request.contextPath}/View/SignUp/SignUp.jsp"
                                                                                                  class="link-danger">Register</a></p>
                            </div>


                        </form>
                    </div>
                </div>
            </div>

            <script>
                async function loadComponent(id, file) {
                    const response = await fetch(file);
                    const content = await response.text();
                    document.getElementById(id).innerHTML = content;
                }

                loadComponent("Header", "../Header/Header.jsp");
                loadComponent("Footer", "../Footer/Footer.jsp");
            </script>

        </section>
    </body>
</html>