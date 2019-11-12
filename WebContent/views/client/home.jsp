<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Blog Home</title>

<!-- Bootstrap core CSS -->
<jsp:include page="/views/include/boostrap.jsp"></jsp:include>
<!-- Custom styles for this template -->
<link href="/webblog/css/blog-home.css" rel="stylesheet" />
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="/views/include/navbar.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
					<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleCaptions" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
							<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
						</ol>		
							<div class="carousel-inner">
							<c:forEach items="${news2}" var="n" begin="0" end="2" varStatus="status">
						  		<c:choose>
							<c:when test="${status.index == 0}">
									<div class="carousel-item active">
										<img src="/webblog/download?image=${n.image}"  height="500px" class=" d-block w-100"
											alt="Second">
										<div class="carousel-caption d-none d-md-block">
											<h5>${n.name}</h5>
										</div>
									</div>
							</c:when>
							<c:otherwise>
									<div class="carousel-item ">
										<img src="/webblog/download?image=${n.image}" height="500px" class="d-block w-100 "
											alt="Second">
										<div class="carousel-caption d-none d-md-block">
											<h5>${n.name}</h5>
										</div>
									</div>
							</c:otherwise>	
						  </c:choose>		
						</c:forEach>
						</div>
						<!--  		<div class="carousel-item ">
						<img src="http://placehold.it/900x350" class="d-block w-100"
							alt="Second">
						<div class="carousel-caption d-none d-md-block">
							<h5>Second slide label</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
						</div>
					</div>
					<div class="carousel-item ">
						<img src="http://placehold.it/900x350" class="d-block w-100"
							alt="Third">
						<div class="carousel-caption d-none d-md-block">
							<h5>Third slide label</h5>
							<p>Praesent commodo cursus magna, vel scelerisque nisl
								consectetur.</p>
						</div>
					</div>  -->

					</div>
					<a class="carousel-control-prev" href="#carouselExampleCaptions"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
			</div>
		</div>
		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h3 class="my-4">Bài viết mới đăng</h3>
				<hr>

				<!-- Blog Post -->
				<c:forEach items="${news1}" var="n" >
				
				<div class="card mb-4">
					<img class="card-img-top" src="/webblog/download?image=${n.image}" width="500px" height="300px" alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title">${n.name}</h2>
						<c:set var="d" value="${fn:substring(n.description,0,180)}"></c:set>
						<p class="card-text"> ${d} [....] </p>
						<a href="/webblog/client/post?id=${n.id}" class="btn btn-primary">Read More &rarr;</a>
					</div>
					<div class="card-footer text-muted">
						Posted on ${n.date} in ${n.category.name} by <a href="/webblog/client/about">${n.user.fullname}</a>
					</div>
				</div>
				</c:forEach>

				<!-- Blog Post 
				<div class="card mb-4">
					<img class="card-img-top" src="http://placehold.it/750x300"
						alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
							quis soluta, a laboriosam. Dicta expedita corporis animi vero
							voluptate voluptatibus possimus, veniam magni quis!</p>
						<a href="#" class="btn btn-primary">Read More &rarr;</a>
					</div>
					<div class="card-footer text-muted">
						Posted on January 1, 2017 by <a href="#">Start Bootstrap</a>
					</div>
				</div>

				<div class="card mb-4">
					<img class="card-img-top" src="http://placehold.it/750x300"
						alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title">Post Title</h2>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex
							quis soluta, a laboriosam. Dicta expedita corporis animi vero
							voluptate voluptatibus possimus, veniam magni quis!</p>
						<a href="#" class="btn btn-primary">Read More &rarr;</a>
					</div>
					<div class="card-footer text-muted">
						Posted on January 1, 2017 by <a href="#">Start Bootstrap</a>
					</div>
				</div>  -->

				<!-- Pagination -->
				<ul class="pagination justify-content-center mb-4">
					<li class="page-item"><a class="page-link" href="/webblog/client/home?offset=0">1</a></li>
					<li class="page-item"><a class="page-link" href="/webblog/client/home?offset=3">2</a></li>
					<li class="page-item"><a class="page-link" href="/webblog/client/home?offset=6">3</a></li>
				</ul>

			</div>

			<!-- Sidebar Widgets Column -->
			<jsp:include page="/views/include/category.jsp"></jsp:include>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="/views/include/footer.jsp"></jsp:include>
	


</body>

</html>

