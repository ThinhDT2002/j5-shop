<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử mua hàng</title>
</head>
<body>
	<h1 style="margin-top: 100px;">Lịch sử mua hàng</h1>
	<h1>Khách hàng: ${user.fullname}</h1>
	<table>
		<tr>
			<th>Mã hoá đơn</th>
			<th>Ngày mua hàng</th>
			<th>Địa chỉ giao hàng</th>
			<th>Số điện thoại liên lạc</th>
			<th>Ghi chú</th>
			<th>Trạng thái</th>
			<th>Tổng tiền</th>
			<th></th>
		</tr>
		<c:forEach var="order" items="${orders.content}">
			<tr>
				<td>${order.id}</td>
				<td>${order.createDate}</td>
				<td>${order.address}</td>
				<td>${order.phonenumber}</td>
				<td>${order.note}</td>
				<c:if test="${order.status == 1 }">
					<td>Chờ xác nhận</td>
				</c:if>
				<c:if test="${order.status == 2 }">
					<td>Đang giao hàng</td>
				</c:if>
				<c:if test="${order.status == 3}">
					<td>Đã giao hàng</td>
				</c:if>
				<td>
					<fmt:formatNumber value="${order.price}" type="currency" currencySymbol="VND"/>
				</td>
				<td>
					<a href="/home/order/detail?orderId=${order.id}">Chi tiết</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="/home/order?page=0">First</a>
	<c:if test="${orders.number == 0 }">
		<a href="">Previous</a>
	</c:if>
	<c:if test="${orders.number != 0 }">
	 	<a href="/home/order?page=${orders.number - 1}">Previous</a>
	</c:if>
	<c:if test="${orders.number >= (orders.totalPages - 1)}">
		<a href="">Next</a>
	</c:if>
		<c:if test="${orders.number < (orders.totalPages - 1)}">
		<a href="/home/order?page=${orders.number + 1}">Next</a>
	</c:if>
	<a href="/home/order?page=${orders.totalPages - 1}">Last</a>
	<h5>Page: ${orders.number+1}/${orders.totalPages}</h5>
</body>
</html>