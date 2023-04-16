<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">

    <h1>Product</h1>
    <p>
        <a class="btn btn-success" href="/products?action=create">Create new Product</a>
    </p>
    <c:if test="${requestScope['message']!=null}">
        <div class="alert alert-success" role="alert">
            <span class="message">${requestScope['message']}</span>
        </div>
    </c:if>
    <form action="/products" method="get">
        <div class="input-group mb-3">
            <input type="hidden" name="action" value="search">
            <input type="text" class="form-control" name="search" id="search" placeholder="Search name product..."
                   aria-label="Recipient's username" aria-describedby="button-addon2">
            <button class="btn btn-outline-secondary" type="submit">Search</button>
        </div>
    </form>
    <c:if test="${messageNull!=null}">
        <div class="alert alert-danger" role="alert">
            <span class="message">${messageNull}</span>
        </div>
    </c:if>
    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Core</th>
            <th>Description</th>
            <th>Producer</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope['products']}" var="product">
            <tr>
                <td scope="row"><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
                <td>${product.getCore()}</td>
                <td>${product.getDescription()}</td>
                <td>${product.getProducer()}</td>
                <td>
                    <a class="btn btn-primary" href="/products?action=edit&id=${product.getId()}"
                       role="button">Edit</a>
                </td>
                <td>
                        <%-- <a class="btn btn-danger" href="/products?action=delete&id=${product.getId()}"--%>
                        <%-- role="button">Delete</a>--%>

                    <form id="form-delete" action="delete.jsp" method="POST">
                        <input id="input-delete" type="hidden" name="id" value="${product.getId()}">
                        <button type="button" class="btn btn-danger btn-delete" data-id="1">Xóa</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!-- Tạo modal để xác nhận xóa -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Xác nhận xóa</h4>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn xóa bản ghi này?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-danger btn-ok" data-dismiss="modal">Xóa</button>
                </div>
            </div>
        </div>
    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>