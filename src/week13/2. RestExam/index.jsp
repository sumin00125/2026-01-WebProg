<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>RestExam 테스트</title>
</head>
<body>
    <h2>RestExam - GET / POST 테스트</h2>

    <p><a href="${pageContext.request.contextPath}/api/exam">GET 요청 보내기</a></p>

    <form id="postForm" action="${pageContext.request.contextPath}/api/exam" method="post" onsubmit="return submitWithQueryParam();">
        <label for="msg">msg:</label>
        <input type="text" id="msg" name="msg" />
        <button type="submit">POST 요청 보내기</button>
    </form>

    <script>
        function submitWithQueryParam() {
            const form = document.getElementById('postForm');
            const msg = document.getElementById('msg').value;
            form.action = '${pageContext.request.contextPath}/api/exam?msg=' + encodeURIComponent(msg);
            return true;
        }
    </script>
</body>
</html>