<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Delete product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1>Delete product</h1>
        <form method="post">
            <h3>Are you sure?</h3>
            <fieldset>
                <legend>Customer information</legend>
                <table>
                    <tr>
                        <td>Name: </td>
                        <td>${requestScope["product"].getName()}</td>
                    </tr>
                    <tr>
                        <td>Core: </td>
                        <td>${requestScope["product"].getCore()}</td>
                    </tr>
                    <tr>
                        <td>Description: </td>
                        <td>${requestScope["product"].getDescription()}</td>
                    </tr>
                    <tr>
                        <td>Producer: </td>
                        <td>${requestScope["product"].getProducer()}</td>
                    </tr>
                    <tr>
                        <td><input type="submit" class="btn btn-danger" value="Delete Product"></td>
                        <td><a class="btn btn-success" href="/products" role="button">Back to product list</a></td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>