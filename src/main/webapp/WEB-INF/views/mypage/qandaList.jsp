<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<jsp:include page="../cdn.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/resources/css/main_top.css" rel="stylesheet">

	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<jsp:include page="../header.jsp"></jsp:include>
	 	<link href="${pageContext.request.contextPath }/resources/css/qanda.css" rel="stylesheet">
	 
	 	<title>게시판</title>
	 	<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
	</head>
	
	<body>
		<div class="container">
			<header>
				<br><br>
				<h4> 1:1문의 내역</h4>
			</header>
			<hr />	
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>답변상태</th><th>등록일</th></tr>
						</thead>
						 <%-- request.getAttribute("list") --%>

						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.cs_uid}" /></td>	
								<td>
								
									<a href="/mypage/qandaView?cs_uid=${list.cs_uid}">
									<c:out value="${list.cs_subject}" /></a>
								</td>											
											
								<td><c:out value="${list.cs_memid}" /></td>
								<c:choose>
									<c:when test="${list.cs_status eq '0'}">
										<td><c:out value="답변중" /></td>
									</c:when>
									<c:when test="${list.cs_status eq '1'}">
										<td><c:out value="답변완료" /></td>									
									</c:when>
								</c:choose>
								<td><fmt:formatDate value="${list.cs_regdate}" pattern="yyyy-MM-dd"/></td>				
							</tr>
						</c:forEach>
						
					</table>

				</form>
			</section>
		</div>
	</body>
</html>
