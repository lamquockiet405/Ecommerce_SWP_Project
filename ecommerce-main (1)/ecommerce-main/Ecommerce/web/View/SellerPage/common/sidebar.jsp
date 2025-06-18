<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Shop" %>
<%@ page import="Model.Users" %>
<%@ page import="DAO.DAO_Seller.shop.ShopProcess" %>
<nav class=" d-md-block sidebar p-3" style="background-color: #dbeafe; position: sticky;top: 0; height: 100vh;">
    <% 
        Users user = (Users) request.getSession().getAttribute("acc");
        if (user == null || !user.getUserRole().equalsIgnoreCase("seller")) {
            response.sendRedirect(request.getContextPath() + "/LogOutController");
            return;
        }
        Shop shop = ShopProcess.INSTANCE.getShopByUserId(user.getUserID());
    %>
    <div class="d-flex justify-content-center">
        <%if (shop != null) {%>
        <a href="manager_view_information_shop" class="p-0">
            <img src="<%=shop.getLogo()%> " alt="<%=shop.getName()%>" height="62px" width="62px" class="border rounded-circle"/>
        </a>
        <%} else {%>
        <h5 class="text-center p-3">Shop</h5>
        <%}%>
    </div>
    <hr/>
    <ul class="nav flex-column">
        <li id="product" class="nav-item  mb-3 mt-3">
            <button class="btn btn-toggle dropdown-toggle" data-bs-toggle="collapse" data-bs-target="#home-collapse">
                Manager Products
            </button>
            <div class="collapse" id="home-collapse" style="margin-left: 12px;">
                <a href="${pageContext.request.contextPath}/view_product">View list product</a>
                <a href="${pageContext.request.contextPath}/add_new_product">Add new product</a>
            </div>
        </li>
        <li id="order" class="nav-item mb-3">
            <button class="btn btn-toggle dropdown-toggle" data-bs-toggle="collapse" data-bs-target="#order-collapse">
                Manager Orders
            </button>
            <div class="collapse" id="order-collapse" style="margin-left: 12px;">
                <a href="manager_view_list_order">View list order</a>
            </div>
        </li>
        <li id="shop" class="nav-item mb-3">
            <button class="btn btn-toggle dropdown-toggle" data-bs-toggle="collapse" data-bs-target="#shop-collapse">
                Manager Shop
            </button>
            <div class="collapse" id="shop-collapse" style="margin-left: 12px;">
                <a href="manager_view_information_shop">View Shop</a>
            </div>
        </li>
    </ul>
</nav>

<script>
    let currentURL = window.location.href;
    function updateActiveSidebar() {
        const sectionsLocation = ["product", "order", "shop"];
        // Xóa tất cả class active trước khi thêm mới
        document.querySelectorAll(".nav-item button").forEach(button => {
            button.classList.remove("active__sidebar");
        });
        for (s of sectionsLocation) {
            if (currentURL.includes(s)) {
                let productButton = document.querySelector("#" + s + " button");
                if (productButton) {
                    productButton.classList.add("active__sidebar");
                }
            }
        }
    }

    function updateActiveSidebarItem() {
        const menuLinks = document.querySelectorAll(".nav-item .collapse a");
        // Xóa tất cả class active trước khi thêm mới
        menuLinks.forEach(link => link.classList.remove("active__sidebar__tiem"));
        // Lặp qua các thẻ <a> để kiểm tra nếu URL hiện tại khớp với href của nó
        menuLinks.forEach(link => {
            if (currentURL.includes(link.getAttribute("href"))) {
                link.classList.add("active__sidebar__tiem");

                // Tìm phần tử collapse cha của thẻ <a> và mở nó
                let collapseDiv = link.closest(".collapse");
                if (collapseDiv) {
                    collapseDiv.classList.add("show"); // Bootstrap mở menu

                    // Tìm button dropdown liên quan và đặt trạng thái mở
                    let dropdownButton = collapseDiv.previousElementSibling;
                    if (dropdownButton) {
                        dropdownButton.setAttribute("aria-expanded", "true");
                    }
                }
            }
        });
    }

    // Gọi hàm khi trang tải
    document.addEventListener("DOMContentLoaded", function () {
        updateActiveSidebar();
        updateActiveSidebarItem();
    });

</script>
