<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product 목록</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px 0;
        }
        .main-container {
            max-width: 1000px;
        }
        .page-header {
            margin-bottom: 30px;
        }
        .page-header h1 {
            color: white;
            font-weight: 700;
            margin-bottom: 10px;
        }
        .page-header .lead {
            color: rgba(255, 255, 255, 0.9);
        }
        .card-header-custom {
            background: white;
            border-bottom: 3px solid #667eea;
        }
        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }
        .btn-detail {
            font-size: 0.85rem;
            padding: 0.4rem 0.8rem;
        }
        .product-badge {
            font-weight: 600;
        }
        .price-cell {
            font-weight: 700;
            color: #667eea;
            font-size: 1.1rem;
        }
        .empty-state {
            text-align: center;
            padding: 60px 20px;
        }
        .empty-state i {
            font-size: 4rem;
            color: #dee2e6;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container main-container">
        <div class="page-header">
            <h1>📱 Product 목록</h1>
            <p class="lead">우리의 최신 제품 라인업을 확인하세요.</p>
        </div>
        
        <div class="card shadow-lg">
            <div class="card-header card-header-custom">
                <div class="d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">전체 상품</h5>
                    <a href="form" class="btn btn-success">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16" style="display: inline; margin-right: 5px;">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                        </svg>
                        새 제품 등록
                    </a>
                </div>
            </div>
            
            <div class="card-body p-0">
                <c:choose>
                    <c:when test="${not empty products}">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th class="fw-bold">ID</th>
                                        <th class="fw-bold">상품명</th>
                                        <th class="fw-bold">제조사</th>
                                        <th class="fw-bold text-end">가격</th>
                                        <th class="fw-bold">등록일</th>
                                        <th class="fw-bold text-center">작업</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="product" items="${products}">
                                        <tr>
                                            <td>
                                                <span class="badge bg-light text-dark product-badge">${product.id}</span>
                                            </td>
                                            <td>${product.name}</td>
                                            <td>${product.maker}</td>
                                            <td class="text-end price-cell"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>원</td>
                                            <td>${product.date}</td>
                                            <td class="text-center">
                                                <a href="detail?id=${product.id}" class="btn btn-detail btn-info btn-sm">
                                                    보기
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <div style="font-size: 3rem; margin-bottom: 15px;">📦</div>
                            <h5 class="text-muted">등록된 제품이 없습니다.</h5>
                            <p class="text-muted mb-3">새로운 제품을 등록해보세요.</p>
                            <a href="form" class="btn btn-success">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16" style="display: inline; margin-right: 5px;">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                </svg>
                                새 제품 등록하기
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
