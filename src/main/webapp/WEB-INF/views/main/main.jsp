<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <jsp:include page="../cdn.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/CSS/main_top.css" rel="stylesheet">

</head>
<body>
 <jsp:include page="../memberModals.jsp"></jsp:include>
  <!--Carousel Wrapper-->
  <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="gradienttop w-100 h-25">
	 <jsp:include page="../header.jsp"></jsp:include>
    </div>
    <div class="gradientdown w-100 h-25"></div>
    <!--Indicators-->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-1z" data-slide-to="1"></li>
      <li data-target="#carousel-example-1z" data-slide-to="2"></li>
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
      <!--First slide-->
      <div class="carousel-item ci active">
        <img class="d-block w-100" src="${pageContext.request.contextPath }/image/top/nicegirl01.jpg" alt="First slide">
      </div>
      <!--/First slide-->
      <!--Second slide-->
      <div class="carousel-item ci">
        <img class="d-block w-100" src="${pageContext.request.contextPath }/image/top/run01.jpg" alt="Second slide">
      </div>
      <!--/Second slide-->
      <!--Third slide-->
      <div class="carousel-item ci">
        <img class="d-block w-100" src="${pageContext.request.contextPath }/image/top/thefrom01.jpg" alt="Third slide">
      </div>
      <!--/Third slide-->
    </div>
    <!--/.Slides-->
    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->
  </div>
  <!--/.Carousel Wrapper-->
</body>
</html>