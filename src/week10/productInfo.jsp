<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product 상세정보</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 40px 0;
        }
        .main-container {
            max-width: 800px;
        }
        .page-header {
            margin-bottom: 30px;
            text-align: center;
        }
        .page-header h1 {
            color: white;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .product-title-card {
            background: white;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            text-align: center;
        }
        .product-title-card h3 {
            color: #667eea;
            font-weight: 700;
            font-size: 2rem;
            margin: 0;
        }
        .product-title-card p {
            color: #6c757d;
            margin: 10px 0 0 0;
        }
        .info-cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .info-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border-left: 4px solid #667eea;
        }
        .info-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        .info-card-icon {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        .info-card-label {
            font-size: 0.85rem;
            color: #6c757d;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }
        .info-card-value {
            font-size: 1.35rem;
            color: #212529;
            font-weight: 700;
        }
        .info-card.price-card .info-card-value {
            color: #28a745;
            font-size: 2rem;
        }
        .info-card.id-card .info-card-value {
            background-color: #f0f0f0;
            padding: 8px 12px;
            border-radius: 5px;
            display: inline-block;
            font-family: monospace;
        }
        .button-group {
            background: white;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            gap: 10px;
            justify-content: center;
            flex-wrap: wrap;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            min-width: 120px;
            padding: 0.7rem 1.5rem;
            font-weight: 600;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .btn-edit {
            background-color: #0d6efd;
            color: white;
        }
        .btn-edit:hover {
            background-color: #0b5ed7;
            color: white;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        .btn-delete:hover {
            background-color: #bb2d3b;
            color: white;
        }
        .btn-list {
            background-color: #6c757d;
            color: white;
        }
        .btn-list:hover {
            background-color: #5c636a;
            color: white;
        }
        .error-message {
            text-align: center;
            padding: 40px;
            color: #dc3545;
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <div class="container main-container">
        <div class="page-header">
            <h1>📱 Product 상세정보</h1>
        </div>
        
        <c:if test="${not empty product}">
            <!-- 제품 제목 카드 -->
            <div class="product-title-card">
                <h3>${product.name}</h3>
                <p>상품 상세 정보</p>
            </div>
            
            <!-- 정보 카드들 -->
            <div class="info-cards-container">
                <!-- ID 카드 -->
                <div class="info-card id-card">
                    <div class="info-card-icon">🆔</div>
                    <div class="info-card-label">상품 ID</div>
                    <div class="info-card-value">${product.id}</div>
                </div>
                
                <!-- 상품명 카드 -->
                <div class="info-card">
                    <div class="info-card-icon">📦</div>
                    <div class="info-card-label">상품명</div>
                    <div class="info-card-value">${product.name}</div>
                </div>
                
                <!-- 제조사 카드 -->
                <div class="info-card">
                    <div class="info-card-icon">🏢</div>
                    <div class="info-card-label">제조사</div>
                    <div class="info-card-value">${product.maker}</div>
                </div>
                
                <!-- 가격 카드 -->
                <div class="info-card price-card">
                    <div class="info-card-icon">💰</div>
                    <div class="info-card-label">가격</div>
                    <div class="info-card-value"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>원</div>
                </div>
                
                <!-- 등록일 카드 -->
                <div class="info-card">
                    <div class="info-card-icon">📅</div>
                    <div class="info-card-label">등록일</div>
                    <div class="info-card-value">${product.date}</div>
                </div>
            </div>
            
            <!-- 버튼 그룹 -->
            <div class="button-group">
                <a href="form?id=${product.id}" class="btn btn-custom btn-edit">
                    ✎ 수정
                </a>
                <form method="post" action="delete" style="display: inline;">
                    <input type="hidden" name="id" value="${product.id}">
                    <button type="submit" class="btn btn-custom btn-delete" onclick="return confirm('정말 삭제하시겠습니까?');">
                        🗑 삭제
                    </button>
                </form>
                <a href="list" class="btn btn-custom btn-list">
                    ← 목록
                </a>
            </div>
        </c:if>
        
        <c:if test="${empty product}">
            <div class="error-message">
                <div style="font-size: 3rem; margin-bottom: 20px;">⚠️</div>
                <h5>제품을 찾을 수 없습니다.</h5>
                <p class="mt-3 mb-3">요청하신 상품이 없거나 삭제되었습니다.</p>
                <a href="list" class="btn btn-list btn-custom">
                    ← 목록으로 돌아가기
                </a>
            </div>
        </c:if>
    </div>
    
    <!-- Bootstrap JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
