<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main class="container border p-3 rounded shadow my-4">

    <div class="row">
        <!-- Product Images -->
        <div class="col-md-6">
            <h5 class="fw-bold mb-3">Product Images</h5>
            <div class="row" id="image-preview">
                <c:forEach var="img" items="${productImages}">
                    <div class="col-3 mb-3 d-flex justify-content-center align-items-center">
                        <img src="${img.image}" class="product-image border rounded p-1" style="max-width: 100%; height: auto;" alt="Product Image">
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Product Information -->
        <div class="col-md-6">
            <div class="mb-3">
                <label class="form-label fw-bold">Product Name</label>
                <p class="form-control">${product.productName}</p>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Category</label>
                <p class="form-control">${categoryProcess.getCategoryByID(product.categoryId).categoryName}</p>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Description</label>
                <div class="form-control" style="min-height: 100px; white-space: pre-wrap;">${product.description}</div>
            </div>
        </div>
    </div>

    <!-- Product Variants -->
    <div class="mt-4">
        <h5 class="fw-bold mb-3">Product Variants</h5>
        <table class="table table-bordered variant-table">
            <thead>
                <tr class="text-center">
                    <th>Variant Image</th>
                    <th>Variant Name</th>
                    <th>Price</th>
                    <th>Stock Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr class="text-center align-middle">
                    <td>
                        <img src="${productVariant.image}" style="max-height: 100px; object-fit: contain;" class="border rounded p-1" alt="Variant Image">
                    </td>
                    <td>${productVariant.productVariantName}</td>
                    <td>${productVariant.price}</td>
                    <td>${productVariant.stockQuantity}</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- Action Buttons -->
    <div class="d-flex justify-content-center mt-4">
        <c:if test="${oist == 2}">
            <form action="manager-view-detail-order" method="post" style="display: inline;">
                <input type="hidden" name="oiid" value="${oiid}">
                <input type="hidden" name="oist" value="1">
                <button type="submit" class="btn btn-success me-3">Delivered</button>
            </form>
            <form action="manager-view-detail-order" method="post" style="display: inline;">
                <input type="hidden" name="oiid" value="${oiid}">
                <input type="hidden" name="oist" value="0">
                <button type="submit" class="btn btn-danger me-3">Cancelled</button>
            </form>
        </c:if>
        
        <a href="manager_view_list_order" class="btn btn-secondary">Back to List</a>
    </div>
</main>
