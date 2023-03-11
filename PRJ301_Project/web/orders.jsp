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
        <link rel="stylesheet" href="../css/style.css"/>
        <link rel="stylesheet" href="../css/all.css"/>
        <link rel="stylesheet" href="../css/normalize.css"/>
        <script src="https://kit.fontawesome.com/fee9a9087e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath()%>/img/logo.png" alt="Red Store"></a>
                </div>
                <nav>
                    <ul id="menuItems">
                        <li><a href="index">Home</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Contact</a></li>
                            <c:if test="${sessionScope.username != null}">
                            <li><a href="/cart">Cart</a></li>
                            <li><a href="orders">Orders</a></li>
                            <li><a href="<%=request.getContextPath()%>/logout">Logout</a></li>
                            </c:if>
                            <c:if test="${sessionScope.username == null}">
                            <li><a href="<%=request.getContextPath()%>/login">Log In</a></li>
                            <li><a href="<%=request.getContextPath()%>/register">Sign Up</a></li>
                            </c:if>
                    </ul>
                </nav>
                <img src="img/menu.png" class="menuicon" alt="Menu icon" onclick="menuToggle();">
            </div>
        </div>


        <div class="container">
            <h3>Number Of Orders: ${count}</h3>
            <table class="order">
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Ship Address</th>
                    <th>Order Detail</th>
                </tr>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.orderID}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.shipAddress}</td>
                        <td>
                            <table class="order">
                                <c:forEach var="d" items="${details[order.orderID]}" varStatus="status">
                                    <tr>
                                        <td>
                                            <div class="order-info">
                                                <img src="${d.product.imageUrl}"/>
                                                <div>
                                                    <p>${d.product.productName}</p>
                                                    <small
                                                        >Price:${String.format("%10.0f", d.product.unitPrice)}
                                                    </small>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Quantity: ${d.quantity}</td>
                                        <td>Sub Total: ${String.format("%10.0f", d.unitPrice)}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App for Android and ios mobile phone</p>
                        <div class="app-logo">
                            <img src="<%=request.getContextPath()%>/img/play-store.png">
                            <img src="<%=request.getContextPath()%>/img/app-store.png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="<%=request.getContextPath()%>/img/logo.png" alt="">
                        <p>Our Purpose Is To Sustainably Make The Pleasure and Benefits of Smart Phones Accessible to The Many.</p>
                    </div>
                    <div class="footer-col-3">
                        <h3>Useful Links</h3>   
                        <ul>
                            <li><a href="">Coupons</a></li>
                            <li><a href="">Blog Post</a></li>
                            <li><a href="">Return Policy</a></li>
                            <li><a href="">Join Affiliate</a></li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow Us</h3>
                        <ul>
                            <li><a href="">Facebook</a></li>
                            <li><a href="">Linked In</a></li>
                            <li><a href="">Instagram</a></li>
                            <li><a href="">YouTube</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright &copy; 2023 - Karala, sharpi, Nguyen Quang Huy</p>
            </div>
        </div>
    </body>
</html>
