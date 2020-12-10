<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<%@include file="../cdn.jsp" %>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/css/info.css" rel="stylesheet"/>

<title>소개</title>
</head>
<body>

<%@include file="../header.jsp" %>


    <div class="wrap">
        <div class="box1">
            <div class="imgbox">
            <figure>
                <img src="${pageContext.request.contextPath }/resources/image/${list[0].img }">
            </figure>
            </div>

            <div class="infobox">
               영화:${list[0].name } <br>
               영화감독 : ${list[0].director }<br> 
               배우 : ${list[0].actor }<br>
               개봉일 : ${list[0].date }<br>
               상영시간: ${list[0].time }
            </div> 

        </div>

        <div class="box2">
            <div class="infobox2">
               ${list[0].info }
            </div>
        </div>

    </div>
</body>

</html>