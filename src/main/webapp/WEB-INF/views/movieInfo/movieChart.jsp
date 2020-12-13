<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<jsp:include page="../cdn.jsp"></jsp:include>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
   
    <title>영화 목록</title>

    <!-- css -->	
	<link href="${pageContext.request.contextPath }/resources/css/reset08.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath }/resources/css/style08.css" rel="stylesheet"/>
	<!-- CSS -->
 	<link href="${pageContext.request.contextPath }/resources/css/header1.css" rel="stylesheet">
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">
    
    
</head>
<body>
    <jsp:include page="../memberModals.jsp"></jsp:include>
	<jsp:include page="../header.jsp"></jsp:include>
    <section id="movie">
        <h2 class="ir_so">최신 영화 정보</h2>
        <div class="container">
            <div class="row">
                <div class="movie">
                
                
                    <div class="movie_title">
                        <ul>
                            
                            <li class="active"><a href="#">최신개봉작</a></li>
                            <li><a href="#">상영예정작</a></li>
                            
                        </ul>
                    </div> <!-- class = movie_title -->
                    
                    
                    <div class="movie_chart">
                        
                        <c:choose>
							<c:when test="${empty list || fn:length(list) == 0 }">
							</c:when>
				
							<c:otherwise>
							<div class = "chart_cont2">
								<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
									
										<div>
											<div class="poster">
			                                    <figure>
			                                       <img src="${pageContext.request.contextPath }/resources/image/${dto.img}"alt="">
			                                    </figure>
			                                    <div class="rank"><strong>${dto.uid }</strong></div>
			                                    
			                                </div>
			                                <div class="infor">
			                                    <h3><span class="icon all ir_pm">전체관람가</span><strong>${dto.name }</strong></h3>
			                                    <div class="infor_btn">
			                                        <a href="info?uid=${dto.uid }">상세정보</a>
			                                        <a href="#">예매하기</a>
			                                    </div>
			                                </div>
										</div>
									
								</c:forEach>
								</div>
								<div class = "chart_cont3">
								<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
									
										<div>
											<div class="poster">
			                                    <figure>
			                                       <img src="${pageContext.request.contextPath }/resources/image/${dto.img}"alt="">
			                                    </figure>
			                                    <div class="rank"><strong>${dto.uid }</strong></div>
			                                    
			                                </div>
			                                <div class="infor">
			                                    <h3><span class="icon all ir_pm">전체관람가</span><strong>${dto.name }</strong></h3>
			                                    <div class="infor_btn">
			                                        <a href="#">상세정보</a>
			                                        <a href="#">예매하기</a>
			                                    </div>
			                                </div>
										</div>
									
								</c:forEach>
								</div>
							</c:otherwise>
						</c:choose> 
						  
						     <!--  
                        <div class="chart_cont2">
                            <div>
                                <div class="poster">
                                    <figure>
                                       
                                    </figure>
                                    <div class="rank"><strong>1</strong></div>
                                    
                                </div>
                                <div class="infor">
                                    <h3><span class="icon all ir_pm">전체관람가</span> <strong>침묵1</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                       
                                    </figure>
                                    <div class="rank"><strong>2</strong></div>
                                    
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a19 ir_pm">19세 이상 관람</span> <strong>신세계</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                       
                                    </figure>
                                    <div class="rank"><strong>3</strong></div>
                                    
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세 이상 관람</span> <strong>마스터</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        
                                    </figure>
                                    <div class="rank"><strong>4</strong></div>
                                    
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a15 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            
                        </div><!-- class = chart_cont2 -->
							














                        <!--  
                        <div class="chart_cont3">
                            <div>
                                <div class="poster">
                                    <figure>
                                       
                                    </figure>
                                    <div class="rank"><strong>1</strong></div>
                                    
                                </div>
                                <div class="infor">
                                    <h3><span class="icon all ir_pm">전체관람가</span> <strong>침묵</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        
                                    </figure>
                                    <div class="rank"><strong>2</strong></div>
                                    
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">19세 이상 관람</span> <strong>신세계</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                        
                                    </figure>
                                    <div class="rank"><strong>3</strong></div>
                                   
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a12 ir_pm">12세 이상 관람</span> <strong>마스터</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="poster">
                                    <figure>
                                       
                                    </figure>
                                    <div class="rank"><strong>4</strong></div>
                                    
                                </div>
                                <div class="infor">
                                    <h3><span class="icon a19 ir_pm">15세 이상 관람</span> <strong>마약왕</strong></h3>
                                    <div class="infor_btn">
                                        <a href="#">상세정보</a>
                                        <a href="#">예매하기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- //chart_cont3
                        -->
                       
                    </div><!-- class = movie chart -->
                </div><!-- class = movie -->
                
                
            </div>
        </div>
    </section>  
    <!-- //movie -->
    
   
    <script>
        //영화차트 탭 메뉴
        var movBtn = $('.movie_title > ul > li');    
        var movCont = $('.movie_chart > div');  

        movCont.hide().eq(0).show();

        movBtn.click(function(e){
            e.preventDefault();
            var target = $(this);         
            var index = target.index();  
            movBtn.removeClass("active");   
            target.addClass("active");    
            movCont.css("display","none");
            movCont.eq(index).css("display","block");
        });
    </script>
     <script src="${pageContext.request.contextPath }/resources/js/register.js"></script>
</body>

</html>