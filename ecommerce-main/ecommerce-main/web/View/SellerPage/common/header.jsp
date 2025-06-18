<%@ page import="Model.Shop" %>
<%@ page import="Model.Users" %>
<%@ page import="DAO.DAO_Seller.shop.ShopProcess" %>

<header class="p-3 mb-3 shadow" style="background: #fdba74; position: sticky;top: 0; z-index: 1000;">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="view_product" class="d-flex align-items-center mb-2 me-4 mb-lg-0 text-dark text-decoration-none">
                <% 
                    Users user = (Users) request.getSession().getAttribute("acc");
                    if (user == null || !user.getUserRole().equalsIgnoreCase("seller")) {
                        response.sendRedirect(request.getContextPath() + "/LogOutController");
                        return;
                    }
                    Shop shop = ShopProcess.INSTANCE.getShopByUserId(user.getUserID());
                %>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li class="me-3 fs-5 fw-bold"><a href="view_product" class="nav-link px-2 " style="color: #000">Home</a></li>
                <li class="me-3 fs-5 fw-bold"><a href="manager_view_list_order" class="nav-link px-2 " style="color: #000">Order</a></li>
                <li class="dropdown me-3 fs-5 fw-bold">
                    <a href="#" class="nav-link px-2 d-block text-decoration-none dropdown-toggle" style="color: #000" id="dropdownProduct" data-bs-toggle="dropdown" aria-expanded="false">
                        Product
                    </a>
                    <ul class="dropdown-menu text-small"  aria-labelledby="dropdownProduct" style="">
                        <li><a class="dropdown-item" href="view_product">View list product</a></li>
                        <li><a class="dropdown-item" href="add_new_product">Add new product</a></li>
                    </ul>
                </li>
                <li class="me-3 fs-5 fw-bold"><a href="manager_view_information_shop" class="nav-link px-2 " style="color: #000">Shop</a></li>
            </ul>
            <div class="d-flex text-decoration-none align-items-center">
                <a href="Home.jsp" class="nav-link px-2 me-5" style="color: #000">Back to shopping page</a>
                <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" style="color: #000" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="<%=user.getImage()%>" alt="mdo" width="62px" height="62px" class="rounded-circle">
                    </a>
                    <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                        <li><a class="dropdown-item" href="manager_view_information_shop">View shop</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="LogOutController">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>