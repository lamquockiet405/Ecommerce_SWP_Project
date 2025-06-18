<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form method="post" action="manager_view_list_order">
    <main class="container border shadow" style="border-radius: 5px;">
        <div class="row p-2 border-bottom">
            <span class="col-md-1 text-center"><b>No.</b></span>
            <span class="col-md text-center"><b>Customer Name</b></span>
            <span class="col-md text-center"><b>Name Product</b></span>
            <span class="col-md text-center"><b>Variant</b></span>
            <span class="col-md text-center"><b>Quantity Total</b></span>
            <span class="col-md text-center"><b>Date add</b></span>
            <span class="col-md-1 text-center"><b>Action</b></span>
        </div>
         <c:set var="id" value="0" />
        <c:set var="url" value="view_detail_orderitem" />
        <c:forEach var="oi" items="${orderItemList}" varStatus="status">
            <div class="row p-2 border-bottom align-items-center mt-3">
                <!-- Order id -->
                <c:set var="id" value="${status.count}"/>
                <span class="col-md-1 text-center">
                    ${id}
                </span>
                <!-- Customer Name -->
                <span class="col-md text-center">
                    ${oi.customerName}
                </span>
                <!-- Name Product -->
                <span class="col-md text-center">
                    ${oi.productName}
                </span>
                <!-- Variant -->
                <span class="col-md text-center">
                    ${oi.productVariantName}
                </span>
                <!--Quantity Total-->
                <span class="col-md text-center">
                    ${oi.quantityTotal}
                </span>
                <!--Date add-->
                <span class="col-md text-center">
                    ${oi.dateAdd}
                </span>
                <!-- Action -->
                <span class="col-md-1 text-center">
                    <a href="manager-view-detail-order?pid=${oi.productId}&pvid=${oi.productVariantId}&oiid=${oi.orderItemId}" class="btn btn-warning">Detail</a>
                </span>
            </div>
        </c:forEach>

    </main>
</form>