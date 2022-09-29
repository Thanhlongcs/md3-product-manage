<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 9/27/2022
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>form edit</h1>
<a href="/product">back menu</a>
<c:if test='${requestScope["message"]!=null}'>
    <span style="color: blue">${requestScope["message"]}</span>
</c:if>
<form method="post">
    <label>name</label><br>
    <input type="text" name="name" value='${requestScope["product"].getName()}'><br>
    <label>price</label><br>
    <input type="number" name="price" value='${requestScope["product"].getPrice()}'><br>
    <label>description</label><br>
    <input type="text" name="description" value='${requestScope["product"].getDescription()}'><br>
    <label>madeIn</label><br>
    <input type="text" name="madeIn" value='${requestScope["product"].getMadeIn()}'><br>
    <button>edit</button>
</form>

</body>
</html>
