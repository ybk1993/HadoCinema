<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- toastr js 라이브러리 -->
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript" src="http://lab.alexcican.com/set_cookies/cookie.js"></script>
</head>
<body>
<form action="" method="post" id="frm" name="frm">
 	<p><label>아이디 : <input type="text" id="userid" name="userid" maxlength="20" class="form-control">
		<button type="button" id="idCheckButton">중복 체크</button></label></p>
	<p><label>비밀번호 : <input type="password" name="userpw" id="userpw" maxlength="20"></label></p>
	<p><label>이름 : <input type="text" name="name" id="name"></label></p>
    <p><label>이메일 : <input type="text" name="email" id="email"></label></p>
    <p><label>휴대폰 번호 : <input type="text" name="phone" id="phone"></label>('-' 을 포함)</p>
    <p>우편번호 : <input type="text" name="zipcode"> <input type="button" value="우편번호 검색"></p>
    <p><label>주소 : <input type="text" name="address1"></label></p>
    <p><label>상세주소 : <input type="text" name="address2"></label></p>
</form>
<p><button type="button" id="regOk">가입하기</button></p>
<h1 id="txt"></h1>
<br><hr><br><br>


<div class="wrapper" style="">

	<div class="inner">
		
		<form action="" id="loginForm" method="post">
			<p class="register-title">
				<span>로그인</span>
			</p>
			<div class="form-wrapper form-wrapper-id">
				<div class="id-wrapper">
					<input id="id" name="id" type="text" placeholder="아이디"
						class="form-control"> <i class="zmdi zmdi-accounts"></i>
				</div>
			</div>

			<div class="form-wrapper">
				<input type="password" name="password" placeholder="비밀번호"
					id="password" class="form-control"> <i
					class="zmdi zmdi-lock"></i>
			</div>
			<br>
			<button type="button" class="loginButton">
				<span>로그인 하기</span> <i class="zmdi zmdi-arrow-right"></i>
			</button>
			
		</form>

	</div>
</div>


<script type="text/javascript">

const id = document.querySelector('#id');
const loginForm = document.querySelector('#loginForm');
const password = document.querySelector('#password');
const loginButton = document.querySelector('.loginButton');
const poster = document.querySelector('#poster');
const moveRegister = document.querySelector('.moveRegister');
const moveMain = document.querySelector('.moveMain');
// $( document ).ready()와 유사한 코드
document.addEventListener('DOMContentLoaded', () => {
	// 로그인 버튼 클릭시에 동작하는 함수
	
	loginButton.addEventListener('click', () => {
	    if (id.value.trim() === '') {
	    	toastr.error('아이디를 입력해 주십시오', '경고', {
	            timeOut: 3000,
	        });
	        id.focus();
	    } else if (password.value.trim() === '') {
	    	toastr.error('비밀번호를 입력해 주십시오', '경고', {
	            timeOut: 3000,
	        });
	        password.focus();
	    } else {
	        console.log('로그인버튼 클릭');
	        login();
	    }
	});



});


function login() {
	
    $.ajax({
        url: '/login/' + id,
        type: 'get',
        cache: false,
        data: { 'userid' : id },
        success: function(data) {
            console.log(data);
            idCheckMessage(data);
            document.getElementById('txt').innerHTML = data;
        },
    });
}

//////////////////////////////////////////////////////////////////////
/*
const idCheckButton = document.getElementById('idCheckButton');
const regOk = document.getElementById('regOk');
const id = document.getElementById('userid');
let idFlag = false;

document.addEventListener('DOMContentLoaded', () => {
	
    idCheckButton.addEventListener('click', function() {
        console.log(id.value);
        idCheck(); 
    });
    
    regOk.addEventListener('click', function() {
        console.log("가입 시도!");
        submit(); 
    });
    
});

function idCheck() {
	let chkId = document.getElementById('userid').value;
    $.ajax({
        url: '/member/' + chkId,
        type: 'get',
        cache: false,
        data: { id: document.getElementById('userid').value },
        success: function(data) {
            console.log(data);
            idCheckMessage(data);
            document.getElementById('txt').innerHTML = data;
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

function submit() {
    let formData = $('#frm').serialize(); // serialize 사용
    console.log(formData);
    
    $.ajax({
        url: "register",
        type: "POST",
        cache: false,
        
        data: formData,
       
        success: function(data){
            console.log(data);
        },
        error: function (request, status, error){        
            console.log(error);
        }
    });
    
} 
*/




</script>
</body>
</html>