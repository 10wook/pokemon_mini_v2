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
        <h1>상품 등록</h1>
        <form:form method="post" action="/goods/add" modelAttribute="goods">
            <div class="form-group">
                <label for="gCode">상품 코드</label>
                <form:input path="gCode" id="gCode" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="gCategory">카테고리</label>
                <form:input path="gCategory" id="gCategory" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="gName">상품명</label>
                <form:input path="gName" id="gName" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="gContent">상세 내용</label>
                <form:input path="gContent" id="gContent" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="gPrice">가격</label>
                <form:input path="gPrice" id="gPrice" class="form-control" required/>
            </div>
            <div class="form-group">
                <label for="gImage">이미지 URL</label>
                <form:input path="gImage" id="gImage" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">등록</button>
        </form:form>
    </div>
</body>
</html>