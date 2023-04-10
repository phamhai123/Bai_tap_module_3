<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/8/2023
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Edit customer</title>
</head>
<body>
<h1>Edit customer</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/customers">Back to customer list</a>
</p>
<form method="post">
  <fieldset>
    <legend>Customer information</legend>
    <table>
      <tr>
        <td>Name: </td>
        <td><input type="text" name="name" id="name" value="${requestScope["customer"].getName()}"></td>
      </tr>
      <tr>
        <td>Email: </td>
        <td><input type="text" name="email" id="email" value="${requestScope["customer"].getEmail()}"></td>
      </tr>
      <tr>
        <td>Address: </td>
        <td><input type="text" name="address" id="address" value="${requestScope["customer"].getAddress()}"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Update customer"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
