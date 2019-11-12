<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>List Category</title>
	
	<!--Bootsrap 4 CDN-->
	<jsp:include page="/views/include/boostrap.jsp"></jsp:include>
</head>
<body>
	
	<jsp:include page="/views/include/adnav.jsp"></jsp:include>
	<!-- NavBar -->
	
	<div class="container">
		<h2>LIST CATEGORY</h2>
		<a href="/webblog/admin/addcate" class="btn btn-info" role="button">Creat Category</a>
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Delete</th>
					<th>Update</th>
				</tr>	
			</thead>
			<tbody>
			<c:forEach items="${categories}" var="c">
				<tr>
					<td>${c.id}</td>
					<td>${c.name}</td>
					
					<td>
						<a href="/webblog/admin/delcate?id=${c.id}" class="btn btn-success"> Delete</a>
					</td>
					<td>
						<a href="/webblog/admin/upcate?id=${c.id}" class="btn btn-success"> Update</a>
					</td>
				</tr>
			</c:forEach>			
			</tbody>
		</table>
	</div>
</body>
</html>