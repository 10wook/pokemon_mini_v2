<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.4.2/css/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <style>
        .order-container {
            padding-top: 0; /* JavaScript로 동적으로 설정할 예정 */
        }
        .btn-small {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            width: 40px; /* 가로 크기를 줄이기 위해 추가 */
        }
        .product-image {
            max-width: 100px; /* 이미지 너비를 설정 */
            height: auto; /* 이미지 높이를 자동으로 설정 */
        }
        #payQR, #nextButton {
            display: none;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <div class="container order-container">
       
        <table class="table">
            <thead>
                <tr>
                    <th>상품번호</th>
                    <th>이미지</th>
                    <th>수량</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody id="orderContents">
            
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3" class="text-right"><strong>총합 가격:</strong></td>
                    <td id="totalPrice"></td>
                </tr>
            </tfoot>
        </table>
        <button type="button" class="btn btn-primary mt-3" id="orderButton" onclick="showPaymentOptions()">결제하기</button>
        <div id="paymentOptions">
            <img id="payQR" src="${pageContext.request.contextPath}/images/payQR.png" alt="QR Code for Payment" class="mt-3">
            <button type="button" class="btn btn-secondary mt-3" id="nextButton" onclick="goToNext()">다음으로</button>
        </div>
    </div>
    <script>
        // 쿠키 읽기 함수
        function getCookie(name) {
            var nameEQ = name + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
            }
            return null;
        }

        // 주문 내용 표시
        function displayOrder() {
            var cart = getCookie("cart");
            if (cart) {
                cart = JSON.parse(cart);
                var orderContents = document.getElementById("orderContents");
                var totalPrice = 0;
                orderContents.innerHTML = "";
                cart.forEach(function(item) {
                    var row = document.createElement("tr");
                    var cell1 = document.createElement("td");
                    cell1.textContent = item.productId;
                    
                    var cell2 = document.createElement("td");
                    var img = document.createElement("img");
                    img.src = "${pageContext.request.contextPath}/images/" + item.imageUrl;
                    img.alt = item.productId;
                    img.className = "product-image";
                    cell2.appendChild(img);

                    var cell3 = document.createElement("td");
                    cell3.textContent = item.quantity;

                    var cell4 = document.createElement("td");
                    var price = item.price * item.quantity;
                    cell4.textContent = price + " 원";

                    totalPrice += price;

                    row.appendChild(cell1);
                    row.appendChild(cell2);
                    row.appendChild(cell3);
                    row.appendChild(cell4);
                    orderContents.appendChild(row);
                });
                document.getElementById("totalPrice").textContent = totalPrice + " 원";
            } else {
                document.getElementById("orderContents").innerHTML = "<tr><td colspan='4'>장바구니가 비었습니다.</td></tr>";
                document.getElementById("totalPrice").textContent = "0 원";
            }
        }

        function showPaymentOptions() {
            document.getElementById("orderButton").style.display = 'none';
            document.getElementById("payQR").style.display = 'block';
            document.getElementById("nextButton").style.display = 'block';
        }

        function goToNext() {
            var cart = getCookie("cart");
            if (cart) {
                alert("주문이 완료되었습니다. 감사합니다!");
                // 쿠키 삭제
                document.cookie = "cart=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
                window.location.href = "${pageContext.request.contextPath}/home";
            } else {
                alert("장바구니가 비었습니다.");
            }
        }

        // 페이지 로드 시 주문 내용 표시
        window.addEventListener('load', function() {
            var headerHeight = document.querySelector('header').offsetHeight;
            document.querySelector('.order-container').style.paddingTop = headerHeight + 'px';
            displayOrder();
        });
    </script>
</body>
</html>
