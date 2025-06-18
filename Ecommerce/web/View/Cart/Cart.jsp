<%-- 
    Document   : Cart
    Created on : Mar 12, 2025, 10:40:31 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Model.Chinh.Cart" %>
<%@page import="Model.Chinh.Products" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>Shopping Cart</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/Cart/CartCSS.css">
    </head>
    <body>
        <div id="Header"></div>
        <div class="container mt-4">
            <h2 class="text-center">SHOPPING CART</h2>
            <form id="cart-form" action="CreateOrders" method="get">
                <div class="cart-container">
                    <table class="table table-bordered cart-table">
                        <thead class="table-warning">
                            <tr>
                                <th><input type="checkbox" id="select-all">SELECT ALL</th>
                                <th>Product</th>
                                <th>Product Variant</th>
                                <th>Unit Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cart" items="${requestScope.Carts}">
                                <c:forEach var="variant" items="${requestScope.variant}">
                                    <c:if test="${cart.productVariantID == variant.productVariantID}">
                                        <tr class="cart-item" data-price="${variant.price}" data-cartid="${cart.cartID}">
                                            <td>
                                                <input type="checkbox" class="item-checkbox" onchange="updateTotal()" ${variant.stockQuantity == 0 ? 'disabled' : ''}>
                                            </td>
                                            <td>
                                                <img src="${variant.getImage()}" class="img-thumbnail" style="width: 80px;">
                                                <c:forEach var="product" items="${requestScope.Products}">
                                                    <c:if test="${product.productID == variant.productID}">
                                                        <p class="mb-0">${product.productName}</p>
                                                    </c:if>
                                                </c:forEach>
                                                <p class="text-danger" style="color: red !important;">${variant.stockQuantity == 0 ? "Temporarily out of stock!!!" : ""}</p>
                                            </td>
                                            <td>${variant.getProductVariantName()}</td>
                                            <td class="price" data-price="${variant.price}"></td>
                                            <td>
                                                <div class="quantity-container">
                                                    <button type="button" class="btn btn-sm btn-outline-secondary"
                                                            onclick="changeQuantity(this, -1, ${cart.cartID}, ${variant.stockQuantity})"
                                                            ${variant.stockQuantity == 0 ? 'disabled' : ''}>-</button>
                                                    <input type="number" class="quantity text-center" value="${cart.quantity}" min="1"
                                                           onchange="updateTotal()"
                                                           oninput="validateAndUpdateQuantity(this, ${cart.cartID}, ${variant.stockQuantity})"
                                                           ${variant.stockQuantity == 0 ? 'disabled' : ''}>
                                                    <button type="button" class="btn btn-sm btn-outline-secondary"
                                                            onclick="changeQuantity(this, 1, ${cart.cartID}, ${variant.stockQuantity})"
                                                            ${variant.stockQuantity == 0 ? 'disabled' : ''}>+</button>
                                                </div>
                                            </td>
                                            <td class="item-total" data-price="${cart.quantity * variant.price}"></td>
                                            <td><button type="button" class="btn btn-danger btn-sm" onclick="removeItem(${cart.cartID})">DELETE</button></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <input type="hidden" name="cartIDs" id="cartIDs">

                <div class="cart-footer">
                    <div>
                        DELETE All SELECT | <button type="button" class="btn btn-danger btn-sm" onclick="deleteSelectedItems()">Delete</button>
                    </div>
                    <div>
                        Total payment (<span id="total-items">0</span> Products): 
                        <span id="total-price" class="total-price" data-price="0">$0</span>
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="prepareCartForm(event)">Purchase</button>
                </div>
            </form>
        </div>
        <div id="Footer"></div>

        <script>document.addEventListener("DOMContentLoaded", function () {
                function formatPrice(number) {
                    return number.toLocaleString("en-US"); // Định dạng số có dấu phẩy
                }

                function animatePrice(element, value) {
                    let start = 0;
                    let duration = 1000; // 1 giây
                    let step = (value - start) / (duration / 10);

                    let interval = setInterval(() => {
                        start += step;
                        if (start >= value) {
                            start = value;
                            clearInterval(interval);
                        }
                        element.innerText = "$" + formatPrice(Math.floor(start));
                    }, 10);
                }

                function updateTotal() {
                    let total = 0;
                    let count = 0;

                    document.querySelectorAll(".item-checkbox:checked").forEach(item => {
                        let row = item.closest("tr");
                        let price = parseFloat(row.dataset.price.replace(/,/g, "")) || 0;
                        let quantity = parseInt(row.querySelector(".quantity").value) || 0;
                        let itemTotal = price * quantity;

                        // Cập nhật item-total có dấu phẩy
                        let itemTotalElement = row.querySelector(".item-total");
                        animatePrice(itemTotalElement, itemTotal);

                        total += itemTotal;
                        count += quantity;
                    });

                    // Cập nhật total-price với hiệu ứng
                    let totalPriceElement = document.getElementById("total-price");
                    animatePrice(totalPriceElement, total);

                    document.getElementById("total-items").innerText = count;
                }

                // Áp dụng hiệu ứng ban đầu
                document.querySelectorAll(".price, .item-total, .total-price").forEach(priceElement => {
                    let priceValue = priceElement.dataset.price;
                    if (priceValue) {
                        let priceNumber = parseFloat(priceValue.replace(/,/g, ""));
                        if (!isNaN(priceNumber)) {
                            animatePrice(priceElement, priceNumber);
                        }
                    }
                });

                // Gán sự kiện cho checkbox và quantity
                document.querySelectorAll(".item-checkbox, .quantity").forEach(input => {
                    input.addEventListener("change", updateTotal);
                });
            });</script>
        <style>.price {
                display: inline-block;
                font-size: 20px;
                font-weight: bold;
                color: black !important; /* Đảm bảo màu đen */
                text-shadow: none;
                transition: none; /* Bỏ hiệu ứng hover */
            }
            .item-total {
                display: inline-block;
                font-size: 20px;
                font-weight: bold;
                color: red !important; /* Màu đỏ */
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            }
        </style>



        <script>
            document.querySelectorAll(".item-checkbox:checked").forEach(item => {
                let row = item.closest("tr");
                console.log("Row found:", row);
                if (row) {
                    let cartID = row.getAttribute("data-cartid");
                    console.log("Extracted cartID:", cartID);
                }
            });

            function prepareCartForm(event) {
                event.preventDefault();

                let selectedCartItems = [];
                document.querySelectorAll(".item-checkbox:checked").forEach(item => {
                    let row = item.closest("tr");
                    if (row) {
                        let cartID = row.getAttribute("data-cartid");
                        let quantity = row.querySelector(".quantity").value;
                        console.log("Found cartID:", cartID, "Quantity:", quantity);
                        if (cartID && quantity) {
                            selectedCartItems.push(cartID + ":" + quantity); // Ghép cartID và quantity
                        }
                    }
                });

                console.log("Selected Cart Items:", selectedCartItems);

                if (selectedCartItems.length === 0) {
                    alert("Please select at least one product to purchase!");
                    return;
                }

                document.getElementById("cartIDs").value = selectedCartItems.join(","); // Ví dụ: "3:2,9:5,13:1"

                console.log("Hidden input value:", document.getElementById("cartIDs").value);

                document.getElementById("cart-form").submit();
            }




            async function loadComponent(id, file) {
                const response = await fetch(file);
                const content = await response.text();
                document.getElementById(id).innerHTML = content;
            }

            loadComponent("Header", "${pageContext.request.contextPath}/View/Header/Header.jsp");
            loadComponent("Footer", "${pageContext.request.contextPath}/View/Footer/Footer.jsp");



            function changeQuantity(button, amount, cartID, maxQuantity) {
                let input = button.parentElement.querySelector(".quantity");
                let newValue = parseInt(input.value) + amount;
                if (newValue >= 1) {
                    if (newValue > maxQuantity) {
                        alert("You have reached the maximum stock quantity!");
                        input.value = maxQuantity;
                    } else {
                        input.value = newValue;
                    }
                    updateTotal();
                    $.post("${pageContext.request.contextPath}/cart", {action: "update", cartID: cartID, quantity: input.value});

                }
            }

            function removeItem(cartID) {
                if (confirm("Are you sure you want to delete this item?")) {
                    $.post("${pageContext.request.contextPath}/cart", {action: "delete", cartID: cartID}, function () {
                        location.reload();
                    });
                }
            }


            function deleteSelectedItems() {
                let selected = $(".item-checkbox:checked").map(function () {
                    return $(this).closest("tr").data("cartid");
                }).get();

                if (selected.length > 0 && confirm("Are you sure you want to delete the selected items?")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/cart",
                        type: "POST",
                        data: {action: "deleteMultiple", cartIDs: selected},
                        traditional: true, // Quan trọng để gửi mảng đúng cách
                        success: function () {
                            location.reload();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error:", error);
                        }
                    });
                }
            }
            function validateAndUpdateQuantity(input, cartID, maxQuantity) {
                let value = parseInt(input.value);
                if (isNaN(value) || value < 1) {
                    input.value = 1;
                } else if (value > maxQuantity) {
                    alert("You have reached the maximum stock quantity!");
                    input.value = maxQuantity;
                }
                updateTotal();
                $.post("${pageContext.request.contextPath}/cart", {action: "update", cartID: cartID, quantity: input.value});
                location.reload();
            }
            document.getElementById("select-all").addEventListener("change", function () {
                document.querySelectorAll(".item-checkbox").forEach(checkbox => checkbox.checked = this.checked);
                updateTotal();
            });
        </script>
    </body>
</html>
