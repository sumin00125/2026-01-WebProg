<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Week9 Calculator Form</title>
</head>
<body>
    <h1>계산기 입력</h1>

    <form action="calc.jsp" method="post" accept-charset="UTF-8">
        <p>
            <label for="n1">첫 번째 숫자</label>
            <input type="number" id="n1" name="n1" step="any" required />
        </p>

        <p>
            <label for="op">연산자</label>
            <select id="op" name="op" required>
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
        </p>

        <p>
            <label for="n2">두 번째 숫자</label>
            <input type="number" id="n2" name="n2" step="any" required />
        </p>

        <button type="submit">계산</button>
    </form>
</body>
</html>
