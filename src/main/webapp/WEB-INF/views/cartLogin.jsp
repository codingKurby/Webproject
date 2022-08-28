<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/memberLogin.css" type="text/css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<form id="login_form" method="post">
	<div class="wrap">
	<div class="subject">
		<div class="logo_area">
			<a href="/main"><img src="resources/img/mLogo.png"></a>
		</div>
		<div class="subject_name">
			<a href="memberLogin"><span>로그인</span></a>
		</div>
	</div>
	<div class="id_wrap">
		<div class="id_name">아이디</div>
		<div class="id_input_box">
			<input class="id_input" type="text" name="memberId">
		</div> 
	</div>
	<div class="pw_wrap">
		<div class="pw_name">비밀번호</div>
		<div class="pw_input_box">
			<input class="pw_input" type="password" name="memberPw">
		</div> 
	</div>
	
	<c:if test="${result == 0}">
		<div class="login_warn">ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
	</c:if>
	
	<div class="login_button_wrap">
		<span><input type="button" class="login_button" value="로그인"></span>
	</div>
		
</div>
</form>
</div>

<script>
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        //alert("로그인 버튼 작동");
        
    	 /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "cartLoginProc");
        $("#login_form").submit();
    });
 
</script>
</body>
</html>