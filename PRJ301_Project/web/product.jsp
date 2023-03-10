<%-- 
    Document   : product
    Created on : Mar 9, 2023, 8:36:32 PM
    Author     : Yui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${product.productName}</title>
    </head>
    <body>
        <p>${status}</p>
        <p>Unit price: ${product.unitPrice}</p>
        <p>${product.unitsInStock} remaining</p>
        <form action="${product.productID}" method="post">
            Amount <input type="number" name="quantity" value="1"/>
            <input type="submit" name="action" value="Add to cart"/>
        </form>
    </body>
</html>
