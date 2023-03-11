<%-- Document : cart Created on : Mar 9, 2023, 10:12:07 PM Author : Yui --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
                                                                 uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Your Cart</title>
        <link
            rel="stylesheet"
            href="..<%=request.getContextPath()%>/css/style.css"
            />
        <link rel="stylesheet" href="..<%=request.getContextPath()%>/css/all.css" />
        <link
            rel="stylesheet"
            href="..<%=request.getContextPath()%>/css/normalize.css"
            />
        <script
            src="https://kit.fontawesome.com/fee9a9087e.js"
            crossorigin="anonymous"
        ></script>
    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="<%=request.getContextPath()%>/index"><img src="<%=request.getContextPath()%>/img/logo.png" alt="Red Store" /></a>
                </div>
                <nav>
                    <ul id="menuItems">
                        <li><a href="<%=request.getContextPath()%>/index">Home</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Contact</a></li>
                            <c:if test="${username != null}">
                            <li><a href="/cart">Cart</a></li>
                            <li><a href="<%=request.getContextPath()%>/orders">Orders</a></li>
                            <li><a href="logout">Logout</a></li>
                            </c:if>
                            <c:if test="${username == null}">
                            <li><a href="login">Log In</a></li>
                            <li><a href="register">Sign Up</a></li>
                            </c:if>
                    </ul>
                </nav>
                <img
                    src="img/menu.png"
                    class="menuicon"
                    alt="Menu icon"
                    onclick="menuToggle();"
                    />
            </div>
        </div>

        <!-- cart item details -->
        <div class="smallContainer order-page">
            <table class="cart">
                <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                    <th>Option</th>
                </tr>

                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>
                            <div class="cart-info">
                                <img src="${products[item.productID].imageUrl}" alt="alt" />
                                <div>
                                    <p>${products[item.productID].productName}</p>
                                    <small
                                        >Price: ${String.format("%10.0f",item.unitPrice)}</small
                                    >
                                </div>
                            </div>
                        </td>
                    <form action="/cart/${item.productID}" method="post">
                        <td>
                            <input
                                type="number"
                                name="quantity"
                                value="${item.quantity}"
                                required
                                />
                        </td>
                        <td>${String.format("%10.0f", item.quantity*item.unitPrice)}</td>
                        <td>
                            <input type="submit" name="action" value="Update" />
                            <input type="submit" name="action" value="Remove" />
                        </td>
                    </form>
                    </tr>
                </c:forEach>
            </table>

            <div class="total-price">
                <table>
                    <tr>
                        <td>Subtotal</td>
                        <td>${String.format("%10.0f",total)}</td>
                    </tr>
                    <tr>
                        <td>Tax</td>
                        <td>${String.format("%10.0f",total*(0.1))}</td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td>${String.format("%10.0f",total*(1.1))}</td>
                    </tr>
                </table>
                <div class="option">
                    <form action="/cart/all" method="post">
                        <input type="submit" name="action" value="Delete All" />
                    </form>
                </div>  
                <div class="option2">
                    <form action="/orders" method="post">
                        <input
                            type="text"
                            name="shipAddress"
                            value="${shipAddress}"
                            required
                            placeholder="Enter Your Ship Address"
                            />
                        <input type="submit" name="action" value="Place Order" />
                    </form>
                </div>
            </div>
        </div>
        <!-- Footer Section -->

        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App for Android and ios mobile phone</p>
                        <div class="app-logo">
                            <img src="<%=request.getContextPath()%>/img/play-store.png" />
                            <img src="<%=request.getContextPath()%>/img/app-store.png" />
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="<%=request.getContextPath()%>/img/logo.png" alt="" />
                        <p>
                            Our Purpose Is To Sustainably Make The Pleasure and Benefits of
                            Smart Phones Accessible to The Many.
                        </p>
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
                <hr />
                <p class="copyright">Copyright &copy; 2023 - Karala, sharpi, Nguyen Quang Huy</p>
            </div>
        </div>
    </body>
</html>
