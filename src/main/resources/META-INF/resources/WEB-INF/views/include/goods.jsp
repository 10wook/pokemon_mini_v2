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
        <table id="goodsTable" class="table">
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
    $(document).ready(function() {
        // 페이지 로딩 시 상품 목록을 가져와서 테이블에 출력
        $.ajax({
            url: '/goods/list',
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                var goodsTable = $('#goodsTable tbody');
                goodsTable.empty(); // 기존 내용을 지우고

                $.each(data, function(index, goods) {
                    var row = '<tr>' +
                        '<td>' + goods.gCode + '</td>' +
                        '<td>' + goods.gCategory + '</td>' +
                        '<td>' + goods.gName + '</td>' +
                        '<td>' + goods.gContent + '</td>' +
                        '<td>' + goods.gPrice + '</td>' +
                        '<td><img src="' + goods.gImage + '" alt="상품 이미지" width="100"></td>' +
                        '</tr>';
                    goodsTable.append(row);
                });
            },
            error: function(xhr, status, error) {
                console.error('AJAX 오류:', status, error);
            }
        });

        // 상품 등록 폼 제출 처리
        $('#addGoodsForm').submit(function(event) {
            event.preventDefault(); // 기본 동작 중지

            var formData = $(this).serialize(); // 폼 데이터 직렬화

            $.ajax({
                url: '/goods/add',  // 상품 등록 API 엔드포인트
                method: 'POST',
                data: formData,
                success: function(data) {
                    alert('상품이 성공적으로 등록되었습니다.');
                    // 등록 후 처리할 내용 추가 (예: 테이블에 새로운 행 추가)
                    var newRow = '<tr>' +
                        '<td>' + data.gCode + '</td>' +
                        '<td>' + data.gCategory + '</td>' +
                        '<td>' + data.gName + '</td>' +
                        '<td>' + data.gContent + '</td>' +
                        '<td>' + data.gPrice + '</td>' +
                        '<td><img src="' + data.gImage + '" alt="상품 이미지" width="100"></td>' +
                        '</tr>';
                    $('#goodsTable tbody').append(newRow);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX 오류:', status, error);
                    alert('상품 등록 중 오류가 발생했습니다.');
                }
            });
        });
    });
    </script>
</body>
</html>
