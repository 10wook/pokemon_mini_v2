<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
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
                    <a href="${pageContext.request.contextPath}/signup" class="btn btn-secondary">회원 가입</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
