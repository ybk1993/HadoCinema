<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 작성</title>
</head>

<script>
// form validation 
// '작성자(name)' 와 '제목(subject)' 는 필수
function chkSubmit(){
	frm = document.forms['frm'];
	
	var name = frm["name"].value.trim();
	var subject = frm["subject"].value.trim();
	
	if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다.");
		frm["name"].focus();
		return false;
	}
	
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	return true;	
		
}


</script>

<body>


<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">

제목:
<input type="text" name="subject"/><br>
답변:<br>
<textarea name="answer"></textarea>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='list.do'">목록으로</button>
</body>





</html>