<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center mb-4">회원가입</h2>
            <form method="post" action="${pageContext.request.contextPath}/signup">
                <div class="form-group">
                    <label for="userid">아이디</label>
                    <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디" required>
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="비밀번호 확인" required>
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="이메일" required>
                </div>
                <div class="form-group">
                    <label for="address">주소</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="주소" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">회원가입</button>
            </form>
            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">로그인</a>
            </div>
        </div>
    </div>
</body>
</html>
