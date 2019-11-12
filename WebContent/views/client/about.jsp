<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Blog Home </title>

  <!-- Bootstrap core CSS -->
 		<jsp:include page="/views/include/boostrap.jsp"></jsp:include>

  <!-- Custom styles for this template -->
	<link href="/webblog/css/about.css" rel="stylesheet" />
  <!-- fontawesome -->		

</head>

<body style="padding-top: 90px;">

  <!-- Navigation -->
  	<jsp:include page="/views/include/navbar.jsp"></jsp:include>

  <!-- Page Content -->
<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin">Who Am I?</h3>
  <img src="/webblog/download?image=${user.image}" class="img-responsive img-circle margin" style="display:inline" width="400" height="300">
  <h3>Tôi là tác giả</h3>
</div>

<!-- Second Container -->
<div class="container-fluid bg-2 text-center">
  <h3 class="margin">What Am I?</h3>
  <p>${user.infomation}</p>
  <a href="/webblog/client/contact" class="btn btn-info"> Contact</a>
</div>

  <!-- Footer -->
	<jsp:include page="/views/include/footer.jsp"></jsp:include>


</body>

</html>
