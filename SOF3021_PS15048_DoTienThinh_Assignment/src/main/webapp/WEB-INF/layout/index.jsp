<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>J5 Shop</title>
<!-- ===== BOXICONS ===== -->
        <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>

<style type="text/css">
	/*===== GOOGLE FONTS =====*/
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap");

/*===== VARIABLES CSS =====*/
:root {
  --header-height: 3rem;
  --font-semi: 600;
  --font-bold: 700;
}

/*===== Colores =====*/
:root {
  --first-color: #E55947;
  --first-color-alt: #D2321E;
  --white-color: #FAFAFF;
  --dark-color: #101010;
  --dark-color-light: #606060;
  --gray-color: #F0F1F3;
  --text-color: #000000CC;
}

/*===== Fuente y tipografia =====*/
:root {
  --body-font: 'Open Sans', sans-serif;
  --big-font-size: 3rem;
  --h1-font-size: 1.5rem;
  --h2-font-size: 1.25rem;
  --normal-font-size: .938rem;
  --small-font-size: .75rem;
}

@media screen and (min-width: 1024px) {
  :root {
    --big-font-size: 6rem;
    --h1-font-size: 2.25rem;
    --h2-font-size: 1.5rem;
    --normal-font-size: 1rem;
    --small-font-size: .813rem;
  }
}

/*===== Margenes =====*/
:root {
  --mb-1: 0.5rem;
  --mb-2: 1rem;
  --mb-3: 1.5rem;
  --mb-4: 2rem;
}

/*===== z index =====*/
:root {
  --z-tooltip: 10;
  --z-fixed: 100;
}

/*===== BASE =====*/
*, ::before, ::after {
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  margin: var(--header-height) 0 0 0;
  font-family: var(--body-font);
  font-size: var(--normal-font-size);
  color: var(--dark-color);
  line-height: 1.6;
}

h1, h2, p {
  margin: 0;
}

ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

a {
  text-decoration: none;
  color: var(--dark-color);
}

img {
  max-width: 100%;
  height: auto;
}

/*===== CLASS CSS ===== */
.section{
  padding: 3rem 0;
}

.section-title{
  font-size: var(--h2-font-size);
  color: var(--dark-color);
  margin: var(--mb-4) 0 var(--mb-1);
  text-align: center;
}

.section-all{
  display: block;
  font-size: var(--small-font-size);
  font-weight: var(--font-semi);
  color: var(--dark-color-light);
  text-align: center;
  margin-bottom: var(--mb-2);
}

/*===== LAYOUT =====*/
.bd-grid{
  max-width: 1024px;
  display: grid;
  grid-template-columns: 100%;
  grid-column-gap: 2rem;
  width: calc(100% - 3rem);
  margin-left: var(--mb-3);
  margin-right: var(--mb-3);
}

.l-header{
  width: 100%;
  position: fixed;
  top: 0;
  left: 0;
  z-index: var(--z-fixed);
  background-color: #04befe;
}

/*===== NAV =====*/
.nav{
  height: var(--header-height);
  display: flex;
  justify-content: space-between;
  align-items: center;
}
@media screen and (max-width: 768px) {
  .nav__menu{
    position: fixed;
    top: var(--header-height);
    right: -100%;
    width: 80%;
    height: 100%;
    padding: 2rem;
    background-color: var(--white-color);
    transition: .5s;
  }
}
.nav__item{
  margin-bottom: var(--mb-4);
}

.nav__link{
  color: var(--dark-color);
  font-weight: var(--font-semi);
}

.nav__link:hover{
  color: var(--first-color);
}

.nav__logo{
  font-weight: var(--font-bold);
  color: var(--white-color);
  font-size: 1.5rem;
}

.nav__cart{
  font-size: 1.5rem;
  margin-right: var(--mb-2);
}

