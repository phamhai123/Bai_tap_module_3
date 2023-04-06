<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/discount" method="post">
    <label>Product Description:</label> <br/>
    <input type="text" name="description" placeholder="..." value="IPhone"/> <br/>
    <label>List Price:</label> <br/>
    <input type="text" name="price" placeholder="price" value="2000"/> <br/>
    <label>Discount Percent:</label> <br/>
    <input type="text" name="percent" placeholder="Discount Percent" value="20"/> <br/>
    <input type="submit" id="submit" value="Calculate Discount"/>
</form>
</body>
</html>