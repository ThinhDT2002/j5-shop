<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết hoá đơn</title>
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