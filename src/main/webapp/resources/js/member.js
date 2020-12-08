'use strict';

function sendit(){
    // console.log('sendit 호출');
    // 객체 저장
    const userid = document.getElementById('userid');
    const userpw = document.getElementById('userpw');
    const userpw_re = document.getElementById('userpw_re');
    const username = document.getElementById('username');
    const hp = document.getElementById('phone');
    const email = document.getElementById('email');
    
    const isSsn = document.getElementById('isSsn');

    // 정규식
    const expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
    const expNameText = /[가-힣]+$/;
    const expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
    const expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;

    if(userid.value == ''){
        alert('아이디를 입력하세요.');
        userid.focus();
        return false;
    }
    if(userid.value.length < 4 || userid.value.length > 20){
        alert('아이디를 4자이상 20자 이하로 입력하세요.');
        userid.focus();
        return false;
    }
    if(userpw.value == ''){
        alert('비밀번호를 입력하세요.');
        userpw.focus();
        return false;
    }
    if(expPwText.test(userpw.value) == false){
        alert('비밀번호 형식을 확인하세요.');
        userpw.focus();
        return false;
    }
    if(userpw.value != userpw_re.value){
        alert('비밀번호와 비밀번호 확인의 값이 서로 다릅니다.');
        userpw.focus();
        return false;
    }
    if(expNameText.test(username.value) == false){
        alert('이름 형식을 확인하세요.');
        username.focus();
        return false;
    }
    if(expHpText.test(hp.value) == false){
        alert('휴대폰 번호 형식을 확인하세요.');
        hp.focus();
        return false;
    }
    if(expEmailText.test(email.value) == false){
        alert('이메일 형식을 확인하세요.');
        email.focus();
        return false;
    }
    

    return true // 페이지 이동
}

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                
                // document.getElementById("sample6_extraAddress").value = extraAddr;
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').focus();
            document.getElementById('sample6_postcode').value = data.zonecode;
            // document.getElementById('sample6_postcode').blur();

            document.getElementById("sample6_address").focus();
            document.getElementById("sample6_address").value = addr;
            // document.getElementById("sample6_address").blur();
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}


