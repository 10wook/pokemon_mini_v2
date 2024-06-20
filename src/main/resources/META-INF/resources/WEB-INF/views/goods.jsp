<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록 및 등록</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container mt-4">
        <h1>상품 목록 및 등록</h1>
        
        <!-- 상품 등록 폼 -->
        <form id="addGoodsForm">
            <input type="text" name="gCode" placeholder="상품 코드" required><br>
            <input type="text" name="gCategory" placeholder="카테고리" required><br>
            <input type="text" name="gName" placeholder="상품명" required><br>
            <input type="text" name="gContent" placeholder="상세 내용" required><br>
            <input type="number" name="gPrice" placeholder="가격" step="0.01" required><br>
            <input type="text" name="gImage" placeholder="이미지 URL"><br>
            <button type="submit">상품 등록</button>
        </form>

        <hr>
        <!-- 상품 목록 테이블 -->
        <table id="goodss" class="table">
            <thead>
                <tr>
                    <th>상품 코드</th>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>상세 내용</th>
                    <th>가격</th>
                    <th>이미지</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여기에 상품 데이터가 추가됩니다 -->
            </tbody>
        </table>
    </div>

  <script>
    // 서버에서 상품 데이터를 받아오는 함수
    async function fetchProducts() {
        try {
            const response = await fetch('/api/goods/all'); // 서버의 API 엔드포인트 주소
            const products = await response.json(); // JSON 형식으로 변환된 상품 데이터
            
            // 상품 데이터를 테이블에 추가
            const tableBody = document.querySelector('#goodsTable tbody');
            tableBody.innerHTML = ''; // 기존의 데이터를 모두 지우고 다시 추가
            
            products.forEach(product => {
                const row = `
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.category}</td>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td>${product.price}</td>
                        <td><img src="${product.imageUrl}" alt="상품 이미지" style="max-width: 100px;"></td>
                    </tr>
                `;
                tableBody.innerHTML += row;
            });
        } catch (error) {
            console.error('상품 데이터를 가져오는 중 오류 발생:', error);
        }
    }

    // 페이지 로드 시 상품 데이터를 불러오도록 설정
    window.addEventListener('DOMContentLoaded', fetchProducts);
</script>
</body>
</html>