.nav__toggle{
  font-size: 1.5rem;
  cursor: pointer;
}
/*=== Show menu ===*/
.show{
  right: 0;
}
.active{
  color: var(--first-color);
}
/*===== BTN =====*/
.btn__view-cart{
  position: relative;
  text-transform: uppercase;
  font-weight: bold;
  width: 200px;
  margin: auto;
  padding: 10px 10px;
  letter-spacing: 1px;
  cursor: pointer;
  font-size: 10px;
  border-radius: 20px;
  background: linear-gradient(to right, #03effe, #026be2);
  overflow: hidden;
  margin-top: 10px;
  margin-bottom: 5px;
}
.btn__view-cart a{
  font-family: sans-serif;
  color: var(--text-color);
}

.btn__view-cart::before{
  content: '';
  position: absolute;
  height: 100px;
  width: 20px;
  background: #f3f3f3;
  box-shadow: 0 0 10px #fff;
  filter: blur(1px);
  opacity: 0.9;
  top: -30px;
  transition: 0.7s;
  transform: rotate(-20deg) translateX(-60px);
}

.btn__view-cart:hover:before{
  transform: rotate(-20deg) translate(140px, 70px);
}
/*===== MENU =====*/

.drop__down-menu{
  position: relative;
  display: inline-block;
  cursor: pointer;
  padding-right: 10px;
  padding-bottom: 10px;
  
}

.drop__down-menu:hover .menu {
  display: block;
}

.menu{
  position: absolute;
  background-color: var(--white-color);
  list-style: none;
  top: -190px;
  right: 215px;
  width: 300px;
  display: none;
  box-shadow: 0 1px 2.125rem 0 rgba(0, 0, 0, 0.2);
}

.menu::after{
  content: '';
  position: absolute;
  height: 20px;
  width: 20px;
  background: var(--white-color);
  right: 20px;
  top: -10px;
  transform: rotate(45deg);
  z-index: -1;
}

.menu li{
  line-height: 40px;
  padding: 8px 20px;
  cursor: pointer;

}

.menu li span{
  font-size: 15px;
}

.menu ul{
  position: static;
}

.menu input{
  display: none;
}

[id^=btn]:checked + ul li {
  display: block;
}

.menu ul li{
  line-height: 30px;
  padding-left: 30px;
  border-bottom: none;
  display: none;
}

.menu ul li a{
  color: var(--text-color);
  font-size: 15px;
}

.menu li label{
  font-size: 18px;
  color: var(--text-color);
}

.menu li a{
  color: var(--text-color);
  text-decoration: none;
}

.menu li a:hover,
.menu li label:hover
{
  color: var(--first-color) ;
}
/*===== CART =====*/
.header__cart{
  text-align: center;
}

.header__cart-wrap{
  position: relative;
  display: inline-block;
  padding: 2px 3px;
  cursor: pointer;
}

.header__cart-wrap:hover .header__cart-list{
  display: block;
}

.header__cart-list{
  position: absolute;
  top: calc(100% + 4px);
  right: -120px;
  background-color: var(--white-color);
  width: 300px;
  border-radius: 2px;
  box-shadow: 0 1px 2.125rem 0 rgba(0, 0, 0, 0.2);
  display: none;
  cursor: default;
}

.header__cart-list::after{
  cursor: pointer;
  content: "";
  position: absolute;
  right: 123px;
  top: -30px;
  border-width: 20px 26px;
  border-style: solid;
  border-color: transparent transparent var(--white-color) transparent;
}

.header__cart-list-no-cart .header__cart-no-cart-img,
.header__cart-list-no-cart .header__cart-list-no-cart-message{
  margin-left: auto;
  margin-right: auto;
  display: block;
}
.header__cart-no-cart-img{
  width: 50%;
  display: none;
}

.header__cart-list-no-cart{
  padding: 24px 0;
}

.header__cart-list-no-cart-message{
  display: none;
  font-size: 1.2rem;
  color: var(--text-color);
}

.header__cart-notice{
  position: absolute;
  top: 3px;
  text-align: center;
  right: 3px;
  padding: 1px 7px;
  font-size: 0.7rem;
  width: 1.4rem;
  line-height: 0.6rem;
  border-radius: 10px;
  border: 2px solid #4ac2eb;
  color: #04befe;
  background-color: var(--white-color);
}

/* cart item */
.header__cart-heading{
  text-align: left;
  margin: 8px 0 8px 12px;
  font-size: 1rem;
  color: #999;
  font-weight: 400; 
}

.header__cart-list-item{
  padding-left: 0;
  list-style: none;
}

.header__cart-item{
  display: flex;
  align-items: center;
}

.header__cart-item:hover{
  background-color: #f4efef;
}

.header__cart-img{
  width: 42px;
  height: 42px;
  margin: 12px;
  border: 1px solid #9999;
}

.header__cart-item-info{
  width: 100%;
  margin-right: 12px;
}

.header__cart-item-head{
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.header__cart-item-name{
  font-size: 1rem;
  font-weight: 500;
  color: var(--text-color);
  margin: 0;
}

.header__cart-item-price{
  font-size: 1rem;
  font-weight: 400;
  color: #04befe;
}

.header__cart-item-multiply{
  font-size: 0.7rem;
  margin: 0 4px;
  color: #757575;
}

.header__cart-item-soluong{
  color: #757575;
  font-size: 0.9rem;
}

.header__cart-item-body{
  display: flex;
  justify-content: space-between;
}

.header__cart-item-description{
  color: #757575;
  font-size: 0.75rem;
  font-weight: 300;
}

.header__cart-item-remove{
  color: var(--text-color);
  font-size: 0.85rem;
}

.header__cart-item-remove:hover{
  cursor: pointer;
  color: #04befe;
}

.header__cart-view-cart{
  margin: 0 12px 12px 0;
}
/*===== HOME =====*/
.home{
  background-color: var(--gray-color);
}

.home__container{
  height: calc(100vh - var(--header-height));
}

.home__data{
  padding-top: 6rem;
}

.home__title{
  align-self: center;
  font-size: var(--big-font-size);
  line-height: 1;
  letter-spacing: .5rem;
  margin-bottom: 4rem;
}

.home__title span{
  font-size: var(--h1-font-size);
}
.home__img{
  position: absolute;
  right: 0;
  bottom: 0;
  width: 260px;
}

/*BUTTONS*/
.button{
  display: inline-block;
  background-color: var(--first-color);
  color: var(--white-color);
  padding: 1rem;
  font-size: var(--small-font-size);
  font-weight: var(--font-semi);
  transition: .3s;
}

.button:hover{
  background-color: var(--first-color-alt);
}

/*===== COLLECTION =====*/
.collection__container{
  row-gap: 2rem;
}

.collection__box{
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 1.2rem;
  background-color: var(--gray-color);
  transition: .3s;
}

.collection__box:hover{
  transform: translateY(-.5rem);
}

.collection__img{
  width: 60%;
}

.collection__title{
  font-size: var(--h1-font-size);
  line-height: 1.2;
  margin-bottom: var(--mb-2);
  text-transform: uppercase;
  font-weight: var(--font-semi);
}

.collection__subtile{
  font-size: var(--h2-font-size);
  color: var(--dark-color-light);
}

.collection__view{
  font-size: var(--small-font-size);
  color: var(--dark-color-light);
}

.collection__view:hover{
  text-decoration: underline;
}
/*===== FEATURED PRODUCTS =====*/
.featured__container{
  row-gap: 2rem;
}

.featured__product{
  transition: .3s;
}

.featured__product:hover{
  transform: translateY(-.5rem);
}

.featured__box{
  position: relative;
  display: flex;
  justify-content: center;
  background-color: var(--gray-color);
}

.featured__new{
  position: absolute;
  top: 0;
  left: 0;
  background-color: var(--first-color);
  color: var(--white-color);
  padding: .3rem .75rem;
  font-size: var(--small-font-size);
}
.featured__data{
text-align: center;
}

.featured__name{
  margin-bottom: var(--mb-1);
  text-transform: uppercase;
  font-size: var(--normal-font-size);
}

.featured__preci{
  color: var(--dark-color-light);
  font-weight: var(--font-semi);
}

/*===== OFFER =====*/
.offer__bg{
  background: url('../img/offer.jpg') no-repeat center/cover;
  text-align: center;
}

.offer__data{
  padding: 3.2rem .25rem;
  background: rgba(0, 0, 0, .5);
  color: var(--white-color);
}

.offer__title{
  font-size: var(--h1-font-size);
  letter-spacing: .2rem;
  text-transform: uppercase;
  font-weight: var(--font-semi);
}

.offer__description{
  margin-bottom: var(--mb-2);
  letter-spacing: .2rem;
}

/*===== NEW ARRIVALS =====*/
.new__container{
  row-gap: 2rem;
}

.new__box{
  position: relative;
  display: flex;
  justify-content: center;
  background-color: var(--gray-color);
  overflow: hidden;
}

.new__box:hover .new__link{
  bottom: 0;
}

.new__link{
  position: absolute;
  bottom: -100%;
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(229, 89, 71, .2);
  transition: .3s;
}

/*===== NEWSLETTER =====*/
.newsletter__container{
  text-align: center;
}

.newsletter__description{
  margin-bottom: var(--mb-2);
  font-size: var(--small-font-size);
  color: var(--dark-color-light);
}

.newsletter__form{
  display: grid;
  grid-template-columns: 1fr .5fr;
}

.newsletter__input{
  outline: none;
  border: none;
  background-color: var(--gray-color);
  padding: 0 1rem;
}

/*===== SPONSORS =====*/
.sponsors__container{
  grid-template-columns: repeat(2,1fr);
  row-gap: 2rem;
  padding: 1.5rem 0;
}

.sponsors__logo{
  display: flex;
  justify-content: center;
}

.sponsors__logo img{
  height: 100px;
  filter: opacity(70%);
}

.sponsors__logo img:hover{
  filter: none;
}

/*===== FOOTER =====*/
.footer{
  background-color: var(--dark-color);
  color: var(--white-color);
}

.footer__container{
  row-gap: 1.5rem;
  margin-bottom: var(--mb-4);
}

.footer__title{
  margin-bottom: var(--mb-1);
}

.footer__deal{
  margin-bottom: var(--mb-2);
}

.footer__store{
  width: 100px;
}

.footer__link, .footer__social{
  color: var(--dark-color-light);
}

.footer__link:hover{
  text-decoration: underline;
}

.footer__social{
  font-size: 1.3rem;
  margin-right: var(--mb-1);
}

.footer__copy{
  border-top: 1px solid var(--dark-color-light);
  padding-top: 3rem;
  text-align: center;
  color: var(--dark-color-light);
  font-size: var(--small-font-size);
}

/* ===== MEDIA QUERIES=====*/
@media screen and (min-width: 768px) {
  body{
    margin: 0;
  
  }
  .header__cart-list{
    width: 400px;
    right: 1px;
  }

  .header__cart-list::after{
right: 3px;
  }

  .section-all{
    margin-bottom: var(--mb-4);
  }

  .nav{
    height: calc(var(--header-height) + 1rem);
    justify-content: initial;
  }

  .menu{
    top: 35px;
    right: 0;
  }

  .nav__menu{
    margin-left: auto;
  }
  
  .nav__list{
    display: flex;
  }

  .nav__item{
    margin-left: var(--mb-4);
    margin-bottom: 0;
  }

  .nav__toggle{
    display: none;
  }

  .home__container{
    height: 100vh;
  }

  .home__data{
    padding: 0;
    height: max-content;
    align-self: center;
  }

  .home__title{
    line-height: .8;
    letter-spacing: 1.5rem;
  }

  .home__img{
    width: 370px;
  }

  .collection__container{
    grid-template-columns: repeat(2,1fr);
    grid-template-rows: 1fr;
  }

  .collection__box{
    padding: .5rem 3rem 0;
  }

  .collection__img{
    width: 230px;
  }

  .featured__container,
  .sponsors__container,
  .footer__container{
    grid-template-columns: repeat(4,1fr);
  }

  .offer__data{
    padding: 5rem 0;
  }

  .new__container{
    grid-template-columns: repeat(3,1fr);
  }

  .newsletter__form{
    width: 400px;
    margin: 0 auto;
  }

  .footer__container{
    padding: 2rem 0;
  }
}

@media screen and (min-width: 1024px) {
  .bd-grid{
    margin-left: auto;
    margin-right: auto;
  }

  .home__data{
    padding-left: 7rem;
  }

  .home__img{
    right: 15%;
  }
}

	
</style>
</head>
<body>
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="footer"/>

</body>
<script type="text/javascript">
/*===== MENU SHOW =====*/ 
const showMenu =(toggleId, navId) => {
    const toggle = document.getElementById(toggleId),
          nav =document.getElementById(navId)
          
    if(toggle && nav){
        toggle.addEventListener('click', ()=>{
            nav.classList.toggle('show')
        })
    }
}

showMenu('nav-toggle','nav-menu')

/*===== REMOVE MENU MOBILE =====*/
const navLink = document.querySelectorAll('.nav__link')

function linkAction(){
    //Active link
    navLink.forEach(n => n.classList.remove('active'))
    this.classList.add('active')
    //Remove menu mobile
    const navMenu = document.getElementById('nav-menu')
    navMenu.classList.remove('show')
}

navLink.forEach(n => n.addEventListener('click', linkAction))

/*===== next image silde product =====*/
const imgs = document.querySelectorAll('.img-select a');
    const imgBtns = [...imgs];
    let imgId = 1;

    imgBtns.forEach((imgItem) => {
        imgItem.addEventListener('click', (event) => {
            event.preventDefault();
            imgId = imgItem.dataset.id;
            slideImage();
        });
    });

    function slideImage(){
        const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;

        document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;
    }

    window.addEventListener('resize', slideImage);
</script>
</html>