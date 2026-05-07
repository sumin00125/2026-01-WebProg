<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product MVC</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background-color: white;
            padding: 50px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 500px;
        }
        h1 {
            color: #333;
            margin-top: 0;
            font-size: 32px;
            margin-bottom: 10px;
        }
        .subtitle {
            color: #666;
            font-size: 16px;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            padding: 15px 40px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .features {
            margin-top: 40px;
            text-align: left;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 4px;
        }
        .features h3 {
            color: #333;
            margin-top: 0;
        }
        .features ul {
            list-style: none;
            padding: 0;
            color: #555;
        }
        .features li {
            padding: 5px 0;
            padding-left: 25px;
            position: relative;
        }
        .features li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #28a745;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🛍️ Product MVC</h1>
        <p class="subtitle">제품 관리 시스템</p>
        
        <a href="product/list" class="btn">제품 목록 보기</a>
        
        <div class="features">
            <h3>제공 기능</h3>
            <ul>
                <li>제품 목록 조회</li>
                <li>제품 상세 정보 조회</li>
                <li>새 제품 등록</li>
                <li>제품 정보 수정</li>
                <li>제품 삭제</li>
            </ul>
        </div>
    </div>
</body>
</html>
