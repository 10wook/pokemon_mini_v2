<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
    <h2 class="text-center mb-4">장바구니</h2>
    <c:forEach var="item" items="${cartItems}">
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
    <c:if test="${empty cartItems}">
        <p class="text-center">장바구니가 비어 있습니다.</p>
    </c:if>
</div>
