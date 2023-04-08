<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Currency Converter</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Currency Converter</h2>
<form action="convert.jsp" method="get">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
</form>
<h2>Vietnamese Dictionary</h2>
<form action="dictionary.jsp" method="get">
    <input type="text" name="search" placeholder="Enter your word: "/>
    <input type = "submit" id = "submit2" value = "Search"/>
</form>
</body>
</html>