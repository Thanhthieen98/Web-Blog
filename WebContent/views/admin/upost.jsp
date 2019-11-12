<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form CreatPost</title>

<!--Bootsrap 4 CDN-->
	<jsp:include page="/views/include/boostrap.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="/views/include/adnav.jsp"></jsp:include>
	<!-- NavBar -->

	<div class="container">
		<form action="/webblog/admin/uppost" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label><b>ID:</b></label><input name="id" class="form-control" value="${n.id}" readonly="readonly">
			</div>
			<div class="form-group">
				<label><b>NAME:</b></label><input name="name" type="text" class="form-control" value="${n.name}" />
			</div>
			<div class="form-group">
				<label><b>DESCRIPTION:</b></label><textarea name="description" rows="10" class="form-control" />${n.description}</textarea>
			</div>
			<div class="form-group">
				<label><b>IMAGE File:</b></label><input name="image" type="file" accept="image/*" value="${n.image}" class="form-control" />
												 <img src="/webblog/download?image=${n.image}" class="img-thumbnail" width="200px" height="200px" >
			</div>
			<div class="form-group">
				<label><b>DATE:</b></label><input name="date" type="text" class="form-control" value="${n.date}" required>
			</div>
			<div class="form-group">
				<label><b>CATEGORY:</b></label><select name="categoryid" class="form-control">
					<c:forEach items="${categories}" var="c">
						<option value="${c.id}">${c.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label><b>AUTHOR:</b></label><input type="hidden" name="userid" class="form-control" value="${user.id}" readonly="readonly">
											<input type="text" class="form-control" value="${user.fullname}" readonly="readonly">
			</div>
			<button type="submit" class="btn btn-success float-right">UPDATE POST</button>
		</form>
	</div>
</body>
</html>