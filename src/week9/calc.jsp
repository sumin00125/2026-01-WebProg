<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Week9 Calculator Result</title>
</head>
<body>
    <h1>계산 결과</h1>

    <jsp:useBean id="calculator" class="bean_exam.Calculator" scope="page" />

    <%
        request.setCharacterEncoding("UTF-8");
        String s1 = request.getParameter("n1");
        String s2 = request.getParameter("n2");
        String op = request.getParameter("op");

        try {
            double n1 = Double.parseDouble(s1);
            double n2 = Double.parseDouble(s2);

            calculator.setN1(n1);
            calculator.setN2(n2);
            calculator.setOp(op);

            double result = calculator.calc();
    %>
        <p><%= n1 %> <%= op %> <%= n2 %> = <strong><%= result %></strong></p>
    <%
        } catch (NumberFormatException e) {
    %>
        <p>숫자 형식이 올바르지 않습니다.</p>
    <%
        } catch (Exception e) {
    %>
        <p>오류: <%= e.getMessage() %></p>
    <%
        }
    %>

    <p><a href="index.jsp">다시 계산하기</a></p>
</body>
</html>

