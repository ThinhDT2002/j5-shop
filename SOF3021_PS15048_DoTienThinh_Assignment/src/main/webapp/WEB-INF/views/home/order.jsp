<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử mua hàng</title>
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





.btn-changepage {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 50%;
	margin-left: 25%;
	margin-top: 3%;
}
h5{
margin-left: 5%;
font-size: 0.9rem
}
</style>
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
				<td><fmt:formatNumber value="${order.price}" type="currency"
						currencySymbol="VND" /></td>
				<td><a href="/home/order/detail?orderId=${order.id}">Chi
						tiết</a></td>
			</tr>
		</c:forEach>
	</table>
	<div class="btn-changepage">
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
	</div>

	<h5>Page: ${orders.number+1}/${orders.totalPages}</h5>
</body>
</html>