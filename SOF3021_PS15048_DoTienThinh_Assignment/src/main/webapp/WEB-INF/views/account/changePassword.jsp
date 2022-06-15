<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đổi mật khẩu</title>
</head>
<body>
	<h5 style="margin-top: 100px;">Đổi mật khẩu</h5>
	<h6>${changePasswordMessage}</h6>
	<form action="/account/changePassword" method="post">
		<input type="password" name="oldPassword"/>
		<input type="password" name="newPassword"/>
		<input type="password" name="confirmPassword"/>
		<button type="submit">Đổi mật khẩu</button>
	</form>
</body>
</html>