<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Week12 - SessionListener</title>
</head>
<body>
    <h1>HttpSessionListener 실습</h1>
    <p>
        아래 버튼을 눌러 `/sl` 서블릿을 호출하면 서블릿에서 세션을 생성하고
        `setAttribute("ssName", sessionId + "홍길동")`을 호출합니다.
    </p>
    <a href="sl">/sl 실행</a>
</body>
</html>