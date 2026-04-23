<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String num1Str = request.getParameter("num1");
    String num2Str = request.getParameter("num2");
    String operator = request.getParameter("operator");

    Double result = null;
    String errorMessage = null;

    if (num1Str == null || num1Str.trim().isEmpty() ||
        num2Str == null || num2Str.trim().isEmpty() ||
        operator == null || operator.trim().isEmpty()) {
        errorMessage = "index.jsp에서 전달된 값이 올바르지 않습니다.";
    } else {
        try {
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);

            switch (operator) {
                case "+":
                    result = num1 + num2;
                    break;
                case "-":
                    result = num1 - num2;
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                case "/":
                    if (num2 == 0) {
                        errorMessage = "0으로 나눌 수 없습니다.";
                    } else {
                        result = num1 / num2;
                    }
                    break;
                default:
                    errorMessage = "사칙연산 연산자(+,-,*,/)만 사용할 수 있습니다.";
            }
        } catch (NumberFormatException e) {
            errorMessage = "숫자 입력값이 유효하지 않습니다.";
        }
    }
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
