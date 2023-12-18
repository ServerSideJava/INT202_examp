<%--
  Created by IntelliJ IDEA.
  User: butte
  Date: 16/12/2023
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add</title>
</head>
<body>
    <form action="AddServlet" method="get">
        Enter 1st number : <input type="text" name="num1"><br>
        Enter 2nd number : <input type="text" name="num2"><br>
        <input type="submit">
    </form>
    <c:if test="${param.num1 != null && param.num2 != null}">
        <h3>The result is ${param.num1 + param.num2}</h3>
    </c:if>

    <c:if test="${empty param.num1 && empty param.num2}">
        <h2 style="color: red">Error: Please enter both numbers</h2>
    </c:if>
    <c:if test="${empty param.num1}">
        <h2 style="color: red">Error: Please enter the first number</h2>
    </c:if>
    <c:if test="${empty param.num2}">
        <h2 style="color: red">Error: Please enter the second number</h2>
    </c:if>


</body>
</html>
