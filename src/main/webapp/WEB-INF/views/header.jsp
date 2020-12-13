<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <link href="${pageContext.request.contextPath }/CSS/header.css" rel="stylesheet"> -->
  <div class="container-fluid">

    <div class="row">
      <div class="col-md-2 empty"></div>
      <div class="col-md-8 text-center" id="nav-logo">
      <%
      String uri = (String)request.getAttribute( "javax.servlet.forward.request_uri" ); 

      if(uri.equals("/main")){ %>
		<a href="?logo-white"><img src="${pageContext.request.contextPath }/resources/image/logo-white.png" alt="logo" id="logo"></a>
      <%}else{ %>
        <a href="?logo-black"><img src="${pageContext.request.contextPath }/resources/image/logo-black.png" alt="logo" id="logo"></a>
      <%} %>
      </div>

       <div class="align-self-end text-right" id="divlogin">
       <c:choose>
	       <c:when test="${empty login }">
       		 <a id="login" data-toggle="modal" data-target="#modalLRForm">로그인/회원가입</a>
	       </c:when>
	       <c:otherwise>
	       		 <c:choose>
	      			 <c:when test="${login eq 'admin'}">
       		 			<span id="logID" style="margin-right: 1vw;">관리자모드</span>
	      			 </c:when>
	      		 	<c:otherwise>
	      		 		<span id="logID" style="margin-right: 1vw;">${login }님 환영합니다.</span>
      		 		</c:otherwise>
      		 	</c:choose>
       		 <a href="logout" class="logout" id="login" style="margin-right: 1vw;">로그아웃</a>
       		<a id="login" data-toggle="modal" data-target="#mypageMForm">마이페이지</a>
	       </c:otherwise>
       </c:choose>
      </div>

    </div>
    <ul class="row">
      <li class="col-md-4 empty"></li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">리뷰</a>
        <ul class="justify-content-center dropdown-menu sub sb1">
          <li><a class="grey-text submenu">리뷰 크롤링</a></li>
          <c:if test="${not empty login and login eq 'admin' }">
          	<li><a class="grey-text submenu">리뷰 쓰기</a></li>
          </c:if>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="movieInfo/movieChart">영화</a>
        <ul class="justify-content-center dropdown-menu sub sb2">
          <li><a href="movieInfo/movieChart" class="grey-text submenu">목록</a></li>
          <c:if test="${not empty login and login eq 'admin' }">
	          <li><a href="movieInfo/movieSave" class="grey-text submenu">영화등록</a></li>
          </c:if>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">고객센터</a>
        <ul class="justify-content-center dropdown-menu sub sb4">
          <li><a href="faq/faq" class="grey-text submenu">FAQ문의</a></li>
          <c:if test="${not empty login and login eq 'admin' }">
	          <li><a href="faq/list" class="grey-text submenu">FAQ등록</a></li>          
          </c:if>
        </ul>
      </li>
    </ul>


  </div>