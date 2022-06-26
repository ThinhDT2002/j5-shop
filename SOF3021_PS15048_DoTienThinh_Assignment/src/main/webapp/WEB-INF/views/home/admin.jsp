<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<!----===== Iconscout CSS ===== -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <!--<title>Admin Dashboard Panel</title>-->
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <style type="text/css">
    	/* ===== Google Font Import - Poppins ===== */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

form {
  margin: 0px 30px;
}
form.disabled {
  pointer-events: none;
  opacity: 0.7;
}
form .dbl-field {
  display: flex;
  margin-bottom: 25px;
  justify-content: space-between;
}
.dbl-field .field {
  height: 50px;
  display: flex;
  position: relative;
  width: calc(100% / 2 - 13px);
}
.wrapper form i {
  position: absolute;
  top: 50%;
  left: 18px;
  color: #ccc;
  font-size: 17px;
  pointer-events: none;
  transform: translateY(-50%);
}
form .field input,
form .message textarea {
  width: 100%;
  height: 100%;
  outline: none;
  padding: 10px 50px;
  font-size: 16px;
  border-radius: 5px;
  border: 1px solid #ccc;
}
.field input::placeholder,
.message textarea::placeholder {
  color: #ccc;
}
.field input:focus,
.message textarea:focus {
  padding-left: 47px;
  border: 2px solid #0d6efd;
}
.field input:focus ~ i,
.message textarea:focus ~ i {
  color: #0d6efd;
}
form .message {
  position: relative;
}
form .message i {
  top: 30px;
  font-size: 20px;
}
form .message textarea {
  min-height: 130px;
  max-height: 230px;
  max-width: 100%;
  min-width: 100%;
  padding: 15px 20px 0 48px;
}
form .message textarea::-webkit-scrollbar {
  width: 0px;
}
.message textarea:focus {
  padding-top: 14px;
}
form .button-area {
  margin: 25px 0;
  display: flex;
  align-items: center;
}
.button-area button {
  color: #fff;
  border: none;
  outline: none;
  font-size: 18px;
  cursor: pointer;
  height: 30px;
  border-radius: 20px;
  background: linear-gradient(-60deg, #4481eb 0%, #04befe 100%);
  transition: background 0.3s ease;
}
.button-area button:hover {
  background: linear-gradient(-45deg, #04befe 0%, #4481eb 100%);
}
.button-area span {
  font-size: 17px;
  margin-left: 30px;
  display: none;
}
@media (max-width: 600px) {
  .wrapper header {
    text-align: center;
  }
  .wrapper form {
    margin: 35px 20px;
  }
  form .dbl-field {
    flex-direction: column;
    margin-bottom: 0px;
  }
  form .dbl-field .field {
    width: 100%;
    height: 45px;
    margin-bottom: 20px;
  }
  form .message textarea {
    resize: none;
  }
  form .button-area {
    margin-top: 20px;
    flex-direction: column;
  }
  .button-area button {
    width: 100%;
    font-size: 16px;
  }
  .button-area span {
    margin: 20px 0 0;
    text-align: center;
  }
}
:root {
  /* ===== Colors ===== */
  --primary-color: #0e4bf1;
  --panel-color: #fff;
  --text-color: #000;
  --black-light-color: #707070;
  --border-color: #e6e5e5;
  --toggle-color: #ddd;
  --box1-color: #4da3ff;
  --box2-color: #ffe6ac;
  --box3-color: #e7d1fc;
  --title-icon-color: #fff;

  /* ====== Transition ====== */
  --tran-05: all 0.5s ease;
  --tran-03: all 0.3s ease;
  --tran-03: all 0.2s ease;
}

body {
  min-height: 100vh;
  background-color: var(--primary-color);
}
body.dark {
  --primary-color: #3a3b3c;
  --panel-color: #242526;
  --text-color: #ccc;
  --black-light-color: #ccc;
  --border-color: #4d4c4c;
  --toggle-color: #fff;
  --box1-color: #3a3b3c;
  --box2-color: #3a3b3c;
  --box3-color: #3a3b3c;
  --title-icon-color: #ccc;
}
/* === Custom Scroll Bar CSS === */
::-webkit-scrollbar {
  width: 8px;
}
::-webkit-scrollbar-track {
  background: #f1f1f1;
}
::-webkit-scrollbar-thumb {
  background: var(--primary-color);
  border-radius: 12px;
  transition: all 0.3s ease;
}

::-webkit-scrollbar-thumb:hover {
  background: #0b3cc1;
}

body.dark::-webkit-scrollbar-thumb:hover,
body.dark .activity-data::-webkit-scrollbar-thumb:hover {
  background: #3a3b3c;
}

.menu__nav {
  position: fixed;
  top: 61px;
  left: 0;
  height: 100%;
  width: 250px;
  padding: 10px 14px;
  background-color: var(--panel-color);
  border-right: 1px solid var(--border-color);
  transition: var(--tran-05);
}
.menu__nav.close {
  width: 73px;
}
.menu__nav .logo-name {
  display: flex;
  align-items: center;
}
.menu__nav .logo-image {
  display: flex;
  justify-content: center;
  min-width: 45px;
}
.menu__nav .logo-image img {
  width: 40px;
  object-fit: cover;
  border-radius: 50%;
}

.menu__nav .logo-name .logo_name {
  font-size: 22px;
  font-weight: 600;
  color: var(--text-color);
  margin-left: 14px;
  transition: var(--tran-05);
}
.menu__nav.close .logo_name {
  opacity: 0;
  pointer-events: none;
}
.menu__nav .menu-items {
  margin-top: 5px;
  height: calc(100% - 90px);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.menu-items li {
  list-style: none;
}
.menu-items li a {
  display: flex;
  align-items: center;
  height: 50px;
  text-decoration: none;
  position: relative;
}
.nav-links li a:hover:before {
  content: "";
  position: absolute;
  left: -7px;
  height: 5px;
  width: 5px;
  border-radius: 50%;
  background-color: var(--primary-color);
}

body.dark li a:hover:before {
  background-color: var(--text-color);
}
.menu-items li a i {
  font-size: 24px;
  min-width: 45px;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--black-light-color);
}
.menu-items li a .link-name {
  font-size: 18px;
  font-weight: 400;
  color: var(--black-light-color);
  transition: var(--tran-05);
}
.menu__nav.close li a .link-name {
  opacity: 0;
  pointer-events: none;
}
.nav-links li a:hover i,
.nav-links li a:hover .link-name {
  color: var(--primary-color);
}
body.dark .nav-links li a:hover i,
body.dark .nav-links li a:hover .link-name {
  color: var(--text-color);
}
.menu-items .logout-mode {
  padding-top: 10px;
  border-top: 1px solid var(--border-color);
}
.menu-items .mode {
  display: flex;
  align-items: center;
  white-space: nowrap;
}
.menu-items .mode-toggle {
  position: absolute;
  right: 14px;
  height: 50px;
  min-width: 45px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}
.mode-toggle .switch {
  position: relative;
  display: inline-block;
  height: 22px;
  width: 40px;
  border-radius: 25px;
  background-color: var(--toggle-color);
}
.switch:before {
  content: "";
  position: absolute;
  left: 5px;
  top: 50%;
  transform: translateY(-50%);
  height: 15px;
  width: 15px;
  background-color: var(--panel-color);
  border-radius: 50%;
  transition: var(--tran-03);
}
body.dark .switch:before {
  left: 20px;
}

.dashboard {
  position: relative;
  left: 250px;
  background-color: var(--panel-color);
  min-height: 100vh;
  width: calc(100% - 250px);
  padding: 10px 14px;
  transition: var(--tran-05);
}
.menu__nav.close ~ .dashboard {
  left: 73px;
  width: calc(100% - 73px);
}
.dashboard .top {
  position: fixed;
  top: 0;
  left: 250px;
  display: flex;
  width: calc(100% - 250px);
  justify-content: space-between;
  align-items: center;
  padding: 10px 14px;
  background-color: var(--panel-color);
  transition: var(--tran-05);
  z-index: 10;
}
.menu__nav.close ~ .dashboard .top {
  left: 73px;
  width: calc(100% - 73px);
}
.dashboard .top .sidebar-toggle {
  font-size: 26px;
  color: var(--text-color);
  cursor: pointer;
}
.dashboard .top .search-box {
  position: relative;
  height: 45px;
  max-width: 600px;
  width: 100%;
  margin: 0 30px;
}
.top .search-box input {
  position: absolute;
  border: 1px solid var(--border-color);
  background-color: var(--panel-color);
  padding: 0 25px 0 50px;
  border-radius: 5px;
  height: 100%;
  width: 100%;
  color: var(--text-color);
  font-size: 15px;
  font-weight: 400;
  outline: none;
}
.top .search-box i {
  position: absolute;
  left: 15px;
  font-size: 22px;
  z-index: 10;
  top: 50%;
  transform: translateY(-50%);
  color: var(--black-light-color);
}
.top img {
  width: 40px;
  border-radius: 50%;
}
.dashboard .dash-content {
  padding-top: 50px;
}
.dash-content .title {
  display: flex;
  align-items: center;
  margin: 60px 0 30px 0;
}
.dash-content .title i {
  position: relative;
  height: 35px;
  width: 35px;
  background-color: var(--primary-color);
  border-radius: 6px;
  color: var(--title-icon-color);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
}
.dash-content .title .text {
  font-size: 24px;
  font-weight: 500;
  color: var(--text-color);
  margin-left: 10px;
}
.dash-content .boxes {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
}
.dash-content .boxes .box {
  display: flex;
  flex-direction: column;
  align-items: center;
  border-radius: 12px;
  width: calc(100% / 3 - 15px);
  padding: 15px 20px;
  background-color: var(--box1-color);
  transition: var(--tran-05);
}
.boxes .box i {
  font-size: 35px;
  color: var(--text-color);
}
.boxes .box .text {
  white-space: nowrap;
  font-size: 18px;
  font-weight: 500;
  color: var(--text-color);
}
.boxes .box .number {
  font-size: 26px;
  font-weight: 500;
  color: var(--text-color);
}
.boxes .box.box2 {
  background-color: var(--box2-color);
}
.boxes .box.box3 {
  background-color: var(--box3-color);
}
.dash-content .activity .activity-data {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}
.activity .activity-data {
  display: flex;
  overflow-x: scroll;
}
.activity-data .data {
  display: flex;
  flex-direction: column;
  margin: 0 15px;
}
.activity-data .data-title {
  font-size: 20px;
  font-weight: 500;
  color: var(--text-color);
}
.activity-data .data .data-list {
  font-size: 18px;
  font-weight: 400;
  margin-top: 20px;
  white-space: nowrap;
  text-align: center;
  color: var(--text-color);
}

.activity-data .data a:hover{
	color: orange;
}

.data__list-style-name{
  padding-bottom: 69px;
  padding-top: 17px;
  text-align: center;
}
.data__list-style-image{
  padding-bottom: 40px;
}

button {
  background-color: #2454da;
  width: 70px;
  border-radius: 5px;
  color: white;
}
button:hover {
  background-color: rgb(153, 216, 246);
}

@media (max-width: 1000px) {
  .menu__nav {
    width: 73px;
  }
  .menu__nav.close {
    width: 250px;
  }
  .menu__nav .logo_name {
    opacity: 0;
    pointer-events: none;
  }
  .menu__nav.close .logo_name {
    opacity: 1;
    pointer-events: auto;
  }
  .menu__nav li a .link-name {
    opacity: 0;
    pointer-events: none;
  }
  .menu__nav.close li a .link-name {
    opacity: 1;
    pointer-events: auto;
  }
  .menu__nav ~ .dashboard {
    left: 73px;
    width: calc(100% - 73px);
  }
  .menu__nav.close ~ .dashboard {
    left: 250px;
    width: calc(100% - 250px);
  }
  .menu__nav ~ .dashboard .top {
    left: 73px;
    width: calc(100% - 73px);
  }
  .menu__nav.close ~ .dashboard .top {
    left: 250px;
    width: calc(100% - 250px);
  }
  .activity .activity-data {
    overflow-x: scroll;
  }
}

@media (max-width: 780px) {
  .dash-content .boxes .box {
    width: calc(100% / 2 - 15px);
    margin-top: 15px;
  }
}
@media (max-width: 560px) {
  .dash-content .boxes .box {
    width: 100%;
  }
}
@media (max-width: 400px) {
  .menu__nav {
    width: 0px;
  }
  .menu__nav.close {
    width: 73px;
  }
  .menu__nav .logo_name {
    opacity: 0;
    pointer-events: none;
  }
  .menu__nav.close .logo_name {
    opacity: 0;
    pointer-events: none;
  }
  .menu__nav li a .link-name {
    opacity: 0;
    pointer-events: none;
  }
  .menu__nav.close li a .link-name {
    opacity: 0;
    pointer-events: none;
  }
  .menu__nav ~ .dashboard {
    left: 0;
    width: 100%;
  }
  .menu__nav.close ~ .dashboard {
    left: 73px;
    width: calc(100% - 73px);
  }
  .menu__nav ~ .dashboard .top {
    left: 0;
    width: 100%;
  }
  .menu__nav.close ~ .dashboard .top {
    left: 0;
    width: 100%;
  }
}
    	
    </style>
</head>
<body>
<div class="menu__nav">
        <div class="logo-name">
            <div class="logo-image">
                <!--<img src="images/logo.png" alt="">-->
            </div>

            <span class="logo_name">Admin</span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="#">
                    <i class='bx bx-bar-chart-alt'></i>
                        <span class="link-name">Statistics</span>
                    </a></li>
                <li><a href="#product">
                    <i class='bx bx-box' ></i>
                        <span class="link-name">Product</span>
                    </a></li>
                <li><a href="#user">
                    <i class='bx bx-user'></i>
                        <span class="link-name">User</span>
                    </a></li>
            </ul>

            <ul class="logout-mode">
                <li><a href="#">
                        <i class="uil uil-signout"></i>
                        <span class="link-name">Back</span>
                    </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                        <span class="link-name">Dark Mode</span>
                    </a>

                    <div class="mode-toggle">
                        <span class="switch"></span>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <section class="dashboard">
        <div class="top">
            <i class="uil uil-bars sidebar-toggle"></i>

           

            <!--<img src="images/profile.jpg" alt="">-->
        </div>

        <div class="dash-content">
            <div class="overview">
                <div class="title">
                    <i class='bx bx-bar-chart-alt' ></i>
                    <span class="text">Statistics</span>
                </div>

                <div class="boxes">
                    <div class="box box1">
                        <i class='bx bx-money' ></i>
                        <span class="text">Turnover</span>
                        <span class="number">
                        	<fmt:formatNumber value="${turnover}" type="currency" currencySymbol="VND" />
                        </span>
                    </div>
                    <div class="box box2">
                        <i class='bx bx-home-smile' ></i>
                        <span class="text">Depot</span>
                        <span class="number">
							${depot}
						</span>
                    </div>
                    <div class="box box3">
                        <i class='bx bx-cart-download' ></i>
                        <span class="text">Sold</span>
                        <span class="number">
                        	${sold}    
                        </span>
                    </div>
                </div>
            </div>

            <div class="activity" id="order">
                <div class="title">
                    <i class='bx bx-receipt'></i>
                    <span class="text">Bill</span>
                </div>
                <div class="activity-data">
                    <div class="data names">
                        <span class="data-title">OrderID</span>
					<c:forEach var="order" items="${adminOrders.content}">
						<span class="data-list">${order.id}</span>
					</c:forEach>
                    </div>
                    <div class="data email">
                        <span class="data-title">User</span>
					<c:forEach var="order" items="${adminOrders.content}">
						<span class="data-list">${order.account.fullname}</span>
					</c:forEach>
                    </div>
                    <div class="data joined">
                        <span class="data-title">Date</span>
					<c:forEach var="order" items="${adminOrders.content}">
						<span class="data-list">${order.createDate}</span>
					</c:forEach>
                    </div>
                    <div class="data type">
                        <span class="data-title">Address</span>
					<c:forEach var="order" items="${adminOrders.content}">
						<span class="data-list">${order.createDate}</span>
					</c:forEach>
                    </div>
                   	<div class="data status">
                        <span class="data-title">Status</span>
					<c:forEach var="order" items="${adminOrders.content}">
						<c:if test="${order.status == 1 }">
							<span class="data-list">Chờ xác nhận</span>
						</c:if>
						<c:if test="${order.status == 2 }">
							<span class="data-list">Đang giao hàng</span>
						</c:if>
						<c:if test="${order.status == 3 }">
							<span class="data-list">Đã giao hàng</span>
						</c:if>
					</c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title">Note</span>
					<c:forEach var="order" items="${adminOrders.content}">
						<span class="data-list">${order.note}</span>
					</c:forEach>
                    </div>
                </div>
                
                            <div class="btn-changepage">
            <a class="btn btn-primary offset-3" href="/home/admin?p=0#order">First</a>
            		<c:if test="${adminOrders.number == 0 }">
            			<a class="btn btn-primary" href="#order">Previous</a>
            		</c:if>
            		<c:if test="${adminOrders.number != 0 }">
            			<a class="btn btn-primary" href="/home/admin?p=${adminOrders.number-1}#order">Previous</a>
            		</c:if>
            		<c:if test="${adminOrders.number >= (adminOrders.totalPages - 1)}">
            			<a class="btn btn-primary" href="#order">Next</a>
            		</c:if>
            		<c:if test="${adminOrders.number < (adminOrders.totalPages - 1)}">
						<a class="btn btn-primary" href="/home/admin?p=${adminOrders.number+1}#order">Next</a>         		
            		</c:if>
					<a class="btn btn-primary" href="/home/admin?p=${adminOrders.totalPages-1}#order">Last</a>
            </div>
					<h5 align="center">${adminOrders.number+1}/${adminOrders.totalPages}</h5>
                
            </div>
        </div>

        <div class="dash-content" id="product">
            <div class="activity">
                <div class="title">
                    <i class='bx bx-box' ></i>
                    <span class="text">Product</span>
                </div>
                <div class="activity-data">
                
				
					<div class="data names">
					
                    <span class="data-title data__list-style-name" style="width: 120px;" >Product ID</span>
                    <c:forEach var="product" items="${adminProducts.content}">
                        <span class="data-list data__list-style-name">${product.id}</span>
                        </c:forEach>
                    </div>             
                    
                    <div class="data email">
                        <span class="data-title data__list-style-name">Name</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        <span class="data-list data__list-style-name">${product.name}</span>
                        </c:forEach>
                    </div>
                    
                    	<div class="data joined">
                        <span class="data-title data__list-style-name">Image1</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        <span class="data-list data__list-style-image">
                        <img style="width: 42px;
                            height: 42px;
                            margin: 12px;
                            border: 1px solid #9999;" src="../../../images/product/${product.image1}"/>
                        </span>
                        </c:forEach>
                    </div>
                    
                    <div class="data type">
                        <span class="data-title data__list-style-name">Image2</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	 <span class="data-list data__list-style-image">
                        <img style="width: 42px;
                            height: 42px;
                            margin: 12px;
                            border: 1px solid #9999;" src="../../../images/product/${product.image2}"/>
                        </span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                    	<span class="data-title data__list-style-name">Image3</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	 <span class="data-list data__list-style-image">
                        <img style="width: 42px;
                            height: 42px;
                            margin: 12px;
                            border: 1px solid #9999;" src="../../../images/product/${product.image3}"/>
                        </span>
                        </c:forEach>
                        
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Image4</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	 <span class="data-list data__list-style-image">
                        <img style="width: 42px;
                            height: 42px;
                            margin: 12px;
                            border: 1px solid #9999;" src="../../../images/product/${product.image4}"/>
                        </span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Color</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	<span class="data-list data__list-style-name">${product.color}</span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Price</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	<span class="data-list data__list-style-name">${product.price}</span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Quantity</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	<span class="data-list data__list-style-name">${product.quantity}</span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Manufactor</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	<span class="data-list data__list-style-name">${product.manufactor}</span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Description</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	<span class="data-list data__list-style-name">${product.description}</span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Discount</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	<span class="data-list data__list-style-name">${product.discount}</span>
                        </c:forEach>
                    </div>
                    
                    <div class="data status">
                        <span class="data-title data__list-style-name">Category_Id</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        	<span class="data-list data__list-style-name">${product.category.id}</span>
                        </c:forEach>
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name" style="width: 120px;">Chỉnh sửa</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        <span class="data-list data__list-style-name"><a href="/home/admin/edit/${product.id}" class="data-list">Edit</a></span>                        	
                        </c:forEach>                                                         
                    </div>
                    <div class="data status">
                        <span class="data-title data__list-style-name">Xoá</span>
                        <c:forEach var="product" items="${adminProducts.content}">
                        <span class="data-list data__list-style-name">
                        <form:form action="/home/admin" modelAttribute="product" enctype="multipart/form-data">
                        	<a href="/home/admin/delete/${product.id}" class="data-list">Delete</a>
                        </form:form>
                        </span>
                        </c:forEach>
                    </div>
                    
                </div>
            <div class="btn-changepage">
            <a class="btn btn-primary offset-3" href="/home/admin?p=0#product">First</a>
            		<c:if test="${adminProducts.number == 0 }">
            			<a class="btn btn-primary" href="#product">Previous</a>
            		</c:if>
            		<c:if test="${adminProducts.number != 0 }">
            			<a class="btn btn-primary" href="/home/admin?p=${adminProducts.number-1}#product">Previous</a>
            		</c:if>
            		<c:if test="${adminProducts.number >= (adminProducts.totalPages - 1)}">
            			<a class="btn btn-primary" href="#product">Next</a>
            		</c:if>
            		<c:if test="${adminProducts.number < (adminProducts.totalPages - 1)}">
						<a class="btn btn-primary" href="/home/admin?p=${adminProducts.number+1}#product">Next</a>         		
            		</c:if>
					<a class="btn btn-primary" href="/home/admin?p=${adminProducts.totalPages-1}#product">Last</a>
            </div>
					<h5 align="center">${adminProducts.number+1}/${adminProducts.totalPages}</h5>
            </div>
            </div>
            <div class="activity">
                <div class="title">
                    <i class='bx bxl-dropbox' ></i>
                    <span class="text">Thêm sản phẩm</span>
                </div>
                <div class="activity-data">
                    <form:form action="/home/admin" modelAttribute="product" enctype="multipart/form-data">
                        <label for="floatingProductId">Product ID</label>
                        <div class="dbl-field">
                            <div class="field"> 
                                <form:input id="floatingProductId" path="id" placeholder="Product ID" />
                                <i class='fas fa-user'></i>
                            </div>
                        </div>
                        <label for="floatProductName">Name</label>
                        <div class="dbl-field">
                            <div class="field">
                                <form:input id="floatProductName" path="name" placeholder="Name" />
                                <form:errors element="h6" path="name"/>
                                <i class='fas fa-envelope'></i>
                            </div>
                        </div>
                        <label for="file-Image1">Image1</label>
                        <div class="dbl-field">
                            <div class="field">
                                <input type="file" name="attach-file1" accept=".jpg,.png" id="file-Image1" placeholder="Image1" >
                                <h6>${errorImg1}</h6>
                            </div>
                        </div>
                        <label for="file-Image2">Image2</label>
                        <div class="dbl-field">
                            <div class="field">
                                <input type="file" name="attach-file2" accept=".jpg,.png" id="file-Image2" placeholder="Image2">
                                <h6>${errorImg2}</h6>
                            </div>
                        </div>
                        <label for="file-Image2">Image3</label>
                        <div class="dbl-field">
                            <div class="field">
                                <input type="file" name="attach-file3" accept=".jpg,.png" id="file-Image3" placeholder="Image3">
                                <h6>${errorImg3}</h6>
                            </div>
                        </div>
                        <label for="file-Image4">Image4</label>
                        <div class="dbl-field">
                            <div class="field">
                                <input type="file" name="attach-file4" accept=".jpg,.png" id="file-Image4" placeholder="Image4">
                                <h6>${errorImg4}</h6>
                            </div>
                        </div>
                        <label for="floatProductColor">Color</label>
                        <div class="dbl-field">
                            <div class="field">
                                <form:input  id="floatProductColor" path="color" placeholder="Color" />
  
                            </div>
                        </div>
                        <label for="floatProductPrice">Price</label>
                        <div class="dbl-field">
                            <div class="field">
                                <form:input  id="floatProductPrice" type="number" path="price" placeholder="Price" />
                               	<form:errors element="h6" path="price"/>
                            </div>
                        </div>
                        <label for="floatProductQuantity">Quantity</label>
                        <div class="dbl-field">
                            <div class="field">
                                <form:input id="floatProductQuantity" type="number" path="quantity" placeholder="Quantity" />
                                <form:errors element="h6" path="quantity"/>
                            </div>
                        </div>
                        <label for="floatManufactor">Manufactor</label>
                        <div class="dbl-field">
                            <div class="field">
                                <form:input id="floatManufactor" path="manufactor"  placeholder="Manufactor" />
                                
                            </div>
                        </div>
                        <label for="floatProductDiscount">Discount</label>
                        <div class="dbl-field">
                            <div class="field">
                                <form:input id="floatProductDiscount" type="number" min="0" max="100" path="discount"  placeholder="Discount" />
                                
                            </div>
                        </div>
                        
                        <label for="floatProductCategory">Category Id</label>
                        <div class="dbl-field">
                            <div class="field">
                                <form:select path="category.id">
                                	<form:options items="${comboBoxCategory}" itemValue="id" itemLabel="name"></form:options>
                                </form:select>
                                <form:errors element="h6" path="category"/>
                            </div>
                        </div>
                        <label for="floatProductDescription">Description</label>
                        <div class="message">
                            <form:textarea placeholder="Description" path="Description"></form:textarea>
                        </div>
                        <div class="button-area">
                            <button formaction="/home/admin/create">Thêm</button>
                        </div>
                    </form:form>
                </div>
            </div>


		<div class="dash-content" id="user">
			<div class="activity">
				<div class="title">
					<i class='bx bx-user'></i> <span class="text">User</span>
				</div>

				<div class="activity-data">
					<div class="data names">
						<span class="data-title">User</span>
						<c:forEach var="item" items="${adminUsers.content}">
							<span class="data-list">${item.username}</span>
						</c:forEach>
					</div>
					<div class="data email">
						<span class="data-title">Password</span>
						<c:forEach var="item" items="${adminUsers.content}">
							<span class="data-list">${item.password}</span>
						</c:forEach>
					</div>
					<div class="data joined">
						<span class="data-title">Fullname</span>
						<c:forEach var="item" items="${adminUsers.content}">
							<span class="data-list">${item.fullname}</span>
						</c:forEach>
					</div>
					<div class="data type">
						<span class="data-title">Phonenumber</span>
						<c:forEach var="item" items="${adminUsers.content}">
							<span class="data-list">${item.phonenumber}</span>
						</c:forEach>
					</div>
					<div class="data status">
						<span class="data-title">Email</span>
						<c:forEach var="item" items="${adminUsers.content}">
							<span class="data-list">${item.email}</span>
						</c:forEach>
					</div>
					<div class="data status">
						<span class="data-title">Photo</span>
						<c:forEach var="item" items="${adminUsers.content}">
							<span class="data-list">${item.photo}</span>
						</c:forEach>
					</div>
					<div class="data status">
						<span class="data-title">Admin</span>
						<c:forEach var="item" items="${adminUsers.content}">
							<span class="data-list">${item.admin}</span>
						</c:forEach>
					</div>
				</div>
				<div class="btn-changepage">
            <a class="btn btn-primary offset-3" href="/home/admin?pUser=0#user">First</a>
            		<c:if test="${adminUsers.number == 0 }">
            			<a class="btn btn-primary" href="#user">Previous</a>
            		</c:if>
            		<c:if test="${adminUsers.number != 0 }">
            			<a class="btn btn-primary" href="/home/admin?pUser=${adminUsers.number-1}#user">Previous</a>
            		</c:if>
            		<c:if test="${adminUsers.number >= (adminUsers.totalPages - 1)}">
            			<a class="btn btn-primary" href="#user">Next</a>
            		</c:if>
            		<c:if test="${adminUsers.number < (adminUsers.totalPages - 1)}">
						<a class="btn btn-primary" href="/home/admin?pUser=${adminUsers.number+1}#user">Next</a>         		
            		</c:if>
					<a class="btn btn-primary" href="/home/admin?pUser=${adminUsers.totalPages-1}#user">Last</a>
            </div>
					<h5 align="center">${adminUsers.number+1}/${adminUsers.totalPages}</h5>
            
			</div>
		</div>
	</section>
</body>
<script type="text/javascript">
const body = document.querySelector("body"),
modeToggle = body.querySelector(".mode-toggle");
sidebar = body.querySelector("nav");
sidebarToggle = body.querySelector(".sidebar-toggle");

let getMode = localStorage.getItem("mode");
if(getMode && getMode ==="dark"){
body.classList.toggle("dark");
}

let getStatus = localStorage.getItem("status");
if(getStatus && getStatus ==="close"){
sidebar.classList.toggle("close");
}

modeToggle.addEventListener("click", () =>{
body.classList.toggle("dark");
if(body.classList.contains("dark")){
  localStorage.setItem("mode", "dark");
}else{
  localStorage.setItem("mode", "light");
}
});

sidebarToggle.addEventListener("click", () => {
sidebar.classList.toggle("close");
if(sidebar.classList.contains("close")){
  localStorage.setItem("status", "close");
}else{
  localStorage.setItem("status", "open");
}
})
document.getElementById('floatingProductId').readOnly=true;

</script>
</html>