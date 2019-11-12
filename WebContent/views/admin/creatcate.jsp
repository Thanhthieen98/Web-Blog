<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Form CreatCategory</title>

<!--Bootsrap 4 CDN-->
<jsp:include page="/views/include/boostrap.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/views/include/adnav.jsp"></jsp:include>
	<!-- NavBar -->

	<div class="container">
	
		<p class="text-danger" style="text-align: center;">${msg}</p>
			
		<form action="/webblog/admin/addcate" method="post" >
			<div class="form-group">
				<label><b>NAME CATEGORY :</b></label><input name="name" type="text" class="form-control" required>
			</div>
			<button type="submit" class="btn btn-success float-right">Creat Category</button>
		</form>
	</div>
</body>
</html>