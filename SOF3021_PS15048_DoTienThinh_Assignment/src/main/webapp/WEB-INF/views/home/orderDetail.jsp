<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết hoá đơn</title>
<style type="text/css">
	:root {
            /*   color variables */
            --clr-primary: #81d4fa;
            --clr-primary-light: #e1f5fe;
            --clr-primary-dark: #4fc3f7;
            --clr-gray100: #f9fbff;
            --clr-gray150: #f4f6fb;
            --clr-gray200: #eef1f6;
            --clr-gray300: #e1e5ee;
            --clr-gray400: #767b91;
            --clr-gray500: #4f546c;
            --clr-gray600: #2a324b;
            --clr-gray700: #161d34;
            --clr-pending: #fff0c2;
            --clr-pending-font: #a68b00;
            --clr-unpaid: #ffcdd2;
            --clr-unpaid-font: #c62828;
            --clr-paid: #c8e6c9;
            --clr-paid-font: #388e3c;
            --clr-link: #2962ff;

            /*   border radius */
            --radius: 0.2rem;

        }

        table {
            border-collapse: collapse;
            box-shadow: 0 5px 10px var(--clr-gray300);
            background-color: white;
            text-align: left;
            overflow: hidden;
            margin-left: 7%;
        }
           
            thead{
                box-shadow: 0 5px 10px var(--clr-gray300);
            }
            th {
                padding: 1rem 2rem;
                text-transform: uppercase;
                letter-spacing: 0.1rem;
                font-size: 0.7rem;
                font-weight: 900;
                text-align: center;
            }

            td {
                padding: 1rem 2rem;
                text-align: center;
            }

           

            .status {
                border-radius: var(--radius);
               
                padding: 0.2rem 1rem;
                text-align: center;
            }
           

            .amount {
                text-align: right;
            }

            /* Color alternating rows */
            tr:nth-child(even) {
                background-color: var(--clr-gray150);
            }

 img{
 max-width: 27%;
 margin-left: -9%;
 width: 400px;
 }
 h5{
 	margin-left: 5%;
 	font-size: 1rem;
 }
</style>
</head>
<body>
	<h1 style="margin-top: 100px;">Chi tiết hoá đơn</h1>
	<table>
		<tr>
			<th>Tên sản phẩm</th>
			<th>Ảnh sản phẩm</th>
			<th>Số lượng</th>
			<th>Đơn giá</th>
			<th>Tổng tiền</th>
		</tr>
		<c:forEach var="orderDetail" items="${ordersDetails}">
			<tr>
				<td>${orderDetail.product.name}</td>
				<td>
					<img src="../../images/product/${orderDetail.product.image1}" alt="${orderDetail.product.image1}"/>
				</td>
				<td>${orderDetail.quantity}</td>
				<td>
					<fmt:formatNumber value="${orderDetail.product.price}" type="currency" currencySymbol="VND"/>
				</td>
				<td>
					<fmt:formatNumber value="${orderDetail.product.price * orderDetail.quantity}" type="currency" currencySymbol="VND"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<h5>Tổng cộng:
		<fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="VND"/>
	</h5>
</body>
</html>