<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <style>
        .cart-container {
            padding-top: 0; /* JavaScript로 동적으로 설정할 예정 */
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <div class="container cart-container">
        <%@ include file="/WEB-INF/views/include/cart.jsp" %>
    </div>
    <script>
        window.addEventListener('load', function() {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('.cart-container').style.paddingTop = headerHeight + 'px';
        });
    </script>
</body>
</html>
