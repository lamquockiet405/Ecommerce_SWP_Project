<%-- 
    Document   : Header
    Created on : Feb 21, 2025, 12:12:24 PM
    Author     : lenovo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FoodMart - Free eCommerce Grocery Store HTML Website Template</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta name="description" content="">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="./css/vendor.css">
        <link rel="stylesheet" type="text/css" href="./style.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=Open+Sans:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">


    </head>
    <header>
        <div class="container-fluid">
            <div class="row py-3 border-bottom">

                <div class="col-sm-4 col-lg-3 text-center text-sm-start">
                    <div class="main-logo">
                        <a href="${pageContext.request.contextPath}/homePage">
                            <img src="logo.png" width="60px" height="60px" alt="logo" class="img-fluid">
                        </a>
                    </div>
                </div>

                <div class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
                    <div class="search-bar row bg-light p-2 my-2 rounded-4">

                        <div class="col-11 col-md-11">
                            <form id="search-form" action="productList" method="GET">
                                <input type="text" name="query" class="form-control border-0 bg-transparent"
                                       placeholder="Search for more than 20,000 products"
                                       value="<%= session.getAttribute("query") != null ? session.getAttribute("query") : "" %>">
                                <!-- Nút submit ẩn để form có thể gửi đi khi nhấn Enter -->
                                <button type="submit" style="display: none;"></button>
                            </form>
                        </div>

                        <div class="col-1">
                            <svg id="search-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                 style="cursor: pointer;" role="button" tabindex="0">
                            <path fill="currentColor" d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z"/>
                            </svg>
                        </div>

                        <script>
                            document.getElementById("search-icon").addEventListener("click", function () {
                                document.getElementById("search-form").submit();
                            });

                            // Cho phép nhấn phím Enter trên icon để tìm kiếm
                            document.getElementById("search-icon").addEventListener("keypress", function (event) {
                                if (event.key === "Enter" || event.key === " ") {
                                    document.getElementById("search-form").submit();
                                }
                            });
                        </script>
                    </div>
                </div>

                <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">


                    <ul class="d-flex justify-content-end list-unstyled m-0">
                        <li>
                            <c:if test="${sessionScope.acc != null}">  
                                <!-- Nếu có tài khoản trong session, chuyển hướng đến User Profile -->
                                <a href="./view_information" class="rounded-circle bg-light p-2 mx-1">
                                    <svg width="24" height="24" viewBox="0 0 24 24">
                                    <use xlink:href="#user"></use>
                                    </svg>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.acc == null}">  
                                <!-- Nếu chưa đăng nhập, chuyển đến Login -->
                                <a href="./View/Login/Login.jsp" class="rounded-circle bg-light p-2 mx-1">
                                    <svg width="24" height="24" viewBox="0 0 24 24">
                                    <use xlink:href="#user"></use>
                                    </svg>
                                </a>
                            </c:if>

                        </li>
                        <c:if test="${sessionScope.acc != null && sessionScope.shop == null}">  
                            <li>
                                <a href="./View/UserPage/RegisterShop.jsp" >

                                    Register Shop

                                </a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc != null && sessionScope.shop != null}">  
                            <li>
                                <a href="${pageContext.request.contextPath}/view_product" >

                                    Go to my shop

                                </a>
                            </li>
                        </c:if>
                        <li class="d-lg-none">
                            <a href="#" class="rounded-circle bg-light p-2 mx-1" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
                                <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#cart"></use></svg>
                            </a>
                        </li>

                        <li class="d-lg-none">
                            <a href="#" class="rounded-circle bg-light p-2 mx-1" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSearch" aria-controls="offcanvasSearch">
                                <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#search"></use></svg>
                            </a>
                        </li>

                    </ul>

                    <div class="cart text-end d-none d-lg-block">
                        <button class="border-0 bg-transparent d-flex flex-column gap-2 lh-1" type="button"
                                data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart"
                                onclick="window.location.href = '${pageContext.request.contextPath}/cart'">
                            🛒 <span id="cart-count">${sessionScope.cartCount != null ? sessionScope.cartCount : 0}</span>
                        </button>
                    </div>

                    <c:if test="${not empty sessionScope.acc}">
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script>
                                    function updateCartCount() {
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/homePage",
                                            type: "GET",
                                            dataType: "json",
                                            success: function (data) {
                                                $("#cart-count").text(data.cartCount);
                                            },
                                            error: function (xhr, status, error) {
                                                console.error("Lỗi khi lấy số lượng giỏ hàng:", error);
                                            }
                                        });
                                    }

                                    // Chỉ cập nhật số lượng giỏ hàng khi có session "acc"
                                    $(document).ready(function () {
                                        updateCartCount();
                                    });
                        </script>
                    </c:if>
                    <c:if test="${empty sessionScope.acc}">
                        <% session.removeAttribute("cartCount"); %> 
                    </c:if>
                    <style>
                        .cart {
                            position: relative;
                            display: inline-block;
                        }

                        #cart-count {
                            position: absolute;
                            top: -10px; /* Đưa số lên trên */
                            right: -10px; /* Đưa số sang phải */
                            background: linear-gradient(135deg, #ff4d4f, #ff2d55); /* Hiệu ứng gradient đỏ */
                            color: white;
                            font-size: 13px;
                            font-weight: bold;
                            min-width: 22px;
                            height: 22px;
                            text-align: center;
                            border-radius: 50%; /* Tạo hình tròn */
                            line-height: 22px;
                            box-shadow: 0px 4px 8px rgba(255, 77, 79, 0.4);
                            border: 2px solid white; /* Viền trắng giúp tách biệt */
                            transition: all 0.3s ease-in-out;
                            padding: 0 6px;
                        }

                        /* Khi hover vào icon giỏ hàng */
                        .cart button:hover #cart-count {
                            transform: scale(1.3) rotate(10deg); /* Phóng to + xoay nhẹ tạo cảm giác sinh động */
                            box-shadow: 0px 6px 12px rgba(255, 77, 79, 0.6);
                        }

                        /* Khi số lượng giỏ hàng lớn hơn 9, hiển thị dấu "+" */
                        #cart-count[data-count="9+"] {
                            font-size: 11px;
                            padding: 0 5px;
                            min-width: 26px;
                        }

                        /* Hiệu ứng rung nhẹ khi số lượng thay đổi */
                        @keyframes shake {
                            0%, 100% {
                                transform: translateX(0);
                            }
                            25% {
                                transform: translateX(-2px);
                            }
                            50% {
                                transform: translateX(2px);
                            }
                            75% {
                                transform: translateX(-1px);
                            }
                        }

                        .cart.shake #cart-count {
                            animation: shake 0.3s ease-in-out;
                        }
                    </style>

                    <c:if test="${sessionScope.acc != null}"> 
                        <div><a href="LogOutController">Logout</a></div>
                    </c:if>
                </div>

            </div>
        </div>   
    </header>
</html>
