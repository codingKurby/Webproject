<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/product/list.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
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
                        <a id="gnb_logout_button">로그아웃</a>
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
		
			<div class="subject">
		<div class="logo_area">
			<a href="/main"><img src="/resources/img/mLogo.png"></a>
		</div>
		<div class="subject_name">
			<a href="/bread/list"><span>상품페이지</span></a>
		</div>
	</div>
		

		
	<div class="list_search_result">
		<table class="type_list">
			<colgroup>
				<col width="110">
				<col width="*">
				<col width="120">
				<col width="120">
				<col width="120">
			</colgroup>
			<tbody id="searchList>">
				<c:forEach items="${list}" var="list">
				
					<tr>
						<td class="image">
							<div class="image_wrap"
								data-productid="${list.imageList[0].productId}"
								data-path="${list.imageList[0].uploadPath}"
								data-filename="${list.imageList[0].fileName}">
								<img>
							</div>
						</td>
						<td class="detail">
							<div class="category">[${list.productCategory}]</div>
							<div class="title">
								<a class="move" href='<c:out value="${list.productId}"/>'>
								<c:out value="${list.productName}" /></a>
							</div>
						</td>
						<td class="price">
							<div class="org_price">₩${list.productPrice}</div>
						</td>
						
				</c:forEach>
			</tbody>

		</table>
	</div>
	<div class="search_wrap">
		<div class="search_area">
			<select name="type">
				<option value=""
					<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
				<option value="N"
					<c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>제품명</option>
				<option value="C"
					<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>카테고리</option>
				<option value="NC"
					<c:out value="${pageMaker.cri.type eq 'NC'?'selected':'' }"/>>제품명
					+ 카테고리</option>
			</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword }">   
			<button>Search</button>
		</div>
	</div>
	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">

				<!-- 이전페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageInfo_btn previous"><a
						href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>

				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
						href="${num}">${num}</a></li>
				</c:forEach>


				<!-- 다음페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageInfo_btn next"><a
						href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>
			</ul>

		</div>
	</div>

	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		<input type="hidden" name="type" value="${pageMaker.cri.type }">
	</form>
	</div>
	</div>


	<script>
	
		$(document).ready(function(){

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

		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj) {
		 const bobj = $(obj);
		 if (bobj.data("productid")) {
			const bobj = $(obj);
			const uploadPath = bobj.data("path");
			const fileName = bobj.data("filename");
			const fileCallPath = encodeURIComponent(uploadPath+ "\\" + "/s_" + fileName);

		$(this).find("img").attr('src','/bread/display?fileName='+ fileCallPath);
		 } else {
			$(this).find("img").attr('src','/resources/img/productNoImage.png');
			}

		 });

		});

		let moveForm = $("#moveForm");

		$(".move").on("click",function(e) {
		 e.preventDefault();
		 moveForm.append("<input type='hidden' name='productId' value='"+ $(this).attr("href") + "'>");
		 moveForm.attr("action", "/bread/get");
		 moveForm.submit();
		});

		$(".pageInfo a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/bread/list");
			moveForm.submit();

		});
		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
<script>
/* gnb_area 로그아웃 버튼 작동 */
$("#gnb_logout_button").click(function(){
	//alert("버튼 작동");
    $.ajax({
		type:"POST",
		url:"/logout.do",
		success:function(data){
			alert("로그아웃 성공");
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