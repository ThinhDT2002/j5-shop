<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Card</title>
<!-- Font Awesome -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	
	<!-- Bootstrap core CSS -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
<style>
		button{
			margin-left: 90px; 
			border-radius: 10px; 
			background-color: blue;
			color: aliceblue;
		}
		button:hover{
			background-color: cyan;
			color: black;
		}
	</style>
</head>
<body class="bg-light">
	<div class="container">
	<form:form action="/account/profilecard" modelAttribute="account" enctype="multipart/form-data">
		<div class="row d-flex justify-content-center">
			<div class="col-md-10 mt-5 pt-5">
				<div class="row z-depth-3">
					<div class="col-sm-4 bg-info rounded-left">
						<div class="card-block text-center text-white">
							<span><img src="../images/account/${user.photo}" alt="${user.photo}" style="margin-top: 100px;"></span>
						</div>
						<button type="submit">Lưu thông tin</button>
					</div>
					
					<div class="col-sm-8 bg-white rounded-right">
						<h3 class="mt-3 text-center">Information</h3>
						<hr class="bg-primary mt-0 w-25">
						<div class="row">
							<div class="col-sm-6">
								<p class="font-weight-bold">Username:</p>
								<form:input type="text" path="username" disabled="true"/>
							</div>
							<div class="col-sm-6">
								<p class="font-weight-bold">Password:</p>
								<form:input type="password" path="password" disabled="true"/>
							</div>
						</div>
						<hr class="bg-primary">
						<div class="row">
							<div class="col-sm-6">
								<p class="font-weight-bold">Fullname:</p>
								<form:input type="text" path="fullname"/>
							</div>
							<div class="col-sm-6">
								<p class="font-weight-bold">Phonenumber:</p>
								<form:input type="text" path="phonenumber"/>
							</div>
						</div>
						<hr class="bg-primary">
						<div class="row">
							<div class="col-sm-6">
								<p class="font-weight-bold">Email:</p>
								<form:input type="email" path="email"/>
							</div>
							<div class="col-sm-6">
								<p class="font-weight-bold">Photo:</p>
								<input type="file" name="avatar"></input>
							</div>
						</div>
						<hr class="bg-primary">
						<ul class="list-unstyled d-flex justify-content-center mt-4">
							<li><a href="#!"><i class="fab fa-facebook-f px-3 h4 text-info"></i></a></li>
							<li><a href="#!"><i class="fab fa-youtube px-3 h4 text-info"></i></a></li>
							<li><a href="#!"><i class="fab fa-twitter px-3 h4 text-info"></i></a></li>
						</ul>
					</div>
					
				</div>
			</div>
		</div>
			</form:form>
	</div>

</body>
</html>