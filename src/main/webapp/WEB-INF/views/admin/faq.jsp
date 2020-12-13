<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>FAQ관리 - Admin base</title>
    <link href="${pageContext.request.contextPath }/resources/css/admin.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>

<body class="sb-nav-fixed"> <!-- 상단에 nav 고정시키기 위해 클래스 부여 -->
    <jsp:include page="./admin_header.jsp"></jsp:include> <!-- nav 가져오기 -->
     <div id="layoutSidenav_content"> <!--  이 태그로 관리할 페이지 감쌈 -->
            <main> <!-- 작성할 관리페이지 구분하기 위한 main 태그 -->
                <div class="container-fluid">
                    <h1 class="mt-4">base</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath }/admin/main">Dashboard</a></li>
                        <li class="breadcrumb-item active">base</li>
                    </ol>
                    
                    <div class="card mb-4">
                        <div class="card-body">
                            관리 페이지 내용 간략소개
                        </div>
                    </div>
                    
                    <div class="card mb-4">	<!-- 컨텐츠 내용 표기할 카드 -->
                        <div class="card-header"> <!-- 헤더 -->
                            <i class="fas fa-chart-area mr-1"></i> <!-- 아이콘 -->
                            OO관리
                        </div>
                        <div class="card-body">내용이당</div> <!-- 내용 -->
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> <!-- 푸터 -->
                    </div>
                    
                    <div class="row"> <!--2개 컨텐츠용 -->
                        <div class="col-lg-6"> <!-- << row 내부의 col-xx의 숫자의 합이 12되게 조정 -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar mr-1"></i>
                                    좌측 컨텐츠
                                </div>
                                <div class="card-body">좌측 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    우측 컨텐츠
                                </div>
                                <div class="card-body">우측 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                    </div> <!-- row -->
                    
                    <div class="row"> <!--2개 컨텐츠용 -->
                        <div class="col-lg-3"> <!-- << row 내부의 col-xx의 숫자의 합이 최대 12되게 조정 -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar mr-1"></i>
                                    좌측 컨텐츠
                                </div>
                                <div class="card-body">좌측 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-7 offset-lg-1"> <!-- offset-lg-1 : 왼쪽에서부터 지정해준 숫자만큼 칸을 띄워줌 -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    우측 컨텐츠
                                </div>
                                <div class="card-body">우측 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                    </div> <!-- row -->
                    
                    <div class="row"> <!--1개 컨텐츠 -->
                        <div class="col-lg-3 offset-lg-4"> <!-- offset-lg-1 : 왼쪽에서부터 지정해준 숫자만큼 칸을 띄워줌 -->
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    중앙 컨텐츠
                                </div>
                                <div class="card-body">내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                    </div> <!-- row -->
                    
                    <div class="row"> <!-- 3개 컨텐츠용 -->
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar mr-1"></i>
                                    1번 컨텐츠
                                </div>
                                <div class="card-body">1번 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    2번 컨텐츠
                                </div>
                                <div class="card-body">2번 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    3번 컨텐츠
                                </div>
                                <div class="card-body">3번 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                    </div> <!-- row -->
                    
                    <div class="row"> <!-- 4개 컨텐츠용 -->
                        <div class="col-lg-3">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar mr-1"></i>
                                    1번 컨텐츠
                                </div>
                                <div class="card-body">1번 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    2번 컨텐츠
                                </div>
                                <div class="card-body">2번 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    3번 컨텐츠
                                </div>
                                <div class="card-body">3번 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie mr-1"></i>
                                    4번 컨텐츠
                                </div>
                                <div class="card-body">4번 내용</div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        
                    </div> <!-- row -->
                    
                </div> <!-- container-fluid -->
            </main> <!-- 여기까지 관리페이지 내용 -->
            
            <jsp:include page="./admin_footer.jsp"></jsp:include> <!-- nav 가져오기 -->
        </div> <!-- layoutSidenav_content -->
    </div> <!-- admin_nav.jsp에서 닫지 않은 div 태그닫음 <div id="layoutSidenav"> -->
    
    <script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/demo/chart-pie-demo.js"></script>
</body>

</html>