<%--
  Created by IntelliJ IDEA.
  User: butte
  Date: 16/12/2023
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Fullname</title>
</head>
<body>
    <form action="FullnameServlet" method="post">
        Enter firstname : <input type="text" name="firstname"><br>
        Enter lastname : <input type="text" name="lastname"><br>
        <input type="submit" value="submit name">
    </form>

<%--    <h3>Name : ${param.firstname} ${param.lastname}</h3>--%>
</body>
</html>
