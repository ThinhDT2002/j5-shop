<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Quên mật khẩu</title>
<style type="text/css">
 @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

        html,
        body {
            background: linear-gradient(45deg,#003cff,#00e1ff);
            font-family: 'Poppins', sans-serif;
            width: 100%;
            min-height: 100vh;
            
        }

        ::selection {
            color: #fff;
            background: #6665ee;
        }

        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .container .form {
            background: #fff;
            padding: 30px 35px;
            border-radius: 5px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        .container .form form .form-control {
            height: 40px;
            font-size: 15px;
        }

        .container .form form .forget-pass {
            margin: -15px 0 15px 0;
        }

        .container .form form .forget-pass a {
            font-size: 15px;
        }

        .container .form form .button {
            background: linear-gradient(-60deg, #4481eb 0%, #04befe 100%);
            color: #fff;
            font-size: 17px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .container .form form .button:hover {
            background: rgb(58, 150, 215);
        }

        .container .form form .link {
            padding: 5px 0;
        }

        .container .form form .link a {
            color: #6665ee;
        }

        .container .login-form form p {
            font-size: 14px;
        }

        .container .row .alert {
            font-size: 14px;
        }
    </style>
</head>
<body>

	<div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4 form">
                <form action="/account/retrieve-password" method="post">
                    <h2 class="text-center">Forgot Password</h2>
                    <p class="text-center">${message}</p>
                    <div class="form-group">
                        <input class="form-control" type="text" name="username" placeholder="Nhập tài khoản của bạn" required
                            >
                    </div>
                    <div class="form-group">
                        <input class="form-control button" type="submit" name="check-email" value="Lấy lại mật khẩu">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>