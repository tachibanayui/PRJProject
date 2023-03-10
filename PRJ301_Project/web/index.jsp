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
        <title>Dashi Store</title>
        <link rel="stylesheet" href="..<%=request.getContextPath()%>/css/style.css"/>
        <link rel="stylesheet" href="..<%=request.getContextPath()%>/css/all.css"/>
        <link rel="stylesheet" href="..<%=request.getContextPath()%>/css/normalize.css"/>
        <script src="https://kit.fontawesome.com/fee9a9087e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Navbar & Header Section -->

        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index"><img src="img/logo.png" alt="Red Store"></a>
                </div>
                <nav>
                    <ul id="menuItems">
                        <li><a href="index">Home</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Contact</a></li>
                        <c:if test="${username != null}">
                        <li><a href="cart">Cart</a></li>
                        <li><a href="logout">Logout</a></li>
                        </c:if>
                        <c:if test="${username == null}">
                        <li><a href="login">Log In</a></li>
                        <li><a href="register">Sign Up</a></li>
                        </c:if>
                    </ul>
                </nav>
                <img src="img/menu.png" class="menuicon" alt="Menu icon" onclick="menuToggle();">
            </div>
        </div>

        <!-- Featured Products Section -->

        <div class="smallContainer">
            <div class="row row-2">
                <h2>All Product</h2>
                <form action="index" method="get">
                    <input type="text" placeholder="Enter Product Name" name="search" value="${search}">
                    <select name="sort">
                        <option value="asc">Ascending</option>
                        <option value="desc">Descending</option>
                    </select>
                    <input type="number" name="priceLow" placeholder="low">
                    <input type="number" name="priceHigh" placeholder="high">
                    <select name="category">
                        <c:forEach var="catItem" items="${categories}">
                            <option value="${catItem.categoryID}">${catItem.categoryName}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="Search"/>
                </form>
            </div>
            <div class="row">
                <c:forEach var="p" items="${products}">
                    <div class="col-4">
                        <img src="${p.imageUrl}" alt="">
                        <h4>${p.productName}</h4>
                        <p>${p.unitPrice}<span class="lastprice">${p.unitPrice*1.25}</span></p>
                    </div>
                </c:forEach>

            </div>
            <div class="page-btn">
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
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
                            <img src="img/play-store.png">
                            <img src="img/app-store.png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="img/logo-white.png" alt="">
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
                <p class="copyright">Copyright &copy; 2023 - Karala</p>
            </div>
        </div>
        <script src="js/all.js"></script>
        <script src="js/jquery-3.5.1.min.js"></script>
        <script src="js/myscript.js"></script>
    </body>
</html>
