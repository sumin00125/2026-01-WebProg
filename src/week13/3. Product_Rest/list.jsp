<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Rest 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }
        .btn-add {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .btn-add:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }
        td {
            padding: 10px 12px;
            border-bottom: 1px solid #ddd;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .btn-detail {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            cursor: pointer;
        }
        .btn-detail:hover {
            text-decoration: underline;
        }
        .price {
            text-align: right;
        }
        .empty-msg {
            text-align: center;
            padding: 40px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📱 Product Rest 목록</h1>
        
        <a href="form" class="btn-add">+ 새 제품 등록</a>
        
        <c:choose>
            <c:when test="${not empty products}">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>상품명</th>
                            <th>제조사</th>
                            <th class="price">가격</th>
                            <th>등록일</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.name}</td>
                                <td>${product.maker}</td>
                                <td class="price"><fmt:formatNumber value="${product.price}" pattern="#,##0"/>원</td>
                                <td>${product.date}</td>
                                <td>
                                    <a href="detail?id=${product.id}" class="btn-detail">보기</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-msg">
                    <p>등록된 제품이 없습니다.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
