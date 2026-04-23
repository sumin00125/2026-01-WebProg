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

    request.setAttribute("num1Str", num1Str);
    request.setAttribute("num2Str", num2Str);
    request.setAttribute("operator", operator);
    request.setAttribute("result", result);
    request.setAttribute("errorMessage", errorMessage);

    RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
    dispatcher.forward(request, response);
%>
