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
<title>회원정보</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/memberModify.css" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>
</head>
<body>
	<div class="wrapper">
		<form id="modify_form" method="post">
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
						<a href="memberModify"><span>회원정보 수정</span></a>
					</div>
					</div>
					
					
					<div class="name_wrap">
						<div class="name_name">이름</div>
						<div class="name_input_box">
							<input type="text" class="name_input" name="memberName"
								value="${mem.memberName}">
						</div>
						<span class="final_name_ck">이름을 입력해주세요.</span>
					</div>
					<div class="phone_wrap">
						<div class="phone_name">전화번호</div>
						<div class="phone_input_box">
							<select class="phone1_input" name="memberPhone1">
				   				<option value="010" <c:if test="${mem.memberPhone1 == 010 }">selected</c:if>>010</option>
								<option value="011" <c:if test="${mem.memberPhone1 == 011 }">selected</c:if>>011</option>
								<option value="016" <c:if test="${mem.memberPhone1 == 016 }">selected</c:if>>016</option>
								<option value="017" <c:if test="${mem.memberPhone1 == 017 }">selected</c:if>>017</option>
								<option value="018" <c:if test="${mem.memberPhone1 == 018 }">selected</c:if>>018</option>
								<option value="019" <c:if test="${mem.memberPhone1 == 019 }">selected</c:if>>019</option>
							</select>
							<input class="phone2_input" type="tel" maxlength="4" name="memberPhone2" value="${mem.memberPhone2}"> 
							-<input class="phone3_input" type="tel" maxlength="4" name="memberPhone3" value="${mem.memberPhone3}">
						</div>
						<span class="final_phone_ck">번호를 입력해주세요.</span>
					</div>
					<div class="mail_wrap">
						<div class="mail_name">이메일</div>
						<div class="mail_input_box">
							<input type="text" class="mail_input" name="memberMail"
								value="${mem.memberMail}">
						</div>
						<span class="final_mail_ck">이메일을 입력해주세요.</span>
					</div>
					<div class="addr_wrap_1">
						<div class="addr_name">주소</div>
						<div class="addr_input_box_1">
							<input class="addr_input_1" type="text" name="memberAddr1" readonly="readonly" value="${mem.memberAddr1 }">
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
								<input class="addr_input_2" type="text" name="memberAddr2" readonly="readonly" value="${mem.memberAddr2 }">
							</div>
						</div>
					</div>
					
					<div class="addr_wrap_3">
						<div class="addr_name">상세주소</div>
						<div class="addr_input_box_3">
							<input class="addr_input_3" type="text" name="memberAddr3" readonly="readonly" value="${mem.memberAddr3 }">
						</div>
						<span class="final_addr_ck">주소를 입력해주세요.</span>
					</div>
					</div>
					<input type="hidden" name="memberId" value="${mem.memberId }" >
					<div class="modify_button_wrap">
						<span><input class="modify_button" type="button" value="수    정"></span>
					</div>
		</form>
	</div>
	</div>
	</div>
<script>
/* 유효성 검사 통과유무 변수 */
var nameCheck = false;            // 이름
var phoneCheck = false;
var mailCheck = false;            // 이메일
var addressCheck = false         // 주소
 
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".modify_button").click(function(){
		
		/* 입력값 변수 */
        var name = $('.name_input').val();            // 이름 입력란
        var phone2 = $('.phone2_input').val();
        var phone3 = $('.phone3_input').val();
        var mail = $('.mail_input').val();            // 이메일 입력란
        var addr = $('.addr_input_3').val();        // 주소 입력란
        
        
        /* 이름 유효성 검사 */
        if(name == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 이메일 유효성 검사 */
        if(mail == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        
        /* 전화번호 유효성 검사 */
        if(phone2 == "" || phone3 == ""){
            $('.final_phone_ck').css('display','block');
            phoneCheck = false;
        }else{
            $('.final_phone_ck').css('display', 'none');
            phoneCheck = true;
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
        if(nameCheck&&mailCheck&&phoneCheck&&addressCheck ){
			$("#modify_form").attr("action", "memberModify");
			$("#modify_form").submit();
			console.log(nameCheck);
			console.log(mailCheck);
			console.log(phoneCheck);
			console.log(addressCheck);
			
        }    
        return false;
		
	});
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