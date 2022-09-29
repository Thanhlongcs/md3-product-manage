<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 9/27/2022
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/product">back to product list</a></p>
<form method="post">
<h3>are you sure</h3>
    <fieldset>
        <legend>product information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${requestScope["product"].getName()}</td>
            </tr>
            <tr>
                <td>Price: </td>
                <td>${requestScope["product"].getPrice()}</td>
            </tr>
            <tr>
                <td>Description: </td>
                <td>${requestScope["product"].getDescription()}</td>
            </tr>
            <tr>
                <td>MadeIn: </td>
                <td>${requestScope["product"].getMadeIn()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/customers">Back to customer list</a></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
