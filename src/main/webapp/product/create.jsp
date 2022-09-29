<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 9/27/2022
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>create student</h1>
<a href="/product">back list product</a>
<c:if test='${requestScope["message"]!=null}'>
    <span style="color: blue" >${requestScope["message"]}</span>
</c:if>
<form method="post">
    <label>name</label><br>
    <input type="text" name="name"><br>
    <label>price</label><br>
    <input type="text" name="price"><br>
    <label>description</label><br>
    <input type="text" name="description"><br>
    <label>madeIn</label><br>
    <input type="text" name="madeIn"><br>
    <button>Create</button>
</form>
</body>
</html>
