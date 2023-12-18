<%--
  Created by IntelliJ IDEA.
  User: butte
  Date: 15/11/2023
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>OFFICE_CRUD_65130500041</title>
</head>
<body class="bg-light">
<div class="container mt-5">

    <div class="bg-primary rounded p-4 mb-4">
        <a href="office-list" class="text-decoration-none">
            <h1 class="display-4 mb-10 text-white">Classic Model Offices Management</h1>
        </a>
    </div>

    <%-- Search Function --%>
    <form action="office-search" class="mb-4" method="POST">
        <div class="input-group">
            <input name="searchByCityOrCountry" type="text" class="form-control"
                   placeholder="Search By City or Country">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
    </form>

    <%-- Table office list --%>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Office Code</th>
            <th>City</th>
            <th>Phone</th>
            <th>AddressLine1</th>
            <th>Country</th>
            <th>Postal Code</th>
            <th>Territory</th>
            <th></th>
        </tr>
        </thead>
        <tbody>

    <%-- loop for listing all attribute values --%>
        <c:forEach items="${offices}" var="office">
            <tr>
                <td>${office.officeCode}</td>
                <td>${office.city}</td>
                <td>${office.phone}</td>
                <td>${office.addressLine1}</td>
                <td>${office.country}</td>
                <td>${office.postalCode}</td>
                <td>${office.territory}</td>
                <%-- edit/updute function --%>
                <td>
                   <a href="office-update?officeCode=${office.officeCode}">Edit</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<%-- Status of Insert,Update,Delete --%>
<div class="container mt-4">
    <%--Insert office Status--%>
    <c:choose>
        <c:when test="${statusAdd}">
            <h4 class="text-success">${messageAdd}</h4>
        </c:when>
        <c:otherwise>
            <h4 class="text-danger">${messageAdd}</h4>
        </c:otherwise>
    </c:choose>

    <%--Delete Office Status--%>
    <c:choose>
        <c:when test="${StatusDelete}">
            <h4 class="text-success">${messageDelete}</h4>
        </c:when>
        <c:otherwise>
            <h4 class="text-danger">${messageDelete}</h4>
        </c:otherwise>
    </c:choose>

    <%--Update Office Status--%>
    <c:choose>
        <c:when test="${statusUpdate}">
            <h4 class="text-success">${messageUpdate}</h4>
        </c:when>
        <c:otherwise>
            <h4 class="text-danger">${messageUpdate}</h4>
        </c:otherwise>
    </c:choose>
</div>


<%--Button fuction--%>
<div class="container mt-4">
    <%--    Insert button   --%>
    <a href="office-add" class="btn btn-primary mr-2">Add</a>

    <%--    Delete button   --%>
    <form action="office-delete" method="GET" class="mt-3">
        <div class="input-group mb-3">
            <input name="officeCode" type="text" class="form-control" placeholder="Enter Office Code to Delete"
                   aria-label="Enter office Code" aria-describedby="button-addon2">
            <button class="btn btn-danger" type="submit" id="button-addon2">Delete</button>
        </div>
    </form>
</div>


</body>
</html>
