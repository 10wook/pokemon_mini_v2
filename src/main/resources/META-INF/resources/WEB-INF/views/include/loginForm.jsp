<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="row justify-content-center">
    <div class="col-md-6">
        <h2 class="text-center mb-4">로그인</h2>
        <form method="post" action="${pageContext.request.contextPath}/auth">
            <div class="form-group">
                <label for="userid">아이디</label>
                <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
        </form>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/forgotId">아이디 찾기</a> |
            <a href="${pageContext.request.contextPath}/forgotPassword">비밀번호 찾기</a>
        </div>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/signup" class="btn btn-secondary">회원 가입</a>
        </div>
    </div>
</div>
