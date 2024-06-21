<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row">
    <c:forEach var="i" begin="1" end="15">
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">제품 ${i}</h5>
                    <p class="card-text">이것은 제품 ${i}의 설명입니다.</p>
                    <a href="${pageContext.request.contextPath}/productDetail?productId=${i}" class="btn btn-primary">자세히 보기</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
