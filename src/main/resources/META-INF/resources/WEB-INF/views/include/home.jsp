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
        .card-body {
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* 내용 사이의 공간을 균등하게 분배 */
            flex-grow: 1;
        }
        .card-text {
            flex-grow: 1;
        }
        .btn-primary {
            width: 100%; /* 기본적으로 버튼을 카드 너비에 맞춤 */
            box-sizing: border-box; /* 패딩과 보더를 너비 계산에 포함 */
            margin: 0; /* 추가적인 여백 제거 */
            color: white; /* 글씨 색을 하얀색으로 변경 */
            background-color: red; /* 버튼 배경색을 빨강으로 변경 */
            border: none; /* 버튼 테두리 없애기 */
        }
        .card {
            border: 1px solid #ccc; /* 회색선 유지 */
            height: 100%;
        }
        .btn-container {
            padding: 0; /* 버튼과 테두리 사이의 여백 제거 */
            display: flex;
            justify-content: center; /* 버튼을 가운데 정렬 */
            align-items: center; /* 버튼을 수직 가운데 정렬 */
            height: auto; /* 높이를 자동으로 조정 */
            background-color: #DA343C;
            color:white;
        }

        /* 창 크기가 768px 이하일 때 */
        @media (max-width: 768px) {
            .btn-primary {
                width: 90%; /* 버튼 너비를 카드 너비의 90%로 조정 */
            }
        }

        /* 창 크기가 576px 이하일 때 */
        @media (max-width: 576px) {
            .btn-primary {
                width: 80%; /* 버튼 너비를 카드 너비의 80%로 조정 */
            }
        }
    </style>
</head>
<body>
    <div class="container">

        <div class="row">
            <c:forEach var="product" items="${products}">
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.description}</p>
                            <img src="${pageContext.request.contextPath}/images/${product.imageUrl}" alt="${product.name}" class="product-image mb-3">
                            <div class="btn-container">
                                <a href="${pageContext.request.contextPath}/productDetail?productId=${product.id}" class="btn-container">자세히 보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
