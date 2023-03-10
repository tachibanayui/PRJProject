<%-- 
    Document   : product
    Created on : Mar 9, 2023, 8:36:32 PM
    Author     : Yui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${product.productName}</title>
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
                            

        <!-- single product detail --> 
        <div class="smallContainer single-product">
            <div class="row">
                <div class="col-2">
                    <img src="${product.imageUrl}" alt="alt" width="100%"/> 
                </div>
                <div class="col-2">
                    <p>${status}</p>
                    <p>${product.productName}</p>
                    <p>${product.unitsInStock} remaining</p>
                    <h4>Unit price: ${String.format("%10.0f", product.unitPrice)} VND</h4>
                    <form action="${product.productID}" method="post">
                        <input type="number" name="quantity" value="1"/>
                        <input type="submit" name="action" value="Add to cart"/>
                    </form>
                    <h4>
                        Detail <i class="fa fa-indent"></i>
                    </h4>
                    <p>iPhone 14 Pro Max là mẫu flagship nổi bật nhất của Apple trong lần trở lại năm 2022 với nhiều cải tiến về công nghệ cũng như vẻ ngoài cao cấp, sang chảnh hợp với gu thẩm mỹ đại chúng. Những chiếc điện thoại đến từ nhà Táo Khuyết nhận được rất nhiều sự kỳ vọng của thị trường ngay từ khi chưa ra mắt. Vậy liệu những chiếc flagship đến từ công ty công nghệ hàng đầu thế giới này có làm bạn thất vọng? Cùng khám phá những điều thú vị về iPhone 14 Pro Max ở bài viết dưới đây nhé.</p>
                </div>
            </div>
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
                        <img src="<%=request.getContextPath()%>/img/logo-white.png" alt="">
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
