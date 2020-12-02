<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
  <a class="navbar-brand" href="${pageContext.request.contextPath }/admin/main">해도시네마</a>
  <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle"><i
      class="fas fa-bars"></i></button>
  <!-- Navbar Search-->
  <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
    <div class="input-group">
      <input class="form-control" type="text" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2" />
      <div class="input-group-append">
        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
      </div>
    </div>
  </form>
  <!-- Navbar-->
  <ul class="navbar-nav ml-auto ml-md-0">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
        aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
        <a class="dropdown-item" href="#">Settings</a>
        <a class="dropdown-item" href="#">Activity Log</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="${pageContext.request.contextPath }/admin/login">관리자 로그아웃</a>
      </div>
    </li>
  </ul>
</nav>
<div id="layoutSidenav"> <!-- 이 태그 안에 관리 페이지 작성 - 해당 관리 페이지 가장 하단에 </div>로 닫아줘야함 -->
  <div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
      <div class="sb-sidenav-menu">
        <div class="nav">
          <div class="sb-sidenav-menu-heading">HOME</div>
          <a class="nav-link" href="${pageContext.request.contextPath }/admin/main">
            <span class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></span>
            대시보드
          </a>
          <div class="sb-sidenav-menu-heading">관리</div>
          
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
            aria-expanded="false" aria-controls="collapsePages">
            <span class="sb-nav-link-icon"><i class="fas fa-book-open"></i></span>
            Pages
            <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
          </a>
          <div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth"
                aria-expanded="false" aria-controls="pagesCollapseAuth">
                Authentication
                <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
              </a>
              <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                data-parent="#sidenavAccordionPages">
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${pageContext.request.contextPath }/admin/login">관리자 로그인</a>
                  <a class="nav-link" href="${pageContext.request.contextPath }/admin/register">관리자 등록</a>
                  <a class="nav-link" href="${pageContext.request.contextPath }/admin/forgotpw">비밀번호 찾기</a>
                </nav>
              </div>
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError"
                aria-expanded="false" aria-controls="pagesCollapseError">
                Error
                <span class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></span>
              </a>
              <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                data-parent="#sidenavAccordionPages">
                <nav class="sb-sidenav-menu-nested nav">
                  <a class="nav-link" href="${pageContext.request.contextPath }/admin/err401">401 Page</a>
                  <a class="nav-link" href="${pageContext.request.contextPath }/admin/err404">404 Page</a>
                  <a class="nav-link" href="${pageContext.request.contextPath }/admin/err500">500 Page</a>
                </nav>
              </div>
            </nav>
          </div>
          <div class="sb-sidenav-menu-heading">Addons</div>
          <a class="nav-link" href="${pageContext.request.contextPath }/admin/charts">
            <span class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></span>
            차트
          </a>
          <a class="nav-link" href="${pageContext.request.contextPath }/admin/tables">
            <span class="sb-nav-link-icon"><i class="fas fa-table"></i></span>
            테이블
          </a>
        </div>
      </div>
      <div class="sb-sidenav-footer">
        <div class="small">Logged in as:</div>
        Start Bootstrap
      </div>
    </nav>
  </div>

 

