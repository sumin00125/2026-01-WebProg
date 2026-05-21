<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Week12 - ServletContextListener</title>
    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: grid;
            place-items: center;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a 0%, #1d4ed8 55%, #38bdf8 100%);
            color: #0f172a;
        }
        .card {
            width: min(640px, calc(100vw - 32px));
            background: rgba(255, 255, 255, 0.96);
            border-radius: 20px;
            padding: 36px;
            box-shadow: 0 20px 50px rgba(15, 23, 42, 0.25);
        }
        h1 {
            margin-top: 0;
            font-size: 30px;
        }
        p {
            line-height: 1.7;
            color: #334155;
        }
        .btn {
            display: inline-block;
            margin-top: 16px;
            padding: 14px 22px;
            border-radius: 999px;
            background: #0f172a;
            color: #fff;
            text-decoration: none;
            font-weight: 700;
        }
        .hint {
            margin-top: 20px;
            padding: 14px 16px;
            border-radius: 12px;
            background: #eff6ff;
            color: #1e3a8a;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>ServletContextListener 실습</h1>
        <p>
            아래 버튼을 누르면 <strong>/scl</strong> 서블릿이 실행되고,
            <strong>ServletContextListener</strong> 와 <strong>ServletContextAttributeListener</strong>
            동작이 서버 로그와 콘솔에 출력됩니다.
        </p>
        <a class="btn" href="scl">/scl 실행</a>
        <div class="hint">
            확인 포인트: contextInitialized, contextDestroyed, attributeAdded, attributeReplaced, attributeRemoved
        </div>
    </div>
</body>
</html>