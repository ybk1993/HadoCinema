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
       		 <span id="logID" style="margin-right: 1vw;">${login }님 환영합니다.</span>
       		 <a style="margin-right: 1vw;" id="login" data-toggle="modal" data-target="#modalLRForm">로그아웃</a>
       		 <a id="login" data-toggle="modal" data-target="#modalLRForm">마이페이지</a>
	       </c:otherwise>
       </c:choose>
      </div>

    </div>
    <ul class="row">
      <li class="col-md-4 empty"></li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">예매</a>
        <ul class="justify-content-center dropdown-menu sub sb1">
          <li><a class="grey-text submenu">예매하기</a></li>
          <li><a class="grey-text submenu">상영시간표</a></li>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">영화</a>
        <ul class="justify-content-center dropdown-menu sub sb2">
          <li><a class="grey-text submenu">목록</a></li>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">영화관</a>
        <ul class="justify-content-center dropdown-menu sub sb3">
          <li><a class="grey-text submenu">건대입구</a></li>
          <li><a class="grey-text submenu">역삼</a></li>
          <li><a class="grey-text submenu">제주도</a></li>
          <li><a class="grey-text submenu">여의도</a></li>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">고객센터</a>
        <ul class="justify-content-center dropdown-menu sub sb4">
          <li><a class="grey-text submenu">FAQ문의</a></li>
        </ul>
      </li>
    </ul>


  </div>