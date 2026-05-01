
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>계산 결과</title>
</head>
<body>
    <h1>계산 결과</h1>

    <c:if test="${not empty error}">
        <p>오류: ${error}</p>
    </c:if>

    <c:if test="${not empty calculator and not empty result}">
        <p>${calculator.n1} ${calculator.op} ${calculator.n2} = <strong>${result}</strong></p>
    </c:if>

    <c:if test="${empty calculator and empty result and empty error}">
        <p>계산할 값이 전달되지 않았습니다.</p>
    </c:if>

    <p><a href="index.jsp">다시 계산하기</a></p>
</body>
</html>
