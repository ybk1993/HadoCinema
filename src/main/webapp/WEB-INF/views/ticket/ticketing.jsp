<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath }/CSS/ticketing.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/JS/ticketing.js"></script>
</head>
<body>
<div class="container">
    <div class="row1">
        <div class="col-sm-offset-2 col-sm-2">영화</div>
        <div class="col-sm-2">극장</div>
        <div class="col-sm-1">날짜</div>
        <div class="col-sm-3">시간</div>
    </div>
    <div class="row2">
        <div name="cinema" class="col-sm-offset-2 col-sm-2"></div>
        <div class="col-sm-2"></div>
        <div class="col-sm-1"></div>
        <div class="col-sm-3"></div>
    </div>
    <div class="row3">
        <div class="col-sm-offset-2 col-sm-2">영화 선택</div>
        <div class="col-sm-2">극장 선택</div>
        <div class="col-sm-2">좌석 선택</div>
        <div class="col-sm-offset-0 col-sm-1">결제</div>
        <div class="col-sm-offset-0 col-sm-1"><button>좌석 선택</div>
    </div>
</div>
</body>
</html>