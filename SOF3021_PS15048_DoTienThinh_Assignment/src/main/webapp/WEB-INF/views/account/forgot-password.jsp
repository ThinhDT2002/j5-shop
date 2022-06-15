<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
</head>
<body>
	<h6>${message}</h6>
	<form action="/account/retrieve-password" method="post">
		<input type="text" name="username" placeholder="Tài khoản của bạn">
		<button type="submit">Lấy lại mật khẩu</button>
	</form>
</body>
</html>