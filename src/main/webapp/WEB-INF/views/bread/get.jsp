<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/product/get.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
<style type ="text /css ">
/* 리뷰 영역 */
.content_bottom {
	width: 80%;
	margin: auto;
}

.reply_content_ul {
	list-style: none;
}
.comment_wrap {
	position: relative;
	border-bottom: 1px dotted #d4d4d4;
	padding: 14px 0 10px 0;
	font-size: 12px;
}
/* 리뷰 머리 부분 */
.reply_top {
	padding-bottom: 10px;
}

.id_span {
	padding: 0 15px 0 3px;
	font-weight: bold;
}

.date_span {
	padding: 0 15px 0;
}
/* 리뷰 컨텐트 부분 */
.reply_bottom {
	padding-bottom: 10px;
}

.reply_button_wrap{
	position: relative;
	left: 700px;
}
/* 리뷰 선 */
.reply_line {
	width: 80%;
	margin: auto;
	border-top: 1px solid #c6c6cf;
}

/* 리뷰 제목 */
.reply_subject h2 {
	padding: 15px 0 5px 5px;
}
.update_reply_btn {
	font-weight: bold;
	background-color: #b7b399;
	display: inline-block;
	width: 40px;
	text-align: center;
	height: 20px;
	line-height: 20px;
	margin: 0 5px 0 30px;
	border-radius: 6px;
	color: white;
	cursor: pointer;
}

