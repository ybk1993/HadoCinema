<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <jsp:include page="../cdn.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/resources/css/main_top.css" rel="stylesheet">

</head>
<body>
<form>

</form>
<c:if test="${login ne 'admin' }">
	<c:choose>
		<c:when test="${empty login}">
			<jsp:include page="../memberModals.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
			<jsp:include page="../mypageModals.jsp"></jsp:include>
		</c:otherwise>
	</c:choose>
</c:if>
<jsp:include page="../review/writeReview.jsp"></jsp:include>

  <!--Carousel Wrapper-->
  <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="gradienttop w-100 h-25">
	 <jsp:include page="../header.jsp"></jsp:include>
    </div>
    <div class="gradientdown w-100 h-15"></div>
    <!--Indicators-->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-1z" data-slide-to="1"></li>
      <li data-target="#carousel-example-1z" data-slide-to="2"></li>
      <li data-target="#carousel-example-1z" data-slide-to="3"></li>
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
      <!--First slide-->
      <div class="carousel-item ci active">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/nicegirl01.jpg" alt="First slide">
      </div>
      <!--/First slide-->
      <!--Second slide-->
      <div class="carousel-item ci">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/run01.jpg" alt="Second slide">
      </div>
      <!--/Second slide-->
      <!--Third slide-->
      <div class="carousel-item ci">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/thefrom01.jpg" alt="Third slide">
      </div>
      <!--/Third slide-->
      <!--4 slide-->
      <div class="carousel-item ci">
        <img class="d-block w-115 ml-10" src="${pageContext.request.contextPath }/resources/image/top/joje01.jpg" alt="Fourth slide">
      </div>
      <!--/4 slide-->
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
  
<!-- middle contents -->
  <div class="container-fluid showlist">

    <!-- Grid row -->
    <div class="row">

      

      <!-- Grid column -->
      <div class="col-lg-2 col-md-12 mb-4 text-center">

        <!--Modal: Name-->
        <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">

            <!--Content-->
            <div class="modal-content">

              <!--Body-->
              <div class="modal-body mb-0 p-0">
                <!-- https://youtu.be/Dh7lKxrOiCY -->
                <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
                  <iframe width="741" height="417" src="https://www.youtube.com/embed/Dh7lKxrOiCY" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
                </div>
              </div>
            </div>
            <!--/.Content-->

          </div>
        </div>
        <!--Modal: Name-->

        <a><img class="img-fluid z-depth-1 trailer" src="${pageContext.request.contextPath }/resources/image/monsterhunter01.jpg" alt="video" data-toggle="modal"
            data-target="#modal1"></a>
        <div class="card-footer bg-white text-muted small text-sm-center"><small>몬스터헌터<br>예매율 5.1%
            &nbsp;&VerticalSeparator;&nbsp; &bigstar;7.5</small></div>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-lg-2 col-md-12 mb-4 text-center">

        <!--Modal: Name-->
        <div class="modal fade" id="modal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">

            <!--Content-->
            <div class="modal-content">

              <!--Body-->
              <div class="modal-body mb-0 p-0">

                <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
                  <iframe width="741" height="417" src="https://www.youtube.com/embed/IM__IumELSk" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
                </div>

              </div>

            </div>
            <!--/.Content-->

          </div>
        </div>
        <!--Modal: Name-->

        <a><img class="img-fluid z-depth-1 trailer" src="${pageContext.request.contextPath }/resources/image/corona01.jpg" alt="video" data-toggle="modal"
            data-target="#modal6"></a>
        <div class="card-footer bg-white text-muted small text-sm-center"><small>몬스터헌터<br>예매율 5.1%
            &nbsp;&VerticalSeparator;&nbsp; &bigstar;7.5</small></div>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-lg-2 col-md-12 mb-4 text-center">

        <!--Modal: Name-->
        <div class="modal fade" id="modal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
          aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">

            <!--Content-->
            <div class="modal-content">

              <!--Body-->
              <div class="modal-body mb-0 p-0">

                <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
                  <iframe width="741" height="417" src="https://www.youtube.com/embed/Vg8VH4BH6uo" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowfullscreen></iframe>
                </div>

              </div>

            </div>
            <!--/.Content-->

          </div>
        </div>
        <!--Modal: Name-->

        <a><img class="img-fluid z-depth-1 trailer" src="${pageContext.request.contextPath }/resources/image/toeic01.jpg" alt="video" data-toggle="modal"
            data-target="#modal4"></a>
        <div class="card-footer bg-white text-muted small text-sm-center"><small>몬스터헌터<br>예매율 5.1%
            &nbsp;&VerticalSeparator;&nbsp; &bigstar;7.5</small></div>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->
  </div>  
<!-- middle contents -->

<c:if test="${login ne 'admin' }">
	<c:choose>
		<c:when test="${empty login}">
			<script src="${pageContext.request.contextPath }/resources/js/register.js"></script>
		</c:when>
		<c:otherwise>
			<script src="${pageContext.request.contextPath }/resources/js/mypage.js"></script>
		</c:otherwise>
	</c:choose>
</c:if>

<script src="${pageContext.request.contextPath }/resources/js/trailer.js"></script>
</body>
</html>