<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 주소찾기 api -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Google Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
  <!-- JQuery -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js">
  </script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>



  <!-- CSS -->
  <link href="${pageContext.request.contextPath }/CSS/main.css" rel="stylesheet">

  <title>해도시네마 메인</title>
</head>

<body>

  <!--Modal: Login / Register Form-->
  <div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
    aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
      <!--Content-->
      <div class="modal-content">
        <!--Modal cascading tabs-->
        <div class="modal-c-tabs">

          <!-- Nav tabs -->
          <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
            <li class="nav-item">
              <a class="nav-link active" data-toggle="tab" href="#panel7" role="tab"><i class="fas fa-user mr-1"></i>
                LOGIN</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#panel5" role="tab"><i class="fas fa-user mr-1"></i>
                ID찾기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#panel6" role="tab"><i class="fas fa-user mr-1"></i>
                PW찾기</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#panel8" role="tab"><i class="fas fa-user-plus mr-1"></i>
                JOIN</a>
            </li>
          </ul>

          <!-- Tab panels -->
          <div class="tab-content">
            <!--Panel 7-->
            <div class="tab-pane fade in show active" id="panel7" role="tabpanel">

              <!--Body-->
              <div class="modal-body mb-1">
                <div class="md-form form-sm mb-5">
                  <i class="fas fa-user prefix"></i>
                  <input type="email" id="modalLRInput10" class="form-control form-control-sm validate">
                  <label data-error="wrong" data-success="right" for="modalLRInput10">아이디</label>
                </div>

                <div class="md-form form-sm mb-4">
                  <i class="fas fa-lock prefix"></i>
                  <input type="password" id="modalLRInput11" class="form-control form-control-sm validate">
                  <label data-error="wrong" data-success="right" for="modalLRInput11">비밀번호</label>
                </div>
                <div class="text-center mt-2">
                  <button class="btn btn-info">로그인 <i class="fas fa-sign-in ml-1"></i></button>
                </div>
              </div>
              <!--Footer-->
              <div class="modal-footer">

                <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">닫기</button>
              </div>

            </div>
            <!--/.Panel 7-->

            <!--Panel 6-->
            <div class="tab-pane fade in show" id="panel6" role="tabpanel">

              <!--Body-->
              <div class="modal-body mb-1">
                <div class="md-form form-sm mb-5">
                  <i class="fas fa-user prefix"></i>
                  <input type="email" id="modalLRInput10" class="form-control form-control-sm validate">
                  <label data-error="wrong" data-success="right" for="modalLRInput10">아이디</label>
                </div>

                <div class="md-form form-sm mb-5">
                  <i class="fas fa-envelope prefix"></i>
                  <input type="email" id="email" class="form-control form-control-sm validate">
                  <label data-error="wrong" data-success="right" for="email">이메일</label>
                </div>
                <div class="text-center mt-2">
                  <button class="btn btn-info">임시비밀번호 발송 <i class="fas fa-sign-in ml-1"></i></button>
                </div>
              </div>
              <!--Footer-->
              <div class="modal-footer">
                <div class="options text-center text-md-right mt-1">

                </div>
                <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">닫기</button>
              </div>

            </div>
            <!--/.Panel 6-->

            <!--Panel 5-->
            <div class="tab-pane fade in show" id="panel5" role="tabpanel">

              <!--Body-->
              <div class="modal-body mb-1">
                <div class="md-form form-sm mb-5">
                  <i class="fas fa-user prefix"></i>
                  <input type="email" id="modalLRInput10" class="form-control form-control-sm validate">
                  <label data-error="wrong" data-success="right" for="modalLRInput10">이름</label>
                </div>

                <div class="md-form form-sm mb-5">
                  <i class="fas fa-envelope prefix"></i>
                  <input type="email" id="email" class="form-control form-control-sm validate">
                  <label data-error="wrong" data-success="right" for="email">이메일</label>
                </div>

              </div>
              <!--Footer-->
              <div class="modal-footer">
                <div class="options text-center text-md-right mt-1">
                  <small class="d-flex justify-content-start">아이디 찾기 결과</small>
                  <p class="d-flex justify-content-start">apple123</p>
                </div>
                <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">닫기</button>
              </div>

            </div>
            <!--/.Panel 5-->

            <!--Panel 8-->
            <div class="tab-pane fade" id="panel8" role="tabpanel">

              <!--Body-->
              <div class="modal-body">

                <form name="regform" id="regform" method="post" action="" onsubmit="return sendit()">
                  <div class="md-form form-sm mb-5">
                    <i class="fas fa-user prefix"></i>
                    <input type="text" id="userid" class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="userid">아이디</label>
                  </div>

                  <div class="md-form form-sm mb-5">
                    <i class="fas fa-lock prefix"></i>
                    <input type="password" id="userpw" class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="userpw">비밀번호</label>
                  </div>

                  <div class="md-form form-sm mb-4">
                    <i class="fas fa-lock prefix"></i>
                    <input type="password" id="userpw_re" class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="userpw_re">비밀번호 확인</label>
                  </div>

                  <div class="md-form form-sm mb-4">
                    <i class="fas fa-signature prefix"></i>
                    <input type="text" id="username" class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="username">이름</label>
                  </div>

                  <div class="md-form form-sm mb-4">
                    <i class="fas fa-mobile prefix"></i>
                    <input type="text" id="hp" class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="hp">휴대폰 번호</label>
                  </div>

                  <div class="md-form form-sm mb-5">
                    <i class="fas fa-envelope prefix"></i>
                    <input type="email" id="email" class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="email">이메일</label>
                  </div>

                  <div class="md-form form-sm mb-4">
                    <div class="row">
                      <div class="col-md-8">
                        <i class="fas fa-home prefix"></i>
                        <input type="text" name="zipcode" id="sample6_postcode"
                          class="form-control form-control-sm validate">
                        <label id="postlabel" data-error="wrong" data-success="right"
                          for="sample6_postcode">우편번호</label>
                      </div>
                      <div class="col-md-3">
                        <input type="button" class="btn btn-outline-info btn-sm waves-effect ml-auto" value="검색"
                          onclick="sample6_execDaumPostcode()"></button>
                      </div>
                    </div>
                  </div>

                  <div class="md-form form-sm mb-4">
                    <i class="fas fa-home prefix"></i>
                    <input type="text" name="address1" id="sample6_address"
                      class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="sample6_address">주소</label>
                  </div>

                  <div class="md-form form-sm mb-4">
                    <i class="fas fa-home prefix"></i>
                    <input type="text" name="address3" id="sample6_detailAddress"
                      class="form-control form-control-sm validate">
                    <label data-error="wrong" data-success="right" for="sample6_detailAddress">상세주소</label>
                  </div>

                  <div class="text-center form-sm mt-2">
                    <input type="submit" class="btn btn-info" value="가입완료"> <i class="fas fa-sign-in ml-1"></i></button>
                  </div>
                </form>
              </div>
              <!--Footer-->
              <div class="modal-footer">

                <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">닫기</button>
              </div>
            </div>

            <!--/.Panel 8-->
          </div>

        </div>
      </div>
      <!--/.Content-->
    </div>
  </div>
  <!--Modal: Login / Register Form-->

  <div class="container-fluid">

    <div class="row">
      <div class="col-md-2 empty"></div>
      <div class="col-md-8 text-center" id="nav-logo">
        <a href="?logo-black"><img src="${pageContext.request.contextPath }/image/logo-black.png" alt="logo" id="logo"></a>
      </div>

      <div class="col-md-2 align-self-end text-center">
        <a href="" id="login" data-toggle="modal" data-target="#modalLRForm">로그인/회원가입</a>
      </div>
    </div>
    <ul class="row">
      <li class="col-md-4 empty"></li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">예매</a>
        <ul class="justify-content-center dropdown-menu sub">
          <li><a class="grey-text submenu">예매하기</a></li>
          <li><a class="grey-text submenu">상영시간표</a></li>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">영화</a>
        <ul class="justify-content-center dropdown-menu sub">
          <li><a class="grey-text submenu">홈</a></li>
          <li><a class="grey-text submenu">현재상영작</a></li>
          <li><a class="grey-text submenu">상영예정작</a></li>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">영화관</a>
        <ul class="justify-content-center dropdown-menu sub">
          <li><a class="grey-text submenu">건대입구</a></li>
          <li><a class="grey-text submenu">역삼</a></li>
          <li><a class="grey-text submenu">제주도</a></li>
          <li><a class="grey-text submenu">여의도</a></li>
        </ul>
      </li>
      <li class="col-md-1 dropdown hdmenu menu">
        <a href="">고객센터</a>
        <ul class="justify-content-center dropdown-menu sub">
          <li><a class="grey-text submenu">1:1문의</a></li>
          <li><a class="grey-text submenu">FAQ문의</a></li>
        </ul>
      </li>
    </ul>


  </div>
  <script src="${pageContext.request.contextPath }/JS/member.js"></script>
</body>

</html>