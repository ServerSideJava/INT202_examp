<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

    <a href="add.jsp">Go to Add</a>
    <a href="fullname.jsp">Go To fullname</a>

    <div>Name : ${param.firstname} ${param.lastname}</div>
</body>
</html>