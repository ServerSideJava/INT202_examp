<%--
    Created by IntelliJ IDEA.
    User: butte
    Date: 15/11/2023
    Time: 23:50
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OFFICE_CRUD_65130500041</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<div class="bg-primary rounded p-4 mb-4">
    <a href="office-list" class="text-decoration-none">
        <h1 class="display-4 mb-10 text-white">Office Management</h1>
    </a>
</div>

<%-- Form to receive information to update into attributes --%>
<div class="mt-4">
    <h3>Update Office Management</h3>
    <form action="office-update?officeCode=${office.officeCode}" method="POST">
        <div class="mb-3">
            <label for="officeCode" class="form-label">Office Code:</label>
            <%-- office code for read-only --%>
            <input type="text" class="form-control" id="officeCode" name="officeCode" value="${office.officeCode}" readonly>
        </div>
        <div class="mb-3">
            <label for="city" class="form-label">City:</label>
            <input type="text" id="city" class="form-control" name="city" value="${office.city}">
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone:</label>
            <input type="text" id="phone" class="form-control" name="phone" value="${office.phone}">
        </div>
        <div class="mb-3">
            <label for="addressLine1" class="form-label">Address Line 1:</label>
            <input type="text" id="addressLine1" class="form-control" name="addressLine1" value="${office.addressLine1}">
        </div>
        <div class="mb-3">
            <label for="country" class="form-label">Country:</label>
            <input type="text" id="country" class="form-control" name="country" value="${office.country}">
        </div>
        <div class="mb-3">
            <label for="postalCode" class="form-label">Postal Code:</label>
            <input type="text" id="postalCode" class="form-control" name="postalCode" value="${office.postalCode}">
        </div>
        <div class="mb-3">
            <label for="territory" class="form-label">Territory:</label>
            <input type="text" id="territory" class="form-control" name="territory" value="${office.territory}">
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <button type="reset" class="btn btn-secondary">Reset</button>
    </form>
</div>
</body>
</html>
