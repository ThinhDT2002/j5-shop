<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main class="l-main">
            <!--===== HOME =====-->
            <section class="home" id="home">
                <div class="home__container bd-grid">
                    <div class="home__data">
                        <h1 class="home__title">NEW <br><span>ARRIVARLS</span></h1>
                        <a href="#featured" class="button">GO SHOPPING</a>
                    </div>

                    <img src="..//img/home.png" alt="" class="home__img">
                </div>
            </section>

            <!--===== COLLECTION =====-->
            <section class="collection section">
                <div class="collection__container bd-grid">
                    <div class="collection__box">
                        <img src="..//img/iphone12.png" alt="" class="collection__img">

                        <div class="collection__data">
                            <h2 class="collection__title"><span class="collection__subtitle">Smart</span><br>Phone</h2>
                            <a href="#" class="collection__view">View collection</a>
                        </div>
                    </div>

                    <div class="collection__box">
                        
                        <div class="collection__data">
                            <h2 class="collection__title"><span class="collection__subtitle">Head</span><br>Phone</h2>
                            <a href="#" class="collection__view">View collection</a>
                        </div>

                        <img src="..//img/headphone.png" alt="" class="collection__img">
                    </div>
                </div>
            </section>

            <!--===== FEATURED PRODUCTS =====-->
            <section class="featured section" id="featured">
                <h2 class="section-title">FEATURED PRODUCT</h2>
                <a href="#" class="section-all">View All</a>
                <div class="featured__container bd-grid">
                	<c:forEach var="product" items="${products.content}">
                	<input type="hidden" id="${product.id}"/>
                		<span>
                			<div class="featured__product">
                				<div class="featured__box">
                					<div class="featured__new">NEW</div>
                					<a href="/home/product-detail?id=${product.id}">
                						<img src="../images/product/${product.image1}" alt="product.png" class="featured__img"/>
                					</a>
                				</div>
                				
                				<div class="featured__data">
                					<h3 class="featured__name">${product.name}</h3>
                					<span class="featured__preci">
                						<fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                					</span>
                				</div>
                			</div>
                		</span>
                	</c:forEach>
                	
                	<!--  
                    <a href="/home/product-detail">
                        <span>
                            <div class="featured__product">
                                <div class="featured__box">
                                    <div class="featured__new">NEW</div>
                                    <img src="..//img/feature1.png" alt="" class="featured__img">
                                </div>
        
                                <div class="featured__data">
                                    <h3 class="featured__name">Headphone One Black</h3>
                                    <span class="featured__preci">$29</span>
                                </div>
                            </div>
                        </span>
                    </a>
                    -->
				<!--  
                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature3.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Apple Air Pods</h3>
                            <span class="featured__preci">$122</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature2.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Speaker Beats Pill</h3>
                            <span class="featured__preci">$129</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>

                    <div class="featured__product">
                        <div class="featured__box">
                            <div class="featured__new">NEW</div>
                            <img src="..//img/feature4.png" alt="" class="featured__img">
                        </div>

                        <div class="featured__data">
                            <h3 class="featured__name">Smartwatch F9 Negro</h3>
                            <span class="featured__preci">$99</span>
                        </div>
                    </div>
                    -->
                </div>
                
            </section>
            <div class="btn-changepage">
            <a class="btn btn-primary offset-3" href="/home/index?p=0&category=${category}">First</a>
					<a class="btn btn-primary" href="/home/index?p=${products.number-1}&category=${category}">Previous</a>
					<a class="btn btn-primary" href="/home/index?p=${products.number+1}&category=${category}">Next</a>
					<a class="btn btn-primary" href="/home/index?p=${products.totalPages-1}&category=${category}">Last</a>
            </div>
					
            <!--===== OFFER =====-->
            <section class="offer section">
                <div class="offer__bg">
                    <div class="offer__data">
                        <h2 class="offer__title">Special Offer</h2>
                        <p class="offer__description">Special offerts discounts for women this week only</p>
                        
                        <a href="" class="button">SHOP NOW</a>
                    </div>
                </div>
            </section>

            <!--===== NEW ARRIVALS =====-->
            <section class="new section" id="new">
                <h2 class="section-title">NEW ARRIVALS</h2>
                <a href="#" class="section-all">View All</a>
                
                <div class="new__container bd-grid">
                    <div class="new__box">
                        <img src="..//img/new4.png" alt="" class="new__img">

                        <div class="new__link">
                            <a href="#" class="button">VIEW PRODUCT</a>
                        </div>
                    </div>

                    <div class="new__box">
                        <img src="..//img/new4.png" alt="" class="new__img">

                        <div class="new__link">
                            <a href="#" class="button">VIEW PRODUCT</a>
                        </div>
                    </div>

                    <div class="new__box">
                        <img src="..//img/new4.png" alt="" class="new__img">

                        <div class="new__link">
                            <a href="#" class="button">VIEW PRODUCT</a>
                        </div>
                    </div>

                    <div class="new__box">
                        <img src="..//img/new4.png" alt="" class="new__img">

                        <div class="new__link">
                            <a href="#" class="button">VIEW PRODUCT</a>
                        </div>
                    </div>

                    <div class="new__box">
                        <img src="..//img/new4.png" alt="" class="new__img">

                        <div class="new__link">
                            <a href="#" class="button">VIEW PRODUCT</a>
                        </div>
                    </div>

                    <div class="new__box">
                        <img src="..//img/new4.png" alt="" class="new__img">

                        <div class="new__link">
                            <a href="#" class="button">VIEW PRODUCT</a>
                        </div>
                    </div>
                </div>
            </section>

            <!--===== NEWSLETTER =====-->
            <section class="newsletter section" id="suscribe">
                <div class="newsletter__container bd-grid">
                    <div class="newsletter__suscribe">
                        <h2 class="section-title">OUR  NEWSLETTER</h2>
                        <p class="newsletter__description">Promotion new products and sales. Directly to your</p>

                        <form action="" class="newsletter__form">
                            <input type="text" class="newsletter__input" placeholder="Enter your email">
                            <a href="#" class="button">SUSCRIBE</a>
                        </form>
                    </div>
                </div>
            </section>

            <!--===== SPONSORS =====-->
            <section class="sponsors section">
                <div class="sponsors__container bd-grid">
                    <div class="sponsors__logo">
                        <img src="..//img/logo1.png" alt="">
                    </div>

                    <div class="sponsors__logo">
                        <img src="..//img/logo2.png" alt="">
                    </div>

                    <div class="sponsors__logo">
                        <img src="..//img/logo3.png" alt="">
                    </div>

                    <div class="sponsors__logo">
                        <img src="..//img/logo4.png" alt="">
                    </div>
                </div>
            </section>
        </main>
</body>
</html>