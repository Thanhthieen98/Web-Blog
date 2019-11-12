<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Post Page</title>
	
	<!--Bootsrap 4 CDN-->
	<jsp:include page="/views/include/boostrap.jsp"></jsp:include>
	
</head>
<body>
	
	<jsp:include page="/views/include/adnav.jsp"></jsp:include>
	<!-- NavBar -->
	
	<div class="container-fluid">
		<h2 style="text-align: center;">LIST POST</h2>
		<a href="/webblog/admin/addpost" class="btn btn-info float-right" role="button">Creat post</a>
		<table class="table table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th style="width: 40%;">Description</th>
					<th style="width: 10%;">Image</th>
					<th style="width: 9%;">Date</th>
					<th style="width: 7%;">Category</th>
					<th>Author</th>
					<th>Delete</th>
					<th>Update</th>
				</tr>	
			</thead>
			<tbody>
			<c:forEach items="${news}" var="n">
				<tr>
					<td>${n.id}</td>
					<td>${n.name}</td>
					<td><textarea rows="5" cols="80" style="margin-top: 0px; margin-bottom: 0; height: 154px;">${n.description}</textarea></td>
					<td><img src="/webblog/download?image=${n.image}" width="100%"></td>
					<td>${n.date}</td>
					<td>${n.category.name}</td>
					<td>${n.user.fullname}</td>
					
					<td>
						<a href="/webblog/admin/delpost?id=${n.id}" class="btn btn-success"> Delete</a>
					</td>
					<td>
						<a href="/webblog/admin/uppost?id=${n.id}" class="btn btn-success"> Update</a>
					</td>
				</tr>
				</c:forEach>		
			</tbody>
		</table>
	</div>
</body>
</html>