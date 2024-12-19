<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <c:if test="${empty user.name}">
        <title>Add</title>
    </c:if>
    <c:if test="${!empty user.name}">
        <title>Edit</title>
    </c:if>
</head>
<body>
<c:if test="${empty user.name}">
    <c:url value="/add" var="var"/>
</c:if>
<c:if test="${!empty user.name}">
    <c:url value="/edit" var="var"/>
</c:if>
<form action="${var}" method="POST" onsubmit="return validateForm()">
    <c:if test="${!empty user.name}">
        <input type="hidden" name="id" value="${user.id}">
    </c:if>

    <label for="name">Name</label>
    <input type="text" value="${user.name}" name="name" id="name" required>

    <label for="year">Year</label>
    <input type="number" value="${user.year}" name="year" id="year" required>

    <label for="gender">Gender</label>
    <input type="text" value="${user.gender}" name="gender" id="gender" required>

    <label for="online">Online</label>
    <input type="checkbox" name="online" id="online">

    <c:if test="${empty user.name}">
        <input type="submit" value="Add new user">
    </c:if>
    <c:if test="${!empty user.name}">
        <input type="submit" value="Edit user">
    </c:if>
</form>

<script>
    function validateForm() {
        const name = document.getElementById('name').value.trim();
        const year = document.getElementById('year').value.trim();
        const gender = document.getElementById('gender').value.trim();
        const online = document.getElementById('online').checked;

        let errors = [];

        if (!name) errors.push('Name is required.');
        if (!year) errors.push('Year is required.');
        if (!gender) errors.push('Gender is required.');

        if (typeof online !== "boolean") {
            errors.push("Online must be a boolean (true/false).");
        }

        if (errors.length > 0) {
            alert(errors.join('\n'));
            return false;
        }
        return true;
    }
</script>
</body>
</html>