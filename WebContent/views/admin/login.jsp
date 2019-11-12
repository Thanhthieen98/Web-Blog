<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Login Page</title>
	
	<!--Bootsrap 4 CDN-->
	<jsp:include page="/views/include/boostrap.jsp"></jsp:include>
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" >

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="/webblog/css/form.css">
</head>
<body >
<div class="container">
   <h2>Login Form</h2>

<p class=" alert-danger alert-dismissible fade show" style="text-align: center;">${msg}</p>
<div  style="border: 1px soild white">
<form action="/webblog/login-admin" method="post">
  
    <label for="username"><b>Tài khoản</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="password"><b>Mật khẩu</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>
        
    <button type="submit">Đăng nhập</button>
    <label>
      <input type="checkbox" name="remember"> Remember me
    </label>

  <div class="container">
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
</div>
</div>
</body>
</html>