<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/member/memberJoin.css" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>

<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
		<div class="subject">
		<div class="logo_area">
			<a href="/main"><img src="resources/img/mLogo.png"></a>
		</div>
		<div class="subject_name">
			<a href="memberJoin"><span>회원가입</span></a>
		</div>
	</div>
		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box"><input class="id_input" type="text" name="memberId"></div>
			<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">사용할 수 없는 아이디입니다.</span>
			<span class="final_id_ck">아이디를 입력해주세요.</span>
		</div>
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div> 
			<div class="pw_input_box"><input class="pw_input" type="password" name="memberPw"></div>
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
		</div>
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호 확인</div> 
			<div class="pwck_input_box"><input class="pwck_input" type="password" name="pwck"></div>
			<span class="final_pwck_ck">비밀번호를 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
			<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		</div>
		<div class="name_wrap">
			<div class="name_name">이름</div>
			<div class="name_input_box"><input class="name_input" type="text" name="memberName"></div>
			<span class="final_name_ck">이름을 입력해주세요.</span>
		</div>
		<div class="phone_wrap">
			<div class="phone_name">전화번호</div>
			<div class="phone_input_box">
			<select class="phone1_input" name="memberPhone1">
   				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
			<input class="phone2_input" type="tel" maxlength="4" name="memberPhone2">
			-<input class="phone3_input" type="tel" maxlength="4" name="memberPhone3">
			</div>
			<span class="final_phone_ck">번호를 입력해주세요.</span>
		</div>
		<span></span>
		<div class="mail_wrap">
			<div class="mail_name">이메일</div>
			<div class="mail_input_box">
				<input class="mail_input" type="email" name="memberMail">
				
			</div>
			<span class="final_mail_ck">이메일을 입력해주세요.</span>
		</div>
		
		<div class="addr_wrap_1">
			<div class="addr_name">주소</div>
			<div class="addr_input_box_1">
				<input class="addr_input_1" type="text" name="memberAddr1" readonly="readonly">
			</div>
		
		<!-- 다음 지도 버튼 -->	
		<div class="addr_button" onclick="execution_daum_address()">
			<span>주소 찾기</span>
		</div>
		<div class="clearfix"></div>
		
		<div class="addr_wrap_2">	
			<div class="addr_name"></div>
			<div class="addr_input_2_wrap">
				<div class="addr_input_box_2">
					<input class="addr_input_2" type="text" name="memberAddr2" readonly="readonly">
				</div>
			</div>
		</div>
		
		<div class="addr_wrap_3">
			<div class="addr_name">상세주소</div>
			<div class="addr_input_box_3">
				<input class="addr_input_3" type="text" name="memberAddr3" readonly="readonly">
			</div>
			<span class="final_addr_ck">주소를 입력해주세요.</span>
		</div>
		</div>
		<div class="join_button_wrap">
			<span><input class="join_button" type="button" value="회원가입"></span>
		</div>
	</div>
	</form>
</div>

<script>
/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;            // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인
var nameCheck = false;            // 이름
var phoneCheck = false;
var mailCheck = false;            // 이메일
var addressCheck = false         // 주소

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(){
		
		/* 입력값 변수 */
        var id = $('.id_input').val();                 // id 입력란
        var pw = $('.pw_input').val();                // 비밀번호 입력란
        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
        var name = $('.name_input').val();			// 이름 입력란
        var phone2 = $('.phone2_input').val();
        var phone3 = $('.phone3_input').val();
        var mail = $('.mail_input').val();            // 이메일 입력란
        var addr = $('.addr_input_3').val();        // 주소 입력란
        
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
        
        /* 비밀번호 확인 유효성 검사 */
        if(pwck == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false;
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 전화번호 유효성 검사 */
        if(phone2 == "" || phone3 == ""){
            $('.final_phone_ck').css('display','block');
            phoneCheck = false;
        }else{
            $('.final_phone_ck').css('display', 'none');
            phoneCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        /* 주소 유효성 검사 */
        if(addr == ""){
            $('.final_addr_ck').css('display','block');
            addressCheck = false;
        }else{
            $('.final_addr_ck').css('display', 'none');
            addressCheck = true;
        }
        
        /* 최종 유효성 검사 */
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&phoneCheck&&mailCheck&&addressCheck ){
			$("#join_form").attr("action", "memberJoin");
			$("#join_form").submit();
        }    
        return false;
		
	});
});

//아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){

	//console.log("keyup 테스트");	
	var memberId = $('.id_input').val();			// .id_input에 입력되는 값
	var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
	
	$.ajax({
		type : "post",
		url : "memberIdChk",
		data : data,
		success : function(result){
			 //console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;

			}
			
		}// success 종료
	}); // ajax 종료

});// function 종료



/* 비밀번호 확인 일치 유효성 검사 */
 
$('.pwck_input').on("propertychange change keyup paste input", function(){
    //console.log("pw keyup");
	var pw = $('.pw_input').val();
    var pwck = $('.pwck_input').val();
    $('.final_pwck_ck').css('display', 'none');
    
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
    
    
}); 



/* 다음 주소 연동 */
function execution_daum_address(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
           
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
             	// 주소변수 문자열과 참고항목 문자열 합치기
                addr += extraAddr;
            
            } else {
            	addr += ' ';
            }

            //$(".address_input_1").val(data.zonecode);
            $("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            //$(".address_input_2").val(addr);
            $("[name=memberAddr2]").val(addr);            // 대체가능
            
        	// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".addr_input_3").attr("readonly",false);
            $(".addr_input_3").focus();
 
        }
    }).open();    
}

</script>

</body>
</html>