<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form CreatCategory</title>

<!--Bootsrap 4 CDN-->
	<jsp:include page="/views/include/boostrap.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/views/include/adnav.jsp"></jsp:include>
	<!-- NavBar -->

	<div class="container">
		<form action="/webblog/admin/addcate" method="post" >
			<div class="form-group">
				<label><b>NAME CATEGORY :</b></label><input name="name" type="text" class="form-control" value="${cate.name}" required>
			</div>
			<button type="submit" class="btn btn-success float-right">Creat Category</button>
		</form>
	</div>
</body>
</html>