<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- CSS 링크 추가 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <header id="hd" class="page-pokemon">
        <h1>
            <a href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/images/main_logo.png" alt="pokemon"></a>
        </h1>
        <div class="container flex-justify-space">
            <button type="button" class="js-mn no-style" title="메뉴열기/닫기">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <nav id="gnb">
                <ul class="gnb">
                    <li>
                        <a href="${pageContext.request.contextPath}/home?query=인형" class="warning">
                            <div style="display: flex; flex-direction: column; align-items: center;">
                                <img src="${pageContext.request.contextPath}/images/sub.png" alt="대타출동">
                                <span>인형</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/home?query=피규어" class="primary">
                            <div style="display: flex; flex-direction: column; align-items: center;">
                                <img src="${pageContext.request.contextPath}/images/658.png" alt="개굴닌자">
                                <span>피규어</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/home?query=배지" class="secondary">
                            <div style="display: flex; flex-direction: column; align-items: center;">
                                <img src="${pageContext.request.contextPath}/images/Bag_Choice_Specs_Sprite.png" alt="구애안경">
                                <span>악세사리</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/home" class="danger">
                            <div style="display: flex; flex-direction: column; align-items: center;">
                                <img src="${pageContext.request.contextPath}/images/icon_ball.png" alt="상품 아이콘">
                                <span>전체상품</span>
                            </div>
                        </a>
                    </li>
                    <li class="d-lg-none d-block">
                        <a href="${pageContext.request.contextPath}/cart">
                            <div style="display: flex; flex-direction: column; align-items: center;">
                                <img src="${pageContext.request.contextPath}/images/icon_ball_c.png" alt="포켓몬 도감 아이콘">
                                <span>장바구니</span>
                            </div>
                        </a>
                    </li>
                    <li class="d-lg-none d-block">
                        <a href="http://www.pokemonstore.co.kr" target="_blank" class="btn-store">
                            <div style="display: flex; flex-direction: column; align-items: center;">
                                <img src="${pageContext.request.contextPath}/images/icon_poke.png" alt="포켓몬 스토어 아이콘" class="mr-2">
                                <span>포켓몬 스토어</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </nav>
            <ul id="acc">
                <li class="d-lg-block d-none">
                    <a href="${pageContext.request.contextPath}/cart">
                        <div style="display: flex; flex-direction: column; align-items: center;">
                            <img src="${pageContext.request.contextPath}/images/icon_ball.png" alt="포켓몬 도감 아이콘">
                            <span>장바구니</span>
                        </div>
                    </a>
                </li>
                <c:choose>
                    <c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT}">
                        <li>
                            <a href="${pageContext.request.contextPath}/logout">
                                <div style="display: flex; flex-direction: column; align-items: center;">
                                    <img src="${pageContext.request.contextPath}/images/icon_logout.png" alt="로그아웃 아이콘">
                                    <span>로그아웃</span>
                                </div>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="${pageContext.request.contextPath}/login">
                                <div style="display: flex; flex-direction: column; align-items: center;">
                                    <img src="${pageContext.request.contextPath}/images/icon_login.png" alt="로그인 아이콘">
                                    <span>로그인</span>
                                </div>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li>
                    <button type="button" id="tsearchbtn" class="no-style collapsed" data-toggle="collapse" data-target="#search">
                        <div style="display: flex; flex-direction: column; align-items: center;">
                            <img src="${pageContext.request.contextPath}/images/icon_search.png" alt="검색 아이콘">
                            <span>통합검색</span>
                        </div>
                    </button>
                </li>
            </ul>
        </div>
        <a href="http://www.pokemonstore.co.kr" target="_blank" class="btn-store d-lg-flex d-none">
            <div style="display: flex; flex-direction: column; align-items: center;">
                <img src="${pageContext.request.contextPath}/images/icon_poke.png" alt="포켓몬 스토어 아이콘" class="mr-2">
                <span>포켓몬 스토어</span>
            </div>
        </a>
        <div id="search" class="collapse">
            <div class="search-wrp">
                <form action="${pageContext.request.contextPath}/home" method="get" style="display: flex; align-items: center;">
                    <input type="text" placeholder="검색어를 입력해주세요" name="query" id="query" onkeypress="if(event.keyCode==13) {this.form.submit(); return false;}" value="">
                    <button type="submit" class="no-style btn-search"><p class="sr-only">검색</p></button>
                </form>
                <button tabindex="button" data-toggle="collapse" data-target="#search" class="no-style btn-close"><p class="sr-only">닫기</p></button>
            </div>
        </div>
    </header>

    <!-- JS 링크 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/js/swiper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
</body>
</html>
