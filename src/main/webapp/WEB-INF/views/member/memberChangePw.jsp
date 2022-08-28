<%@page import="com.spring.bread.model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
if (session.getAttribute("member") == null) {
	response.sendRedirect("main");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/memberChangePw.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>
</head>
<body>
	<div class="wrapper">
		<form method="post" class="memberChangePwForm" id="memberChangePwForm" name="memberChangePwForm">
			<div class="wrap">
			
				<div class="top_gnb_area">
					<ul class="list">
						<c:if test="${member != null}">
							<li><a href="/">Main</a></li>
							<li><a id="gnb_logout_button">로그아웃</a></li>
							<li><a href="memberMyPage">마이룸</a></li>
							<li><a href="cartlist/${member.memberId}">장바구니</a></li>
						</c:if>
					</ul>
				</div>
				
				<div class="subject">
					<div class="logo_area">
						<a href="/main"><img src="resources/img/mLogo.png"></a>
					</div>
					<div class="subject_name">
						<a href="memberChangePw"><span>비밀번호 수정</span></a>
					</div>
				</div>
			
				<div class="password_wrap">
					<div class="password_name">현재 비밀번호</div>
					<div class="pwssword_input_box">
						<input type="text" class="password_input" name="memberPw">
					</div>
					<span class="final_cPw_ck">비밀번호를 입력해주세요.</span>
				</div>
				
				<div class="newPassword_wrap">
					<div class="newPassword_name">새 비밀번호</div>
					<div class="newPassword_input_box">
						<input type="text" class="newPassword_input" name="memberNewPw">
					</div>
					<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				
				<div class="checkPassword_wrap">
					<div class="checkPassword_name">비밀번호 다시 입력</div>
					<div class="checkPassword_input_box">
						<input type="text" class="checkPassword_input" name="checkPassword">
					</div>
					<span class="final_pwck_ck">비밀번호를 입력해주세요.</span>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
					<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
				
				<input type="hidden" name="memberId" value="${member.memberId }">
				
				<div class="button_wrap">
					<span><input type="button" class="changePw_button" value="비밀번호 변경"></span>
				</div>
				
			</div>
		</form>
	</div>
	
<script>
var cPwCheck = false;
var pwCheck = false;            // 비번
var pwckCheck = false;            // 비번 확인
var pwckcorCheck = false;        // 비번 확인 일치 확인

$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".changePw_button").click(function(){
		
		/* 입력값 변수 */
		var cPw = $('.password_input').val();                // 예전 비밀번호 입력란 
        var pw = $('.newPassword_input').val();                // 바꿀 비밀번호 입력란
        var pwck = $('.checkPassword_input').val();            // 비밀번호 확인 입력란
        
        /* 비밀번호 유효성 검사 */
        if(cPw == ""){
            $('.final_cPw_ck').css('display','block');
            cPwCheck = false;
        }else{
            $('.final_cPw_ck').css('display', 'none');
            cPwCheck = true;
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
        
        /* 최종 유효성 검사 */
        if(pwCheck&&pwckCheck&&pwckcorCheck&&cPwCheck ){
			$("#memberChangePwForm").attr("action", "memberChangePw");
			$("#memberChangePwForm").submit();
        }    
//        return false;
		
	});
});

/* 비밀번호 확인 일치 유효성 검사 */
$('.checkPassword_input').on("propertychange change keyup paste input", function(){
    //console.log("pw keyup");
	var pw = $('.newPassword_input').val();
    var pwck = $('.checkPassword_input').val();
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



/* gnb_area 로그아웃 버튼 작동 */
$("#gnb_logout_button").click(function(){
    //alert("버튼 작동");
    $.ajax({
        type:"POST",
        url:"logout.do",
        success:function(data){
            //alert("로그아웃 성공");
            document.location.reload();     
        } 
    }); // ajax 
});
</script>

</body>
</html>