<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String num1Str = (String) request.getAttribute("num1Str");
    String num2Str = (String) request.getAttribute("num2Str");
    String operator = (String) request.getAttribute("operator");
    Double result = (Double) request.getAttribute("result");
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>계산 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f7f7f7;
        }
        .card {
            max-width: 420px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
        }
        .error {
            color: #b00020;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <h1>계산 결과</h1>

    <div class="card">
        <% if (errorMessage != null) { %>
            <p class="error"><%= errorMessage %></p>
        <% } else { %>
            <p><strong><%= num1Str %> <%= operator %> <%= num2Str %> = <%= result %></strong></p>
        <% } %>

        <p><a href="index.jsp">다시 계산하기</a></p>
    </div>
</body>
</html>
