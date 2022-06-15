<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="row d-flex justify-content-center">
			<div class="col-md-10 mt-5 pt-5">
				<div class="row z-depth-3">
					<div class="col-sm-4 bg-info rounded-left">
						<div class="card-block text-center text-white">
							<span><img src="assets/img/logo1-old.png" alt="" style="margin-top: 100px;"></span>
						</div>
						<button>Lưu thông tin</button>
					</div>
					<div class="col-sm-8 bg-white rounded-right">
						<h3 class="mt-3 text-center">Information</h3>
						<hr class="bg-primary mt-0 w-25">
						<div class="row">
							<div class="col-sm-6">
								<p class="font-weight-bold">Username:</p>
								<input type="text"></input>
							</div>
							<div class="col-sm-6">
								<p class="font-weight-bold">Password:</p>
								<input type="password"></input>
							</div>
						</div>
						<hr class="bg-primary">
						<div class="row">
							<div class="col-sm-6">
								<p class="font-weight-bold">Fullname:</p>
								<input type="text"></input>
							</div>
							<div class="col-sm-6">
								<p class="font-weight-bold">Phonenumber:</p>
								<input type="text"></input>
							</div>
						</div>
						<hr class="bg-primary">
						<div class="row">
							<div class="col-sm-6">
								<p class="font-weight-bold">Email:</p>
								<input type="email"></input>
							</div>
							<div class="col-sm-6">
								<p class="font-weight-bold">Photo:</p>
								<input type="text"></input>
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
	</div>
</body>
</html>