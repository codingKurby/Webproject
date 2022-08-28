<%@page import="com.spring.bread.model.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	if(session.getAttribute("member") == null){response.sendRedirect("index");} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/member/memberMyPage.css" type="text/css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

</head>
<body>

	<div class="wrapper">
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
					<a href="memberMyPage"><span>마이페이지</span></a>
				</div>
			</div>
			
			<div class="content_area">
				<div class="modify_button_wrap">
					<div class="modify_button">
						<a class="modify_text" href="memberModify">개인정보보기/수정</a>
					</div>
				</div>
				<div class="changePw_button_wrap">
					<div class="changePw_button">
						<a class="changePw_text" href="memberChangePw">비밀번호 변경</a>
					</div>
				</div>
				<div class="delete_button_wrap">
					<div class="delete_button">
						<a class="delete_text" href="memberDelete">회원탈퇴</a>
					</div>
				</div>
				
			</div>
			
			
		</div>
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