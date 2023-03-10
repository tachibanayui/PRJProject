<%-- 
    Document   : cart
    Created on : Mar 9, 2023, 10:12:07 PM
    Author     : Yui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your fucking cart</title>
    </head>
    <body>
        <c:forEach var="item" items="${cartItems}">
            <p>${products[item.productID].productName}</p>
            <form action="/cart/${item.productID}" method="post">
                <input type="number" name="quantity" value="${item.quantity}" required/>
                <input type="submit" name="action" value="Update"/>
                <input type="submit" name="action" value="Delete"/>
            </form>
        </c:forEach>
        <p>Total: ${total}</p>
        <form action="/cart/all" method="post">
            <input type="submit" name="action" value="Delete All"/>
            <input type="submit" name="action" value="Place Order"/>
        </form>
    </body>
</html>
