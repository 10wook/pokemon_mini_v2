<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <style>
        .btn-small {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
            width: 40px; /* 가로 크기를 줄이기 위해 추가 */
        }
        .product-image {
            max-width: 100px; /* 이미지 너비를 설정 */
            height: auto; /* 이미지 높이를 자동으로 설정 */
        }
    </style>
</head>
<body>
    <div class="container mt-5">

        <table class="table">
            <thead>
                <tr>
                    <th>상품번호</th>
                    <th>이미지</th>
                    <th>수량</th>
                    <th>수정</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody id="cartContents">
            
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="4" class="text-right"><strong>총합 가격:</strong></td>
                    <td id="totalPrice"></td>
                </tr>
            </tfoot>
        </table>
       
        <a href="${pageContext.request.contextPath}/order" class="btn btn-primary">주문하기</a>
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

        // 쿠키 설정 함수
        function setCookie(name, value, days) {
            var expires = "";
            if (days) {
                var date = new Date();
                date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + (value || "") + expires + "; path=/";
        }

        // 장바구니 내용 표시
        function displayCart() {
            var cart = getCookie("cart");
            if (cart) {
                cart = JSON.parse(cart);
                var cartContents = document.getElementById("cartContents");
                var totalPrice = 0;
                cartContents.innerHTML = "";
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
                    var decreaseButton = document.createElement("button");
                    decreaseButton.textContent = "-";
                    decreaseButton.className = "btn btn-outline-secondary btn-small";
                    decreaseButton.onclick = function() { updateQuantity(item.productId, -1); };

                    var increaseButton = document.createElement("button");
                    increaseButton.textContent = "+";
                    increaseButton.className = "btn btn-outline-secondary btn-small";
                    increaseButton.onclick = function() { updateQuantity(item.productId, 1); };

                    cell4.appendChild(decreaseButton);
                    cell4.appendChild(increaseButton);

                    var cell5 = document.createElement("td");
                    var price = item.price * item.quantity;
                    cell5.textContent = price + " 원";

                    totalPrice += price;

                    row.appendChild(cell1);
                    row.appendChild(cell2);
                    row.appendChild(cell3);
                    row.appendChild(cell4);
                    row.appendChild(cell5);
                    cartContents.appendChild(row);
                });
                document.getElementById("totalPrice").textContent = totalPrice + " 원";
            } else {
                document.getElementById("cartContents").innerHTML = "<tr><td colspan='5'>장바구니가 비었습니다.</td></tr>";
                document.getElementById("totalPrice").textContent = "0 원";
            }
        }

        // 수량 업데이트 함수
        function updateQuantity(productId, change) {
            var cart = getCookie("cart");
            if (cart) {
                cart = JSON.parse(cart);
                for (var i = 0; i < cart.length; i++) {
                    if (cart[i].productId == productId) {
                        cart[i].quantity = parseInt(cart[i].quantity) + change;
                        if (cart[i].quantity <= 0) {
                            cart.splice(i, 1);
                        }
                        break;
                    }
                }
                setCookie("cart", JSON.stringify(cart), 7);
                displayCart();
            }
        }

        // 페이지 로드 시 장바구니 내용 표시
        window.onload = displayCart;
    </script>
</body>
</html>
