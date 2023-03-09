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
        <c:forEach var="{item}" items="{cartItems}">
            
        </c:forEach>
    </body>
</html>
