<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- toastr js 라이브러리 -->
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>
<h1>
	hdcinema
	test
</h1>

<P>  The time on the server is ${serverTime}. </P>
<P>  ${getMemberList } </P>
<table border="1">
<tr>
	<th>uid</th>
	<th>id</th>
	<th>pw</th>
	<th>email</th>
	<th>phone</th>
	<th>우편번호</th>
	<th>주소</th>
	<th>상세주소</th>
	<th>가입일</th>
	<th>예매내역</th>
	<th>포인트</th>
</tr>
<c:forEach var="dto" items="${members }" end="${fn:length(members)}"> 
<tr>
<td><h4>${dto.uid }</h4></td>
<td><h4>${dto.userid }</h4></td>
<td><h4>${dto.userpw }</h4></td>
<td><h4>${dto.email }</h4></td>
<td><h4>${dto.phone }</h4></td>
<td><h4>${dto.zipcode }</h4></td>
<td><h4>${dto.address1 }</h4></td>
<td><h4>${dto.address2 }</h4></td>
<td><h4>${dto.signupdate }</h4></td>
<td><h4>${dto.booking }</h4></td>
<td><h4>${dto.point }P</h4></td>
</tr>
</c:forEach>
</table>

<form action="/idCheck" id="loginForm" method="post">
	<input id="id" name="id" type="text" placeholder="아이디"
							class="form-control">
	<button type="button" class="idCheckButton">아이디 체크</button>
</form>
<script type="text/javascript">
const idCheckButton = document.querySelector('.idCheckButton');
const id = document.querySelector('#id');
let idFlag = false;

document.addEventListener('DOMContentLoaded', () => {
    idCheckButton.addEventListener('click', function() {
        console.log(document.querySelector('#id').value);
        idCheck();
    });
    add();
});

function idCheck() {
    $.ajax({
        url: '/home',
        type: 'get',
        data: { id: document.querySelector('#id').value },
        success: function(data) {
            console.log(data);
            idCheckMessage(data);
        },
    });
}

function idCheckMessage(data) {
    toastr.options = {
        positionClass: 'toast-top-full-width',
        progressBar: true,
        timeOut: 1000,
    };
    if (id.value.length < 3) {
        toastr.error('최소 4글자 이상의 아이디를 입력해 주세요', '아이디 확인', {
            timeOut: 3000,
        });
        return;
    }

    if (data === 'false') {
        toastr.success('사용할수 있는 아이디입니다', '아이디 확인', {
            timeOut: 3000,
        });
        return idFlag = true;
        //registerButton.removeAttribute('disabled');
    } else {
        toastr.error('이미 존재하는 아이디입니다', '아이디 확인', {
            timeOut: 3000,
        });
        return idFlag = false;
        //registerButton.setAttribute('disabled', 'true');
    }
}

</script>
</body>
</html>
