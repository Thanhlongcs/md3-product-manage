<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 9/27/2022
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>product list</h1>
<a href="product?action=create">create product</a>
<c:if test='${requestScope["message"]!=null}'>
    <p>${requestScope["message"]}</p>
</c:if>
<table border="1" style="width: 100%">

    <tr>
        <th>ID</th>
        <th>name</th>
        <th>price</th>
        <th>description</th>
        <th>madeIn</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    <c:forEach var="pro" items='${requestScope["listProduct"]}'>
        <tr>
            <td>${pro.id}</td>
            <td>${pro.name}</td>
            <td>${pro.price}</td>
            <td>${pro.description}</td>
            <td>${pro.madeIn}</td>
            <td>
                <a href="product?action=edit&id=${pro.id}">edit</a>
            </td>
            <td>
                <a href="product?action=delete&id=${pro.id}">delete</a>
            </td>
        </tr>

    </c:forEach>

</table>

</body>
</html>
