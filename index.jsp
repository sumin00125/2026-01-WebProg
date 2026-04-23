<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .calculator {
            max-width: 360px;
            padding: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .row {
            margin-bottom: 12px;
        }
        label {
            display: block;
            margin-bottom: 6px;
        }
        input, select, button {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <h1>Calculator</h1>
    <form class="calculator" action="calc.jsp" method="post">
        <div class="row">
            <label for="num1">First Number</label>
            <input type="number" id="num1" name="num1" step="any" required />
        </div>

        <div class="row">
            <label for="operator">Operator</label>
            <select id="operator" name="operator" required>
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
        </div>

        <div class="row">
            <label for="num2">Second Number</label>
            <input type="number" id="num2" name="num2" step="any" required />
        </div>

        <button type="submit">Calculate</button>
    </form>
</body>
</html>
