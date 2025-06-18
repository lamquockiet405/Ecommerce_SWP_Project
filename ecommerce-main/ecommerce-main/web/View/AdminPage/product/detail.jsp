<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<main class="container border p-3 rounded shadow my-4">
    <h2 class="mb-4 text-center">Product Detail</h2>

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
                <c:forEach var="pv" items="${productVariantList}">
                    <tr class="text-center align-middle">
                        <td>
                            <img src="${pv.image}" class="border rounded p-1" alt="Variant Image">
                        </td>
                        <td>${pv.productVariantName}</td>
                        <td>${pv.price}</td>
                        <td>${pv.stockQuantity}</td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Action Buttons -->
    <div class="d-flex justify-content-center mt-4">
        <c:if test="${product.status == 3}">
            <form action="view_detail_product" method="post" style="display: inline;">
                <input type="hidden" name="pid" value="${product.productId}">
                <input type="hidden" name="pud" value="1">
                <button type="submit" class="btn btn-success me-3">Active</button>
            </form>
            <form action="view_detail_product" method="post" style="display: inline;">
                <input type="hidden" name="pid" value="${product.productId}">
                <input type="hidden" name="pud" value="2">
                <button type="submit" class="btn btn-danger me-3">Violating</button>
            </form>
        </c:if>
        <c:if test="${product.status == 2}">
            <form action="view_detail_product" method="post" style="display: inline;">
                <input type="hidden" name="pid" value="${product.productId}">
                <input type="hidden" name="pud" value="1">
                <button type="submit" class="btn btn-success me-3">Change to active</button>
            </form>
        </c:if>
        <c:if test="${product.status == 1}">
            <form action="view_detail_product" method="post" style="display: inline;">
                <input type="hidden" name="pid" value="${product.productId}">
                <input type="hidden" name="pud" value="2">
                <button type="submit" class="btn btn-danger me-3">Change to violating</button>
            </form>
        </c:if>
        <a href="mange_product" class="btn btn-secondary">Back to List</a>
    </div>
</main>
