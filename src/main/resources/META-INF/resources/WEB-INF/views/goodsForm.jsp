<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
     <title>상품 등록</title>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/5.1.3/css/bootstrap.min.css' />">
</head>
<body>
    <div class="container">
        <h2>상품 등록</h2>
        <form action="<c:url value='/goods/save' />" method="post">
            <div class="form-group">
                <label for="gCode">상품 코드</label>
                <input type="text" class="form-control" id="gCode" name="gCode" required>
            </div>
            <div class="form-group">
                <label for="gCategory">카테고리</label>
                <input type="text" class="form-control" id="gCategory" name="gCategory" required>
            </div>
            <div class="form-group">
                <label for="gName">상품명</label>
                <input type="text" class="form-control" id="gName" name="gName" required>
            </div>
            <div class="form-group">
                <label for="gContent">상세 내용</label>
                <input type="text" class="form-control" id="gContent" name="gContent" required>
            </div>
            <div class="form-group">
                <label for="gPrice">가격</label>
                <input type="number" class="form-control" id="gPrice" name="gPrice" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="gImage">이미지 URL</label>
                <input type="text" class="form-control" id="gImage" name="gImage">
            </div>
            <button type="submit" class="btn btn-primary">상품 등록</button>
        </form>
    </div>
</body>
</html>