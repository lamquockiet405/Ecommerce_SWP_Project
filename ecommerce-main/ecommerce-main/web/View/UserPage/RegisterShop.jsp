
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #d9534f;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        input, button, select, textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #d9534f;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #c9302c;
        }
        .btn-group {
            display: flex;
            justify-content: space-between;
        }
        .btn-group button {
            width: 48%;
        }

        /* Popup Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background: white;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="registerShopForm" action="/Ecommerce_SWP/RegisterShop" method="post" enctype="multipart/form-data" onsubmit="return validateShopForm()">
    <div class="container">
        <h2>Shop Information</h2>
        <label for="shop-name">Shop Name</label>
        <input type="text" id="shop-name" name="ShopName" placeholder="Input Shop Name" required="">
        <span id="shopNameError" class="error-message"></span>
        
        <label for="tax">Tax</label>
        <input type="text" id="tax" name="tax" placeholder="Input Tax" value="" required="">
        <span id="taxError" class="error-message"></span>
        
        <label for="describe">Shop Describe</label>
        <input type="text" id="describe" name="describe" placeholder="Input Shop Describe" required="">
        <span id="describeError" class="error-message"></span>
       
        
        <!-- Hiển thị ảnh đã chọn -->
        <div id="image-preview" style="margin-top: 10px;">
            <img id="preview" src="" alt="Shop Logo Image" style="max-width: 200px; display: none;">
        </div>

        <div class="btn-group">
            <button type="reset">Cancel</button>
            <button type="submit">Submit</button>
        </div>
    </div>
</form>
    
    
<script>
    function validateShopForm() {
        let isValid = true;

        // Validate Shop Name (ít nhất 10 ký tự)
        let shopName = document.getElementById("shop-name").value;
        if (shopName.length < 10) {
            document.getElementById("shopNameError").innerText = "Tên shop phải có ít nhất 10 ký tự.";
            isValid = false;
        } else {
            document.getElementById("shopNameError").innerText = "";
        }

        // Validate Tax Code (chỉ được 10 số)
        let tax = document.getElementById("tax").value;
        if (!/^\d{10}$/.test(tax)) {
            document.getElementById("taxError").innerText = "Mã số thuế phải có đúng 10 chữ số.";
            isValid = false;
        } else {
            document.getElementById("taxError").innerText = "";
        }

        // Validate Shop Description (ít nhất 50 ký tự)
        let describe = document.getElementById("describe").value;
        if (describe.length < 50) {
            document.getElementById("describeError").innerText = "Mô tả cửa hàng phải có ít nhất 50 ký tự.";
            isValid = false;
        } else {
            document.getElementById("describeError").innerText = "";
        }

        return isValid;
    }
    </script>
    
    <script>
    function previewImage(event) {
        var input = event.target;
        var reader = new FileReader();

        reader.onload = function() {
            var imgElement = document.getElementById("preview");
            imgElement.src = reader.result;
            imgElement.style.display = "block"; // Hiển thị ảnh sau khi chọn
        };

        if (input.files && input.files[0]) {
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<style>
    .error-message {
        color: red;
        font-size: 14px;
    }
</style>


</body>
</html>
