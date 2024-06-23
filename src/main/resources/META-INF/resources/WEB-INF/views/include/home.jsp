<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .product-image {
            width: 100%; /* 이미지 너비를 카드 너비에 맞춤 */
            height: 200px; /* 고정된 높이 설정 */
            object-fit: cover; /* 이미지 크기를 조절하면서 비율 유지 */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1></h1>
        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <img src="${pageContext.request.contextPath}/images/${product.imageUrl}" alt="${product.name}" class="product-image">
                            <a href="${pageContext.request.contextPath}/productDetail?productId=${product.id}" class="btn btn-primary">자세히 보기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
