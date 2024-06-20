
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 상세</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <div class="container mt-5">
        <h1>상품 상세 정보</h1>
        <div class="card">
            <div class="card-header">
                <h3>${productDetail.name}</h3>
            </div>
            <div class="card-body">
                <p><strong>카테고리:</strong> ${productDetail.category}</p>
                <p><strong>상세 내용:</strong> ${productDetail.description}</p>
                <p><strong>가격:</strong> ${productDetail.price} 원</p>
                <c:if test="${not empty productDetail.imageUrl}">
                    <img src="${productDetail.imageUrl}" alt="${productDetail.name}" class="img-fluid">
                </c:if>
            </div>
        </div>
    </div>

   
    <script>
        window.addEventListener('load', function() {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('.detail-container').style.paddingTop = headerHeight+30 + 'px';
        });
    </script>

</body>
</html>
