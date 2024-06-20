<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        #qr-code-container {
            display: none;
            margin-top: 20px;
            text-align: center;
        }
    </style>
    <script>
        function showQRCode(totalAmount) {
            document.getElementById('qr-code-container').style.display = 'block';
            document.getElementById('total-amount').innerText = "총 결제 금액: " + totalAmount + "원";
        }

        function showThankYouMessage() {
            alert("감사합니다, 입금 확인 후 상품 발송까지 시간이 걸릴 수 있습니다.");
        }
    </script>
</head>
<body>
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
            <button class="btn btn-primary" onclick="showQRCode(${totalAmount})">주문하기</button>
        </div>
        <div id="qr-code-container">
            <img src="${pageContext.request.contextPath}/images/payQR.png" alt="QR 코드">
            <p id="total-amount"></p>
            <div class="text-center mt-4">
                <button class="btn btn-success" onclick="showThankYouMessage()">다음으로</button>
            </div>
        </div>
    </div>
</body>
</html>
