<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>

    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<title>수정-${list[0].subject }</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var subject = frm["subject"].value.trim();

    if (subject == "") {
        alert("제목은 반드시 작성해야 합니다");
        frm["subject"].focus();
        return false;
    }
    return true;
} // end chkSubmit()
</script>

<body>
<h2>수정</h2>
<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="uid" value="${list[0].uid }"/>

<div class="wrap">
제목:
<input type="text" name="subject" value="${list[0].subject }"/><br>
답변:<br>
<textarea name="answer">${list[0].answer }</textarea>
<br><br>
</div>
<input type="submit" value="수정"/>
</form>
<button class="btn btn-primary" onclick="history.back();">이전으로</button>
<button class="btn btn-primary" onclick="location.href='list.do'">목록보기</button>
<br>
</body>
</html>

	</c:otherwise>
</c:choose>
