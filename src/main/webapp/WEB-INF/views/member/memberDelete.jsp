<%@page import="com.spring.bread.model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/memberDelete.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>
</head>
<body>

<div class="wrapper">
	<form method="post">
	<div class="wrap">
	
	<div class="top_gnb_area">
		<ul class="list">
			<c:if test="${member != null}">
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
						<a href="memberDelete"><span>회원탈퇴</span></a>
					</div>
		</div>
	
	
	<div class="id_wrap">
		<div class="id_name">아이디</div>
		<div class="id_input_box">
			<input class="id_input" type="text" name="memberId" value="${member.memberId}" readonly="readonly">
		</div> 
	</div>
	
	<div class="pw_wrap">
		<div class="pw_name">비밀번호</div>
		<div class="pw_input_box">
			<input class="pw_input" type="password" name="memberPw">
		</div> 
	</div>
	
	<c:if test="${result == 0}">
		<div class="delete_warn">비밀번호를 잘못 입력하셨습니다.</div>
	</c:if>
	
	<div class="delete_button_wrap">
		<span><input type="submit" class="delete_button" value="회원탈퇴"></span>
	</div>
</div>
</form>
</div>

<script>
 
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