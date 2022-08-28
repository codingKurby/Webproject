<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BreadMall</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/main.css">
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
					<li><a href="/bread/list">상품목록</a></li>
					<c:if test="${member == null}">
						<li><a href="memberLogin">로그인</a></li>
						<li><a href="memberJoin">회원가입</a></li>
					</c:if>
					<c:if test="${member != null}">                    
                    <li>
                        <a id="gnb_logout_button">로그아웃</a>
                    </li>
                    <li>
                        <a href="memberMyPage">마이룸</a>
                    </li>
                    <li>
                        <a href="cartlist/${member.memberId}">장바구니</a>
                    </li>
                </c:if> 
				</ul>
			</div>
		
			<div class="top_area">
				<div class="logo_area">
					<a href="/"><img src="resources/img/jerry.png"></a>
				</div>
				
			<div class="hello"><h1>Spring Team Bread</h1></div>
				
			<div class="login_area">
			
					<c:if test="${member == null}">
						<div class="login_button">
							<a href="memberLogin">로그인</a>
						</div>
						<span><a href="memberJoin">회원가입</a></span>
					</c:if>
					<c:if test="${member != null}">
						<span>${member.memberName}님</span><br>
						<span>빵은</span><br>
						<span>0 칼로리!</span>
					</c:if>
				</div>
			
			<div class="clearfix"></div>
			
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
                document.location.reload();     
            } 
        }); // ajax 
    });
    
	$(document).ready(function() {

		let result = '<c:out value="${result}"/>';

		checkAlert(result);

		function checkAlert(result) {

			if (result === '') {
				return;
			}

			if (result === "enroll success") {
				alert("등록이 완료되었습니다.");
			}

		}

	});

	
</script>
 
</body>
</html>
