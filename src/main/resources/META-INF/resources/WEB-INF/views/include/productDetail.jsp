<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .btn-small {
        padding: 0.25rem 0.5rem;
        font-size: 0.875rem;
        width: 40px; /* 가로 크기를 줄이기 위해 추가 */
    }
    .product-image {
        max-width: 100%; /* 이미지 너비를 최대 100%로 설정 */
        height: auto; /* 이미지 높이를 자동으로 설정 */
        /* 아래 속성들을 추가/수정하여 이미지 크기를 조정할 수 있습니다 */
        width: 600px; /* 원하는 너비 값 */
        height: 400px; /* 원하는 높이 값 */
    }
</style>

<div class="card">
    <div class="card-header">
        <h3>${productDetail.name}</h3>
    </div>
    <div class="card-body">
        <p><strong>카테고리:</strong> ${productDetail.category}</p>
        <p><strong>상세 내용:</strong> ${productDetail.description}</p>
        <p><strong>가격:</strong> ${productDetail.price} 원</p>
        <c:if test="${not empty productDetail.imageUrl}">
            <img src="${pageContext.request.contextPath}/images/${productDetail.imageUrl}" alt="${productDetail.name}" class="product-image">
        </c:if>

        <div class="quantity-control mt-3">
            <label for="quantity"><strong>수량:</strong></label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <button type="button" class="btn btn-outline-secondary btn-small" onclick="updateQuantity(-1)">-</button>
                </div>
                <input type="text" id="quantity" name="quantity" value="1" class="form-control text-center" readonly>
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary btn-small" onclick="updateQuantity(1)">+</button>
                </div>
            </div>
        </div>

        <button type="button" class="btn btn-primary mt-3" onclick="orderNow()">주문하기</button>
        <button type="button" class="btn btn-secondary mt-3" onclick="addToCart()">장바구니에 추가</button>
    </div>
</div>

<script>
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

    // 쿠키 삭제 함수
    function eraseCookie(name) {
        document.cookie = name + '=; Max-Age=-99999999;';
    }

    function updateQuantity(change) {
        var quantityInput = document.getElementById("quantity");
        var currentQuantity = parseInt(quantityInput.value);
        var newQuantity = currentQuantity + change;
        if (newQuantity > 0) {
            quantityInput.value = newQuantity;
        }
    }

    function orderNow() {
        var quantity = document.getElementById("quantity").value;
        var productId = "${productDetail.id}";
        var form = document.createElement("form");
        form.method = "POST";
        form.action = "${pageContext.request.contextPath}/order";

        var quantityInput = document.createElement("input");
        quantityInput.type = "hidden";
        quantityInput.name = "quantity";
        quantityInput.value = quantity;
        form.appendChild(quantityInput);

        var productIdInput = document.createElement("input");
        productIdInput.type = "hidden";
        productIdInput.name = "productId";
        productIdInput.value = productId;
        form.appendChild(productIdInput);

        document.body.appendChild(form);
        form.submit();
    }

    function addToCart() {
        var quantity = document.getElementById("quantity").value;
        var productId = "${productDetail.id}";
        var imageUrl = "${productDetail.imageUrl}";

        var cart = getCookie("cart");
        if (cart) {
            cart = JSON.parse(cart);
        } else {
            cart = [];
        }

        var productExists = false;
        for (var i = 0; i < cart.length; i++) {
            if (cart[i].productId == productId) {
                cart[i].quantity = parseInt(cart[i].quantity) + parseInt(quantity);
                cart[i].imageUrl = imageUrl; // Ensure imageUrl is updated
                productExists = true;
                break;
            }
        }

        if (!productExists) {
            cart.push({ productId: productId, quantity: quantity, imageUrl: imageUrl });
        }

        setCookie("cart", JSON.stringify(cart), 7);
        alert("장바구니에 추가되었습니다.");
        window.location.href = "${pageContext.request.contextPath}/cart";
    }
</script>
