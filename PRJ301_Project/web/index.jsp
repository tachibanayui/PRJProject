<%-- 
    Document   : index
    Created on : Mar 6, 2023, 12:56:55 AM
    Author     : Yui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>nakadashi store</title>
    </head>
    <body>
        
        <c:if test="${username != null}">
            <h1>Hello: ${username}!</h1>
            <a href="logout">Logout</a>
        </c:if>
        <c:if test="${username == null}">
            <h1>Please login: </h1>
            <a href="login">Login</a>
        </c:if>
            
        <form action="/" method="GET">
            Search <input type="text" name="search" value="${search}"/>
            <br/>
            Sort 
            <select name="sort">
                <option value="asc">Ascending</option>
                <option value="desc">Descending</option>
            </select>
            <br/>
            Filters: 
            <br/>
            Category:
            <select name="category">
                <c:forEach var="catItem" items="${categories}">
                    <option value="${catItem.categoryID}">${catItem.categoryName}</option>
                </c:forEach>
            </select>
            <br/>
            Price
            <input type="number" name="priceLow" placeholder="low"/>
            <input type="number" name="priceHigh" placeholder="high"/>
            <br/>
            Page:
            <input type="number" name="page" />
            <br />
            <input type="submit" value="Search"/>
        </form>
        
        <c:forEach var="p" items="${products}">
            <p>${p.productName}</p>
        </c:forEach>
            
        <p>${products.size()}</p>
    </body>
</html>
