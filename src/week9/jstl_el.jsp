<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Week9 JSTL and EL Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 32px;
        }
        .box {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 20px;
        }
        .title {
            margin-top: 0;
        }
        ul {
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <h1>JSTL와 EL 예제</h1>

    <%
        String[] fruitsArray = {"사과", "바나나", "오렌지", "포도"};
        pageContext.setAttribute("fruitsArray", fruitsArray);

        int[] numbers = {1, 2, 3};
        pageContext.setAttribute("numbers", numbers);
    %>

    <c:set var="name" value="홍길동" />
    <c:set var="age" value="21" />
    <c:set var="score" value="87" />
    <c:set var="items" value="사과,바나나,오렌지,포도" />

    <div class="box">
        <h2 class="title">1. JSTL 기본 문법과 출력</h2>
        <p><strong>변수 설정:</strong> name, age, score, items, fruitsArray, numbers</p>
        <p><strong>출력:</strong> <c:out value="${name}" /> / <c:out value="${age}" /> / <c:out value="${score}" /></p>

        <p><strong>if</strong></p>
        <c:if test="${score >= 60}">
            <p>JSTL if: <c:out value="${name}" /> 님은 합격입니다.</p>
        </c:if>

        <p><strong>choose / when / otherwise</strong></p>
        <c:choose>
            <c:when test="${score >= 90}">
                <p>JSTL choose: 등급은 A입니다.</p>
            </c:when>
            <c:when test="${score >= 80}">
                <p>JSTL choose: 등급은 B입니다.</p>
            </c:when>
            <c:otherwise>
                <p>JSTL choose: 등급은 C입니다.</p>
            </c:otherwise>
        </c:choose>

        <p><strong>forEach</strong></p>
        <ul>
            <c:forEach var="num" begin="1" end="5">
                <li>JSTL forEach: ${num}</li>
            </c:forEach>
        </ul>

        <p><strong>forTokens</strong></p>
        <ul>
            <c:forTokens items="${items}" delims="," var="fruit">
                <li>JSTL forTokens: <c:out value="${fruit}" /></li>
            </c:forTokens>
        </ul>

        <p><strong>문자열 배열 forEach</strong></p>
        <ul>
            <c:forEach items="${fruitsArray}" var="fruitArray">
                <li>JSTL forEach 배열: <c:out value="${fruitArray}" /></li>
            </c:forEach>
        </ul>

        <p><strong>숫자 배열 forEach</strong></p>
        <ul>
            <c:forEach items="${numbers}" var="number">
                <li>JSTL forEach 숫자 배열: <c:out value="${number}" /></li>
            </c:forEach>
        </ul>
    </div>

    <div class="box">
        <h2 class="title">2. 동일한 내용을 EL로 출력</h2>
        <p><strong>변수 출력:</strong> ${name} / ${age} / ${score}</p>

        <p><strong>if 대응 출력</strong></p>
        <p>${name} 님은 ${score >= 60 ? '합격' : '불합격'}입니다.</p>

        <p><strong>choose / when / otherwise 대응 출력</strong></p>
        <p>
            ${score >= 90 ? '등급은 A입니다.' : score >= 80 ? '등급은 B입니다.' : '등급은 C입니다.'}
        </p>

        <p><strong>forEach 대응 출력</strong></p>
        <ul>
            <li>EL forEach: 1</li>
            <li>EL forEach: 2</li>
            <li>EL forEach: 3</li>
            <li>EL forEach: 4</li>
            <li>EL forEach: 5</li>
        </ul>

        <p><strong>forTokens 대응 출력</strong></p>
        <ul>
            <li>EL forTokens: 사과</li>
            <li>EL forTokens: 바나나</li>
            <li>EL forTokens: 오렌지</li>
            <li>EL forTokens: 포도</li>
        </ul>
    </div>
</body>
</html>
