<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/15/2023
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2>Create user</h2>
    <form method="post">
        <div class="py-3">
            <label for="name">Name:</label>
            <input type="text"
                   class="form-control" name="name" id="name" aria-describedby="helpId" placeholder="">
            <label for="birthday">Birthday:</label>
            <input type="text"
                   class="form-control" name="birthday" id="birthday" aria-describedby="helpId" placeholder="">
            <label for="email">Email:</label>
            <input type="text"
                   class="form-control" name="email" id="email" aria-describedby="helpId" placeholder="">
            <label for="address">Address:</label>
            <input type="text"
                   class="form-control" name="address" id="address" aria-describedby="helpId" placeholder="">
        </div>
        <button type="submit" class="btn btn-success">Create user</button>
        <a class="btn btn-primary" href="/users"
           role="button">Back to menu</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>