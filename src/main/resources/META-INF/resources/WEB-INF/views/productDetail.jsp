<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 상세</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" type="text/css">
    <style>
        .detail-container {
            padding-top: 0; /* JavaScript로 동적으로 설정할 예정 */
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <div class="container detail-container">
        <table id="goodsTable" class="card">
            <thead>
                <tr>
                    <th>상품 코드</th>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>상세 내용</th>
                    <th>가격</th>
                    <th>이미지</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="goodss" items="${goodsList}">
                    <tr>
                        <td>${goods.id}</td>
                        <td>${goods.category}</td>
                        <td>${goods.name}</td>
                        <td>${goods.description}</td>
                        <td>${goods.price}</td>
                        <td><img src="${goods.imageUrl}" alt="상품 이미지" style="max-width: 100px;"></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <script>
        window.addEventListener('load', function() {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('.detail-container').style.paddingTop = headerHeight + 'px';
        });
    </script>
</body>
</html>
