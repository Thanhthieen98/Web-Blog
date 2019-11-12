 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
   <div class="col-md-4">

        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">Tìm kiếm</h5>
          <form action="/webblog/client/search" method="get">
          <div class="card-body">
            <div class="input-group">
              <input type="text" name="keyword" class="form-control" placeholder="Search for...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="submit">Go!</button>
              </span>
            </div>
          </div>
          </form>
        </div>

        <!-- Categories Widget -->
        <div class="card my-4">
          <h5 class="card-header">Danh mục</h5>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-6">
                <ul class="list-unstyled mb-0">
                <c:forEach items="${categories}" var="c">
                  <li>
                    <a href="/webblog/client/category?id=${c.id}">${c.name}</a>
                  </li>
 				</c:forEach>
                </ul>
              </div>
              <div class="col-lg-6">

              </div>
            </div>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">Bài viết được yêu thích</h5>
          <div class="card-body">
           <c:forEach items="${votes}" begin="0" end="3" var="v">
            <div class="trend-entry d-flex">
              <div style="padding-right:17px; " class="number align-self-start">&#10146;</div>
              <div class="trend-contents">
                <h6><a href="/webblog/client/post?id=${v.id}">${v.post.name}</a></h6>
                <div class="post-meta">
                  <span style="font-size: smaller;float: right;" class="d-block">${v.vote} &#11088;&#11088;&#11088;&#11088;&#11088;</span>
                </div>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>

      </div>