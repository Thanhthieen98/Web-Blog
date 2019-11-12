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
  <link href="css/blog-home.css" rel="stylesheet">

</head>

<body style="padding-top: 90px;">

  <!-- Navigation -->
  	<jsp:include page="/views/include/navbar.jsp"></jsp:include>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
		<hr>
      <!-- Blog Entries Column -->
      <div class="col-md-8">
		<c:forEach items="${news}" var="n">
        <!-- Blog Post -->
        <div class="card mb-4" style="max-width: 540px;">
  			<div class="row no-gutters">
  			  <div class="col-md-4">
    			  <img src="/webblog/download?image=${n.image}" class="card-img" alt="Card image cap">
   			 </div>
   			 <div class="col-md-8">
     			 <div class="card-body">
       				 <h5 class="card-title">${n.name}</h5>
       				 	<a href="/webblog/client/post?id=${n.id}" >Read More &rarr;</a>
     			 </div>
     			 <div class="card-footer text-muted">
            Posted on ${n.date} in ${n.category.name} By
            <a href="#">${n.user.fullname}</a>
          </div>
   			 </div>
  		</div>
		</div>
		</c:forEach>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
           			<li class="page-item"><a class="page-link" href="/webblog/client/home?offset=0">1</a></li>
					<li class="page-item"><a class="page-link" href="/webblog/client/home?offset=1">2</a></li>
					<li class="page-item"><a class="page-link" href="/webblog/client/home?offset=2">3</a></li>
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
