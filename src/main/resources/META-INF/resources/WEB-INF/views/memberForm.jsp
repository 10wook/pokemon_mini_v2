<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" type="text/css">
    <style>
        .signup-container {
            padding-top: 0; /* JavaScript로 동적으로 설정할 예정 */
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <div class="container signup-container">
        <%@ include file="/WEB-INF/views/include/memberForm.jsp" %>
    </div>
    <script>
        window.addEventListener('load', function() {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('.signup-container').style.paddingTop = headerHeight + 'px';
        });
    </script>
</body>
</html>