.delete_reply_btn {
	font-weight: bold;
	background-color: #e7578f;
	display: inline-block;
	width: 40px;
	text-align: center;
	height: 20px;
	line-height: 20px;
	border-radius: 6px;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<li><a href="/">Main</a></li>
					<c:if test="${member == null}">
						<li><a href="/memberLogin">로그인</a></li>
						<li><a href="/memberJoin">회원가입</a></li>
					</c:if>
					<c:if test="${member != null}">                    
                    <li>
                        <a id="/gnb_logout_button">로그아웃</a>
                    </li>
                    <li>
                        <a href="/memberMyPage">마이룸</a>
                    </li>
                    <li>
                        <a href="/cartlist/${member.memberId}">장바구니</a>
                    </li>
                </c:if> 
				</ul>
			</div>
		<div class="form_section">
		<div class="form_section_title">
		</div>
		<div class="form_section_content">

			<div id="uploadResult"></div>
		</div>
	</div>		
	<div class="input_wrap_name">
	<h1><c:out value="${pageInfo.productName}"/></h1>
	<br>
	<h4>까망베르를 형상화한 부드러운 까망베르치즈 빵</h4>
	</div>
	<div class="input_wrap">
		<!--<c:out value="${pageInfo.productCategory}"/>-->
		₩<c:out value="${pageInfo.productPrice}"/>
	</div>
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a><c:if test="${empty member.memberId}">	<a class="btn" id="cartLogin">장바구니</a> </c:if>
		<c:if test="${not empty member.memberId}"> <a class="btn" id="add_cart_btn">장바구니</a> </c:if>
	</div>
	<form id="infoForm" action="/bread/modify" method="get">
		<input type="hidden" id="productId" name="productId"
			value='<c:out value="${pageInfo.productId}"/>'> <input
			type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount"
			value='<c:out value="${cri.amount}"/>'> <input type="hidden"
			name="type" value="${cri.type}"> <input type="hidden"
			name="keyword" value="${cri.keyword }">
	</form>
	<div class="line"></div>
		<div class="content_bottom">
			<div class="reply_subject">
				<h2>REVIEW</h2>
			</div>
			<div class="reply_button_wrap">
				<button>리뷰쓰기</button>
			</div>
			<div class="reply_not_div"></div>
			<ul class="reply_content_ul">
				
				<li>
					<div class="comment_wrap">
						<div class="reply_top">
							<span class="id_span">sjinjin7</span> <span class="date_span">2022-05-14</span>
							<span class="rating_span">평점 : <span
								class="rating_value_span">4</span>점
							</span> <a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
						</div>
						<div class="reply_bottom">
							<div class="reply_bottom_txt">쫀득쫀득한 빵 안에는 크림치즈가 가득가득
								</div>
						</div>
					</div>
					<div class="comment_wrap">
						<div class="reply_top">
							<span class="id_span">dbsguswjd</span> <span class="date_span">2022-05-15</span>
							<span class="rating_span">평점 : <span
								class="rating_value_span">5</span>점
							</span> <a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
						</div>
						<div class="reply_bottom">
							<div class="reply_bottom_txt">와 이거 식감도 너무 좋고 맛도 느끼하지 않아요
								</div>
						</div>
					</div>
					<div class="comment_wrap">
						<div class="reply_top">
							<span class="id_span">chlwlsdn</span> <span class="date_span">2022-05-15</span>
							<span class="rating_span">평점 : <span
								class="rating_value_span">5</span>점
							</span> <a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
						</div>
						<div class="reply_bottom">
							<div class="reply_bottom_txt">치즈가 적당히 달달하고 고소해요
								</div>
						</div>
					</div>
					<div class="comment_wrap">
						<div class="reply_top">
							<span class="id_span">hwan_E</span> <span class="date_span">2022-05-15</span>
							<span class="rating_span">평점 : <span
								class="rating_value_span">5</span>점
							</span> <a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
						</div>
						<div class="reply_bottom">
							<div class="reply_bottom_txt">선물용으로도 너무 좋아요
								</div>
						</div>
					</div>
				</li>
			
			</ul>
	
 </div>
</div>
</div>


<form id="addCartForm" method="POST">
		<input type="hidden" id="memberId" name="memberId" value='<c:out value="${member.memberId}"/>'>
		<input type="hidden" id="productId" name="productId" value='<c:out value="${pageInfo.productId}"/>'>
		<input type="hidden" id="productCount" name="productCount" value='<c:out value=""/>'>
		<input type="hidden" id="productName" name="productName" value='<c:out value="${pageInfo.productName}"/>'>
		<input type="hidden" id="productPrice" name="productPrice" value='<c:out value="${pageInfo.productPrice}"/>'>
		<input type="hidden" id="totalPrice" name="totalPrice" value='<c:out value=""/>'>
	</form>
	<script>
		var form = $("#infoForm");

		/* 이미지 정보 호출 */
		var productId = '<c:out value="${pageInfo.productId}"/>';
		var uploadResult = $("#uploadResult");

		$
				.getJSON(
						"/bread/getAttachList",
						{
							productId : productId
						},
						function(arr) {

							if (arr.length === 0) {
								var str = "";
								str += "<div id='result_card'>";
								str += "<img src='/resources/img/productNoImage.png'>";
								str += "</div>";

								uploadResult.html(str);
								return;
							}

							var str = "";
							var obj = arr[0];

							var fileCallPath = encodeURIComponent(obj.uploadPath
									.replace(/\\/g, '/')
									+ "/" + "/s_" + obj.fileName);
							str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-filename='" + obj.fileName + "'";
		str += ">";
							str += "<img src='/bread/display?fileName="
									+ fileCallPath + "'>";
							str += "</div>";

							uploadResult.html(str);

						});

		$("#list_btn").on("click", function(e) {
			form.find("#productId").remove();
			form.attr("action", "/bread/list");
			form.submit();
		});
		
$(".reply_button_wrap").on("click", function(e){
			
			e.preventDefault();	
			const memberId = '${member.memberId}';
			const productId = '${pageInfo.productId}';

			let popUrl = "/bread/replyEnroll/" + memberId + "?productId=" + productId;
			console.log(popUrl);
			let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
			
			window.open(popUrl,"리뷰 쓰기",popOption);

		});
	</script>
	
	<script>
var form = $("#addCartForm");

$("#cartLogin").on("click", function(e) {
	form.attr("action", "/cartLogin");
	form.attr("method", "POST");
	form.submit();
});

$("#add_cart_btn").on("click", function(e) {
	form.attr("action", "/cart/add");
	form.attr("method", "POST");
	form.submit();
});
</script>
</body>
</html>