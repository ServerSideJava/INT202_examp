<%--
  Created by IntelliJ IDEA.
  User: butte
  Date: 15/11/2023
  Time: 23:49
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

<%-- Form to receive information to insert into attributes --%>
<div class="mt-4">
    <h3>Add Office Management</h3>
    <form action="office-add" method="POST">
        <div class="mb-3">
            <label for="officeCode" class="form-label">Office Code:</label>
            <input type="text" class="form-control" id="officeCode" name="officeCode">
        </div>
        <div class="mb-3">
            <label for="city" class="form-label">City:</label>
            <input type="text" class="form-control" id="city" name="city">
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone:</label>
            <input type="text" class="form-control" id="phone" name="phone">
        </div>
        <div class="mb-3">
            <label for="addressLine1" class="form-label">Address Line 1:</label>
            <input type="text" class="form-control" id="addressLine1" name="addressLine1">
        </div>
        <div class="mb-3">
            <label for="country" class="form-label">Country:</label>
            <input type="text" class="form-control" id="country" name="country">
        </div>
        <div class="mb-3">
            <label for="postalCode" class="form-label">Postal Code:</label>
            <input type="text" class="form-control" id="postalCode" name="postalCode">
        </div>
        <div class="mb-3">
            <label for="territory" class="form-label">Territory:</label>
            <input type="text" class="form-control" id="territory" name="territory">
        </div>

        <button type="submit" class="btn btn-primary">Add</button>
    </form>
</div>
</body>
</html>

