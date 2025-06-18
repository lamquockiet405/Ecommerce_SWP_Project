<%-- 
    Document   : Checkout
    Created on : Mar 19, 2025, 2:27:37 AM
    Author     : lenovo
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanh Toán - Shopee</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
            }

            .container {
                max-width: 900px;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .border {
                border-radius: 5px;
                border: 1px solid #ddd;
                padding: 15px;
                margin-bottom: 15px;
            }

            .header {
                font-size: 20px;
                font-weight: bold;
                color: #ee4d2d;
                border-bottom: 2px solid #ee4d2d;
                padding-bottom: 10px;
                margin-bottom: 15px;
            }

            .price {
                font-size: 18px;
                font-weight: bold;
                color: red;
            }

            .btn-outline-primary.active {
                background-color: #ee4d2d;
                border-color: #ee4d2d;
                color: white;
            }

            #total-price {
                font-size: 22px;
                font-weight: bold;
                color: red;
            }

            .payment-methods button {
                margin-right: 10px;
            }

            .btn-danger {
                background-color: #ee4d2d;
                border: none;
                font-size: 18px;
                padding: 10px;
            }

            .btn-danger:hover {
                background-color: #d43f00;
            }
        </style>
    </head>
    <div id="Header"></div>
    <body>
        <div class="container mt-4">
            <form action="CreateBill" method="POST">
                <div class="header">EZShop | Checkout</div>

                <!-- Địa chỉ nhận hàng -->
                <div class="border">
                    <h5>📍 Shipping Address</h5>
                    <p>
                        <c:forEach var="sa" items="${ShippingAddressesList}">
                            <c:if test="${sa.status == 'true'}">
                            <p><strong>Receiver Name: <span id="receiver-name" name="username">${sa.username}</span></strong></p>  
                            <input hidden="" name="username" value="${sa.username}">

                            <p>Phone Number: <span id="phone-number">${sa.phoneNumber}</span></p>  
                            <p>Address: <span id="selected-address" name="shippingAddress">${sa.address}</span>  
                                <input hidden="" name="shippingAddress" value="${sa.address}">
                                <button type="button" class="btn btn-link" id="change-address" onclick="openAddressModal()">Thay đổi</button>  
                            </p>

                        </c:if>
                    </c:forEach>
                    </p>
                </div>

                <!-- Sản phẩm -->
                <div class="border">
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total Money</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="totalBill" value="0" />

                            <c:forEach var="vq" items="${variantList}" varStatus="status">
                                <c:set var="pvl" value="${productVariantList[status.index]}" />
                            <input type="hidden" name="pvId" value="${pvl.productVariantID}" />
                            <tr>
                                <!-- Cột Sản phẩm -->
                                <td class="product-info">
                                    <img name="pvImage" src="${pvl.image}" alt="Product Image">
                                    <input hidden="" name="pvImage" value="${pvl.image}">
                                    <div class="product-details">
                                        <p class="product-name" name="pvName">${pvl.productVariantName}</p>
                                        <input hidden="" name="pvName" value="${pvl.productVariantName}">
                                    </div>
                                </td>

                                <!-- Cột Đơn giá -->
                                <td class="price" name="price">
                                    <input type="hidden" name="price" value="${pvl.price}">
                                    $<fmt:formatNumber value="${pvl.price}" pattern="0,000"/>
                                </td>


                                <!-- Cột Số lượng -->
                                <td class="quantity" name="quantity">
                                    <input hidden="" name="quantity" value="${vq.quantity}">
                                    ${vq.quantity}
                                </td>

                                <td class="price">
                                    $<fmt:formatNumber value="${vq.quantity * pvl.price}" pattern="#,###"/>
                                </td>

                                <c:set var="totalBill" value="${totalBill + (pvl.price * vq.quantity)}" />
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>

                <!-- Phương thức thanh toán -->
                <div class="border">
                    <h5>💳 Payment Method</h5>
                    <div class="payment-methods">
                        <c:forEach var="pm" items="${PaymentMethodList}" varStatus="loop">
                            <c:if test="${pm.status == '1'}">
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" 
                                           name="paymentMethod" 
                                           id="pm_${pm.paymentMethod}" 
                                           value="${pm.paymentMethod}" 
                                           required=""
                                           ${loop.first ? 'checked' : ''}> <!-- Chọn radio đầu tiên -->
                                    <label class="form-check-label" for="pm_${pm.paymentMethod}">
                                        ${pm.paymentMethod}
                                    </label>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>



                <!-- Tổng thanh toán -->
                <div class="border">
                    <h5>💰 Total Amount</h5>
                    <input type="hidden" name="totalAmount" value="${totalBill}">

                    <p id="total-price" name="totalAmount">
                        $<fmt:formatNumber value="${totalBill}" pattern="#,###"/>
                    </p>
                </div>


                <!-- Nút đặt hàng -->
                <button type="submit" class="btn btn-danger w-100" id="place-order">Confirm Order</button>
            </form>


            <!-- Modal chọn địa chỉ -->
            <div id="address-modal" class="modal" style="display: none; width: 800px; height: 630px;">
                <div class="modal-content" style="width: 542px;">

                    <h5>📍 My Address</h5>
                    <div class="address-list">
                        <c:forEach var="sa" items="${ShippingAddressesList}">
                            <div class="address-item">
                                <label class="address-label">
                                    <div class="address-info">
                                        <p><strong class="receiver-name">${sa.username}</strong></p>
                                        <p>Phone Number: <span class="phone-number">${sa.phoneNumber}</span></p>
                                        <p>Address: <span class="full-address">${sa.address}</span></p>
                                    </div>

                                    <input type="radio" name="selectedAddress" value="${sa.id}" 
                                           <c:if test="${sa.status == 'true'}">checked</c:if> />
                                    </label>
                                </div>
                        </c:forEach>
                    </div>
                    <div class="modal-actions">
                        <button class="btn cancel" onclick="closeAddressModal()">Cancel</button>
                        <button class="btn confirm" onclick="confirmAddress()">Confirm</button>
                    </div>
                </div>
            </div>

            <div id="address-modal" style="display: none; width: 800px; height: 630px;">
                <h5>My Address</h5>
                <form id="address-form" action="/Ecommerce_SWP/ChooseAddress" method="POST">
                    <div class="address-list">
                        <c:forEach var="sa" items="${ShippingAddressesList}">
                            <label class="address-label">
                                <input type="radio" name="selectedAddress" value="${sa.id}" class="address-radio">
                                <span class="address-info">
                                    <strong>${sa.username}</strong> (${sa.phoneNumber}) <br>
                                    ${sa.address}
                                </span>
                            </label>
                        </c:forEach>
                    </div>
                    <input type="hidden" name="confirmedAddress" id="confirmedAddress">
                    <button type="submit" onclick="confirmAddress()">Confirm</button>
                </form>
            </div>
        </div>
        <div id="Footer"></div>

        <script>
            function confirmAddress() {
                let selectedRadio = $("input[name='selectedAddress']:checked");
                let selectedAddress = selectedRadio.val();

                if (!selectedAddress) {
                    alert("Vui lòng chọn một địa chỉ!");
                    return;
                }

                $.ajax({
                    url: "/Ecommerce_SWP/ChooseAddress",
                    type: "POST",
                    data: {confirmedAddress: selectedAddress},
                    success: function (response) {
                        // Tìm phần tử chứa thông tin địa chỉ được chọn
                        let addressInfo = selectedRadio.closest(".address-label").find(".address-info");

                        // Lấy thông tin cụ thể
                        let receiverName = addressInfo.find(".receiver-name").text();
                        let phoneNumber = addressInfo.find(".phone-number").text();
                        let address = addressInfo.find(".full-address").text();

                        // Cập nhật thông tin lên giao diện chính
                        $("#receiver-name").text(receiverName);
                        $("#phone-number").text(phoneNumber);
                        $("#selected-address").text(address);

                        // Đóng modal
                        closeAddressModal();
                    },
                    error: function (xhr, status, error) {
                        console.error("Fail to send Address:", error);
                    }
                });
            }




            function openAddressModal() {
                $("#address-modal").show();
            }

            function closeAddressModal() {
                $("#address-modal").hide();
            }

        </script>

        <script>
            async function loadComponent(id, file) {
                const response = await fetch(file);
                const content = await response.text();
                document.getElementById(id).innerHTML = content;
            }

            loadComponent("Header", "./View/Header/Header.jsp");
            loadComponent("Footer", "./View/Footer/Footer.jsp");
        </script>

        <script>
            $(document).ready(function () {
                let totalPrice = 34039400; // Tổng tiền mặc định

                // Chọn phương thức thanh toán
                $(".payment-method").click(function () {
                    $(".payment-method").removeClass("active");
                    $(this).addClass("active");
                });
                // Đặt hàng
                
            });
        </script>
        <script>
                    const urlParams = new URLSearchParams(window.location.search);
                    const message = urlParams.get("error");
                    if (message) {
                        alert(message);
                    }
                </script>

        <style>
            .cart-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            .cart-table th, .cart-table td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
                text-align: left;
            }

            .cart-table th {
                font-weight: bold;
            }

            .product-info {
                display: flex;
                align-items: center;
            }

            .product-info img {
                width: 60px;
                height: 60px;
                margin-right: 10px;
                border-radius: 5px;
            }

            .product-details {
                display: flex;
                flex-direction: column;
            }

            .product-name {
                font-weight: bold;
            }

            .price {
                color: #ff4d00;
                font-weight: bold;
            }

            .quantity {
                text-align: center;
            }

            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.5);
            }
            .modal-content {
                background: white;
                padding: 20px;
                margin: 10% auto;
                width: 50%;
            }
            .address-item {
                padding: 10px;
                border-bottom: 1px solid #ccc;
            }
            /* Ẩn modal ban đầu */
            .modal {
                display: none;
                position: fixed;
                z-index: 10;
                left: 50%;
                top: 50%;
                transform: translate(-50%, -50%);
                width: 400px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
                padding: 15px;
            }

            /* Nội dung modal */
            .modal-content {
                text-align: left;
            }

            /* Mỗi mục địa chỉ */
            .address-item {
                border-bottom: 1px solid #ddd;
                padding: 10px;
            }

            /* Label chứa cả địa chỉ và radio */
            .address-label {
                display: flex;
                align-items: center;
                justify-content: space-between;
                cursor: pointer;
            }

            /* Phần thông tin địa chỉ */
            .address-info {
                max-width: 80%;
            }

            /* Căn giữa radio */
            .address-label input[type="radio"] {
                transform: scale(1.2);
                margin-right: 10px;
            }

            /* Nút xác nhận và hủy */
            .modal-actions {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }

            .modal-actions .btn {
                padding: 8px 12px;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }

            /* Màu theo Shopee */
            .btn.cancel {
                background: #ddd;
            }

            .btn.confirm {
                background: #ee4d2d;
                color: white;
            }
        </style>


    </body>
</html>