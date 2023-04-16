<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <h1>Edit product</h1>
<%--    <p>--%>
<%--        <c:if test="${requestScope['message']!=null}">--%>
<%--            <span class="message">${requestScope['message']}</span>--%>
<%--        </c:if>--%>
<%--    </p>--%>
    <c:if test="${requestScope['message']!=null}">
        <div class="alert alert-success" role="alert">
            <span class="message">${requestScope['message']}</span>
        </div>
    </c:if>
    <p><a href="/products">Back to product list</a></p>
    <form method="post">
        <fieldset>
            <legend>Product information</legend>
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" name="name" id="name" value="${requestScope['product'].getName()}">
            </div>
            <div class="mb-3">
                <label for="core" class="form-label">Core:</label>
                <input type="text" class="form-control" name="core" id="core" value="${requestScope['product'].getCore()}">
            </div>
            <div class=" mb-3">
                <label for="description" class="form-label">Description:</label>
                <input type="text" class="form-control" name="description" id="description" value="${requestScope['product'].getDescription()}">
            </div>
            <div class=" mb-3">
                <label for="producer" class="form-label" >Producer:</label>
                <input type="text" class="form-control" name="producer" id="producer" value="${requestScope['product'].getProducer()}">
            </div>
            <button type="submit" class="btn btn-primary">Update product</button>
        </fieldset>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>