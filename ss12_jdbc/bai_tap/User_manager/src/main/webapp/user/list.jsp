<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2 style="text-align: center">User manager</h2>
    <p><a class="btn btn-primary" href="/users?action=create"
          role="button">Create new user</a></p>
    <form action="/users" method="get">
        <div class="input-group mb-3">
            <input type="hidden" name="action" value="search">
            <input type="text" name="name" class="form-control" placeholder="Search name user..." aria-describedby="helpId">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
    </form>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Email</th>
            <th>Address</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td scope="row">${user.id}</td>
                <td>${user.name}</td>
                <td>${user.birthday}</td>
                <td>${user.email}</td>
                <td>${user.address}</td>
                <td><a class="btn btn-success" href="/users?action=update&id=${user.id}"
                       role="button">Update</a></td>
                <td>
                    <form action="/users" method="post">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="${user.id}">
                        <button type="submit" class="btn btn-danger">Delete</button>
<%--                        <a class="btn btn-danger" href="/users?action=delete&id=${user.id}"--%>
<%--                           role="button">Delete</a>--%>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>