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
        }
        .result-box {
            max-width: 420px;
            padding: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .error {
            color: #b00020;
        }
        a {
            display: inline-block;
            margin-top: 12px;
        }
    </style>
</head>
<body>
    <h1>계산 결과</h1>
    <div class="result-box">
        <% if (errorMessage != null) { %>
            <p class="error"><%= errorMessage %></p>
        <% } else { %>
            <p><strong><%= num1Str %> <%= operator %> <%= num2Str %> = <%= result %></strong></p>
        <% } %>
        <a href="index.jsp">다시 계산하기</a>
    </div>
</body>
</html>
