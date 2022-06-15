<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h5>${message}</h5>
	<form action="/account/submit-retrieve-password" method="post">
		<input type="text" name="verifyCode" placeholder="Mã xác nhận">
		<input type="password" name="password" placeholder="Mật khẩu mới">
		<input type="password" name="confirm-password" placeholder="Xác nhận mật khẩu">
		<button type="submit">Lấy lại mật khẩu</button>
	</form>
	<a href="/account/login">Đăng nhập</a>
</body>
</html>