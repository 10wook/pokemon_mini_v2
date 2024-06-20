<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <h2 class="text-center mb-4">주문</h2>
    <c:forEach var="item" items="${orderItems}">
        <div class="row mb-4">
            <div class="col-md-8">
                <h5>${item.name}</h5>
                <p>${item.description}</p>
            </div>
            <div class="col-md-4">
                <button class="btn btn-danger">삭제</button>
            </div>
        </div>
    </c:forEach>
    <c:if test="${empty orderItems}">
        <p class="text-center">주문 항목이 없습니다.</p>
    </c:if>
    <div class="text-center mt-4">
        <button class="btn btn-primary">주문하기</button>
    </div>
</div>
