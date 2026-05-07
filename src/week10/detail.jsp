<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product 상세</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .detail-info {
            margin-top: 20px;
        }
        .info-row {
            display: flex;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        .info-label {
            font-weight: bold;
            width: 100px;
            color: #555;
        }
        .info-value {
            flex: 1;
            color: #333;
        }
        .button-group {
            margin-top: 30px;
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }
        .btn-edit {
            background-color: #007bff;
            color: white;
        }
        .btn-edit:hover {
            background-color: #0056b3;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        .btn-list {
            background-color: #6c757d;
            color: white;
        }
        .btn-list:hover {
            background-color: #5a6268;
        }
        .price {
            font-size: 20px;
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📱 Product 상세정보</h1>
        
        <c:if test="${not empty product}">
            <div class="detail-info">
                <div class="info-row">
                    <div class="info-label">ID</div>
                    <div class="info-value">${product.id}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">상품명</div>
                    <div class="info-value">${product.name}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">제조사</div>
                    <div class="info-value">${product.maker}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">가격</div>
                    <div class="info-value price"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>원</div>
                </div>
                <div class="info-row">
                    <div class="info-label">등록일</div>
                    <div class="info-value">${product.date}</div>
                </div>
            </div>
            
            <div class="button-group">
                <a href="form?id=${product.id}" class="btn btn-edit">수정</a>
                <form method="post" action="delete" style="display: inline;">
                    <input type="hidden" name="id" value="${product.id}">
                    <button type="submit" class="btn btn-delete" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
                </form>
                <a href="list" class="btn btn-list">목록</a>
            </div>
        </c:if>
        
        <c:if test="${empty product}">
            <p style="color: red; text-align: center; margin-top: 20px;">제품을 찾을 수 없습니다.</p>
            <div style="text-align: center; margin-top: 20px;">
                <a href="list" class="btn btn-list">목록으로 돌아가기</a>
            </div>
        </c:if>
    </div>
</body>
</html>
