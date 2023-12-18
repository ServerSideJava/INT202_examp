<%--
  Created by IntelliJ IDEA.
  User: butte
  Date: 29/10/2023
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Addition table</title>
</head>
<body>

    <h3>Addition Table</h3>
    <hr>

    <c:if test="${param.number1 != null && param.number2 != null}">
        <table>
            <tr>
                <td colspan="5" style="background-color: cadetblue">Sum of ${param.number1} and ${param.number2}</td>
            </tr>
            <c:forEach begin="1" end="1" var="n"> <!-- Perform the loop just once for addition -->
                <tr>
                    <td class="number">${param.number1}</td>
                    <td>+</td>
                    <td class="number">${param.number2}</td>
                    <td>=</td>
                    <td class="number">${(param.number1 + param.number2)}</td> <!-- Calculate and display the sum -->
                </tr>
            </c:forEach>
        </table>
    </c:if>


    <c:if test="${param.number1 == null || param.number2 == null}">
        <h3 style="color: red">
            Error: Please provide valid numbers for addition.
            (Number 1: ${param.number1 == null ? "Null/Empty" : param.number1},
            Number 2: ${param.number2 == null ? "Null/Empty" : param.number2})
        </h3>
    </c:if>

</body>
</html>
