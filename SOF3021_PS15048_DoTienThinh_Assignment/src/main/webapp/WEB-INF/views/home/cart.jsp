<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Responsive Shopping Cart design</title>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<style type="text/css">
		* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
body {
	background: #F0F1F3;
	font-family: montserrat;
}
.text3d{
	font-size: 5em;
	font-family: sans-serif;
	text-transform: uppercase;
	font-weight: 800;
	letter-spacing: 10px;
	color: #3a71a9;
	text-shadow: -1px 1px #76bfb6,
				-2px 2px #76bfb6,
				-3px 3px #76bfb6,
				-4px 4px #76bfb6,
				-5px 5px #76bfb6,
				-6px 6px #76bfb6,
				-7px 7px #76bfb6,
				-8px 8px #76bfb6,
				-9px 9px #76bfb6,
				-10px 10px #76bfb6,
				-11px 11px #76bfb6,
				-12px 12px #76bfb6,
				-13px 13px #76bfb6,
				-14px 14px 20px rgba(0, 0, 0, 0.6)
	;
}
.address__input{
	margin-bottom: 20px;
	width: 50%;
	height: 10%;
}
.wrapper {
	max-width: 1200px;
	margin: 0 auto;
}
.wrapper h1 {
	padding: 45px 0;
	text-align: center;
	text-transform: uppercase;
}
.project {
	display: flex;
}
.shop {
	flex: 75%;
}
.box {
	display: flex;
	width: 100%;
	height: 200px;
	overflow: hidden;
	margin-bottom: 20px;
	background: #fff;
	transition: all .6s ease;
	box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}
.box:hover {
	border: none;
	transform: scale(1.01);
}
.box img {
	width: 300px;
	height: 200px;
	object-fit: cover;
}
.content {
	padding: 20px;
	width: 100%;
	position: relative;
}
.content h3 {
	margin-bottom: 30px;
}
.content h4 {
	margin-bottom: 50px;
}
.btn-area {
	position: absolute;
	bottom: 20px;
	right: 20px;
	padding: 10px 25px;
	background-color: #3a71a9;
	color: white;
	cursor: pointer;
	border-radius: 5px;
}
.btn-area:hover {
	background-color: #76bfb6;
	color: #fff;
	font-weight: 600;
}
.unit input {
	width: 40px;
	padding: 5px;
	text-align: center;
}
.btn-area i {
	margin-right: 5px;
}
.right-bar {
	flex: 25%;
	margin-left: 20px;
	padding: 20px;
	height: 400px;
	border-radius: 5px;
	background: #fff;
	box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}
.right-bar hr {
	margin-bottom: 25px;
}
.right-bar p {
	display: flex;
	justify-content: space-between;
	margin-bottom: 30px;
	font-size: 18px;
}
.right-bar a {
	background-color: #76bfb6;
	color: #fff;
	text-decoration: none;
	display: block;
	text-align: center;
	height: 40px;
	line-height: 40px;
	font-weight: 900;
}
.right-bar i {
	margin-right: 15px;
}
.right-bar a:hover {
	background-color: #3972a7;
}
@media screen and (max-width: 700px) {
	.content h3 {
		margin-bottom: 15px;
	}
	.content h4 {
		margin-bottom: 20px;
	}
	.btn2 {
		display: none;
	}
	.box {
		height: 150px;
	}
	.box img {
		height: 150px;
		width: 200px;
	}
}
@media screen and (max-width: 900px) {
	.project {
		flex-direction: column;
	}
	.right-bar {
		margin-left: 0;
		margin-bottom: 20px;
	}
}
@media screen and (max-width: 1250px) {
	.wrapper {
		max-width: 95%;
	}
}
	</style>
</head>
<body>
	<div class="wrapper">
		<h1 class="text3d">Shopping Cart</h1>
		<div class="project">
			<div class="shop">
				<c:forEach var="product" items="${shoppingCart.products}">
					<form action="/home/cart/update/${product.id}" method="post">
						<div class="box">
							<img src="../images/product/${product.image1}"/>
							<div class="content">
								<h3>${product.name}</h3>
								<h4>
									<fmt:formatNumber value="${newPrice}" type="currency" currencySymbol="VND"></fmt:formatNumber>/1
								</h4>
								<p class="unit">Quantity: <input name="quantity" type="number" onchange="this.form.submit()" value="${product.quantity}"/></p>
								<p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">
									<a href="/home/cart/remove/${product.id}">Remove</a>
								</span></p>
							</div>
						</div>
					</form>
				</c:forEach>
			</div>
			<div class="right-bar">
				<p><span>Subtotal</span> <span>
					<fmt:formatNumber value="${shoppingCart.amount}" type="currency" currencySymbol="VND"></fmt:formatNumber>
				</span></p>
				<hr>
				<p><span>Tax (5%)    </span> <span>
					<fmt:formatNumber value="${shoppingCart.tax}" type="currency" currencySymbol="VND"></fmt:formatNumber>
				</span></p>
				<hr>
				<p><span>Shipping    </span> <span>
					<fmt:formatNumber value="${shoppingCart.shipping}" type="currency" currencySymbol="VND"></fmt:formatNumber>
				</span></p>
				<hr>
				<p><span>Total    </span> <span>
					<fmt:formatNumber value="${shoppingCart.amount + shoppingCart.tax + shoppingCart.shipping}" type="currency" currencySymbol="VND"></fmt:formatNumber>
				</span></p><a href="#"><i class="fa fa-shopping-cart"></i>Checkout</a>
			</div>
		</div>
		<div class="right-bar" style="margin-bottom: 20px; margin-top: 20px; padding-bottom: 60px">
			<p><span>Delivery address</span></p>
			<input type="text" name="" id="" class="address__input">
			<hr>
			<p><span>Pick-up phone number</span></p>
			<input type="text" name="" id="" class="address__input">
			<hr>
			<p><span>replacement recipient's name (if any)</span></p>
			<input type="text" name="" id="" class="address__input">
		</div>
	</div>
</body>
</html>