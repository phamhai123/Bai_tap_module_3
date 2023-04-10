<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en" xmlns:c="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product create</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div class="container">
<%--        <p>--%>
<%--            <c:if test="${requestScope['message']!=null}">--%>
<%--                <span class="message">${requestScope['message']}</span>--%>
<%--            </c:if>--%>
<%--        </p>--%>
        <h1>Create Product</h1>
        <p>

        </p>
        <form method="post">
            <fieldset>
                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" name="name" id="name" >
                </div>
                <div class="mb-3">
                    <label for="core" class="form-label">Core:</label>
                    <input type="text" class="form-control" name="core" id="core" >
                </div>
                <div class=" mb-3">
                    <label for="description" class="form-label">Description:</label>
                    <input type="text" class="form-control" name="description" id="description">
                </div>
                <div class=" mb-3">
                    <label for="producer" class="form-label" >Producer:</label>
                    <input type="text" class="form-control" name="producer" id="producer" >
                </div>
                <button type="submit" class="btn btn-primary">Create product</button>
                <a class="btn btn-success mx-5" href="/products" role="button">Back to product list</a>
            </fieldset>
        </form>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>