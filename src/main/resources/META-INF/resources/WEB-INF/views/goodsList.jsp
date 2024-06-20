<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
      <title>상품 목록</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.1.3/css/bootstrap.min.css' />">
</head>
<body>
    <div class="container">
        <h1>상품 목록</h1>
        <table class="table">
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
                <c:forEach items="${goodsList}" var="goods">
                    <tr>
                        <td>${goods.gCode}</td>
                        <td>${goods.gCategory}</td>
                        <td>${goods.gName}</td>
                        <td>${goods.gContent}</td>
                        <td>${goods.gPrice}</td>
                        <td><img src="${goods.gImage}" alt="상품 이미지" width="100"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/goods/form" class="btn btn-primary">상품 등록</a>
    </div>
</body>
</html>