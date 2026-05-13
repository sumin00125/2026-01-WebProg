<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="bean_exam.Student" %>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>table{border-collapse:collapse;}td,th{border:1px solid #ccc;padding:6px;}</style>
</head>
<body>
    <h2>학생 목록</h2>
    <p><a href="<%= request.getContextPath() %>/student/form">학생 등록</a></p>
    <table>
        <tr><th>ID</th><th>Name</th><th>University</th><th>Email</th><th>Action</th></tr>
        <%
            if (students != null) {
                for (Student s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getUniv() %></td>
            <td><%= s.getEmail() %></td>
            <td><a href="<%= request.getContextPath() %>/student/detail?id=" + s.getId() + "">상세</a></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
