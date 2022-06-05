<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>
	<!--===== HEADER =====-->
        <header class="l-header">
            <nav class="nav bd-grid">
                <div>
                    <a href="/home/index" class="nav__logo">DUYAN</a>
                </div>

                <div class="nav__menu" id="nav-menu">
                    <ul class="nav__list">
                        <li class="nav__item"><a href="/home/index" class="nav__link active">Home</a></li>
                        <li class="nav__item"><a href="/home/index#featured" class="nav__link">Featured</a></li>
                        <li class="nav__item"><a href="/home/index#new" class="nav__link">New</a></li>
                        <div class="drop__down-menu">
                            <li class="nav__item"><a class="nav__link">Menu</a></li>
                            <ul class="menu">
                                <li><i class='bx bx-desktop'></i>&nbsp;<a href="/home/index?category=PC">PC</a></li>
                                <li>
                                    <label for="btn" class="first"><i class='bx bx-laptop' ></i>&nbsp;<a href="/home/index?category=LAP">Laptop</a>
                                        <span><i class='bx bxs-down-arrow'></i></span>
                                    </label>
                                    <input type="checkbox" name="" id="btn">
                                    <ul>
                                        <li><a href="#">Asus</a></li>
                                        <li><a href="#">Lenovo</a></li>
                                    </ul>
                                </li>

                                <li>
                                    <label for="btn-2" class="second"><i class='bx bxs-devices'></i>&nbsp;<a href="/home/index?category=PHONE">Smartphone</a>
                                        <span><i class='bx bxs-down-arrow'></i></span>
                                    </label>
                                    <input type="checkbox" name="" id="btn-2">
                                    <ul>
                                        <li><a href="#">Apple</a></li>
                                        <li><a href="#">Samsung</a></li>
                                    </ul>
                                </li>

                                <li><a href="/home/index?category=GEAR"><i class='bx bxs-chip' ></i>&nbsp;Linh kiện máy tính</a></li>
                                <li><a href="/home/index?category=MOUSE"><i class='bx bxs-mouse-alt' ></i>&nbsp;Chuột + lót chuột</a></li>
                                <li><a href="/home/index?category=KEYB"><i class='bx bxs-keyboard' ></i>&nbsp;Bàn phím</a></li>
                                <li><a href="/home/index?category=HP"><i class='bx bx-headphone' ></i>&nbsp;Tai nghe</a></li>
                                <li><a href="/home/index?category=SPKER"><i class='bx bx-volume-full'></i></i>&nbsp;Loa</a></li>
                                <li><a href="/home/index?category=CHGER"><i class='bx bxs-battery-charging'></i>&nbsp;Bộ sạc</a></li>
                            </ul>
                        </div>
                        <li class="nav__item"><a href="/home/index#suscribe" class="nav__link">Suscribe</a></li>
                    </ul>
                </div>
                <div class="header__cart">
                    <div class="header__cart-wrap">
                        <i class='bx bx-cart nav__cart'></i>
                        <span class="header__cart-notice">${shoppingCart.count}</span>

                        <!--no cart: header__cart-list-no-cart -->
                        <div class="header__cart-list ">
                            <img src="assets/img/cart-img.jpg" alt="" class="header__cart-no-cart-img">
                            <span class="header__cart-list-no-cart-message">No product</span>

                            <h4 class="header__cart-heading">Product added</h4>
                            <ul class="header__cart-list-item">
                                <!-- Cart item -->
                                <c:forEach var="product" items="${shoppingCart.products}">
                                	<li class="header__cart-item">
                                		<img src="../images/product/${product.image1}"/>
                                		<div class="header__cart-item-info">
                                			<div class="header__cart-item-head">
                                				<h5 class="header__cart-item-name">${product.name}</h5>
                                				<div class="header__cart-item-price-wrap">
                                					<span class="header__cart-item-price">
                                						<fmt:formatNumber value="${newPrice}" type="currency" currencySymbol="VND"></fmt:formatNumber>
                                					</span>
                                					<span class="header__cart-item-multiply">x</span>
                                					<span class="header__cart-item-soluong">${product.quantity}</span>
                                				</div>
                                			</div>
                                			<div class="header__cart-item-body">
                                				<span class="header__cart-item-description">Classify: ${product.category.name}</span>
                                				<span class="header__cart-item-remove">Remove</span>
                                			</div>                    	
                                		</div>
                                	</li>
                                </c:forEach>
                                <!--  
                                <li class="header__cart-item">
                                    <img src="https://cf.shopee.vn/file/3a1e507ae75fcce015269797801ffd8e" alt="" class="header__cart-img">
                                    <div class="header__cart-item-info">
                                        <div class="header__cart-item-head">
                                            <h5 class="header__cart-item-name">IPHONE 13 512GB</h5>
                                            <div class="header__cart-item-price-wrap">
                                                <span class="header__cart-item-price">$2500</span>
                                                <span class="header__cart-item-multiply">x</span>
                                                <span class="header__cart-item-soluong">1</span>
                                            </div>
                                        </div>
                                        <div class="header__cart-item-body">
                                            <span class="header__cart-item-description">Classify: Pink</span>
                                            <span class="header__cart-item-remove">remove</span>
                                        </div>
                                    </div>
                                </li>

                                <li class="header__cart-item">
                                    <img src="https://cf.shopee.vn/file/f8ec3b6cd40e8f637116dd6b2c83aed4" alt="" class="header__cart-img">
                                    <div class="header__cart-item-info">
                                        <div class="header__cart-item-head">
                                            <h5 class="header__cart-item-name"> Apple Watch Series 6 44mm</h5>
                                            <div class="header__cart-item-price-wrap">
                                                <span class="header__cart-item-price">$990</span>
                                                <span class="header__cart-item-multiply">x</span>
                                                <span class="header__cart-item-soluong">1</span>
                                            </div>
                                        </div>
                                        <div class="header__cart-item-body">
                                            <span class="header__cart-item-description">Classify: Black</span>
                                            <span class="header__cart-item-remove">remove</span>
                                        </div>
                                    </div>
                                </li>

                                <li class="header__cart-item">
                                    <img src="https://cf.shopee.vn/file/a256a89d3b7b4b80224e768d9ff6fdff" alt="" class="header__cart-img">
                                    <div class="header__cart-item-info">
                                        <div class="header__cart-item-head">
                                            <h5 class="header__cart-item-name"> Apple AirPods</h5>
                                            <div class="header__cart-item-price-wrap">
                                                <span class="header__cart-item-price">$160</span>
                                                <span class="header__cart-item-multiply">x</span>
                                                <span class="header__cart-item-soluong">2</span>
                                            </div>
                                        </div>
                                        <div class="header__cart-item-body">
                                            <span class="header__cart-item-description">Classify: White</span>
                                            <span class="header__cart-item-remove">remove</span>
                                        </div>
                                    </div>
                                </li>
                                -->
                            </ul>
                            <div class="btn__view-cart">
                                <a href="/home/cart" class="header__cart-view-cart">View cart</a>
                            </div>
                            
                        </div>
                    </div>
                    <a href="/account/login"><span><i class='bx bxs-user'></i></span></a>   
                    
                </div>
                <i class='bx bx-menu nav__toggle' id="nav-toggle" ></i>
                
            </nav>
        </header>

</body>
</html>