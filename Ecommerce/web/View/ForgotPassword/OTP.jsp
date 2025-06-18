<%-- 
    Document   : OTP
    Created on : Jul 20, 2024, 9:52:04 PM
    Author     : ViQuan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Enter OTP</title>
    </head>
    <body>
        <div class="full-page"> 
            <div class="containerOTP">
                <div id="countdown" class="countdown"></div>
                <h1 style="display: block;    color: black;">Enter OTP</h1>
                <p>Please enter the OTP that has been sent to your email.</p>
                <form id="otp-form" action="${pageContext.request.contextPath}/Otp" method="post">
                    <div class="otp-inputs">
                        <input type="text" id="otp1" maxlength="1" inputmode="numeric">
                        <input type="text" id="otp2" maxlength="1" inputmode="numeric">
                        <input type="text" id="otp3" maxlength="1" inputmode="numeric">
                        <input type="text" id="otp4" maxlength="1" inputmode="numeric">
                        <input type="text" id="otp5" maxlength="1" inputmode="numeric">
                        <input type="text" id="otp6" maxlength="1" inputmode="numeric">
                    </div>
                    <!-- Input ẩn để gửi OTP hợp nhất -->
                    <input type="hidden" id="otp-hidden" name="otp">
                    <div id="message" class="message"></div>
                    <button type="submit">Confirm</button>
                </form>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#otp-form').submit(function (event) {
            event.preventDefault(); // Ngăn form gửi mặc định

            let otpValue = '';
            for (let i = 1; i <= 6; i++) {
                otpValue += $('#otp' + i).val();
            }

            $.ajax({
                url: '${pageContext.request.contextPath}/Otp',
                type: 'POST',
                data: { otp: otpValue },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        window.location.href = response.redirect; // Chuyển trang nếu đúng OTP
                    } else {
                        $('#message').text(response.error).css('color', 'red'); // Hiển thị lỗi
                    }
                },
                error: function () {
                    $('#message').text('An error occurred. Please try again.').css('color', 'red');
                }
            });
        });
    });
</script>

    </body>



</html>