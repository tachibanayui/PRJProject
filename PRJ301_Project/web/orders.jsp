<%-- 
    Document   : orders
    Created on : Mar 10, 2023, 2:41:33 PM
    Author     : Yui
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>total: ${count}</p>
        <c:forEach var="sex" items="${orders}">
            <p>${sex.orderID}</p>
            <c:forEach var="chitsu" items="${details[sex.orderID]}">
                <p>${chitsu.unitPrice}</p>
            </c:forEach>
        </c:forEach>
    </body>
</html>
