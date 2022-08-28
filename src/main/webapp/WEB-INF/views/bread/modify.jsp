<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
</style>
</head>
<body>
<h1>수정 페이지</h1>
<form id= "modifyForm" action="/bread/modify" method="post">
	<div class="input_wrap">
		<label>번호</label>
		<input name="productId"  value='<c:out value="${pageInfo.productId}"/>' >
	</div>
	<div class="input_wrap">
		<label>제품명</label>
		<input name="productName" value='<c:out value="${pageInfo.productName}"/>' >
	</div>
	<div class="input_wrap">
		<label>가격</label>
		<input name="productPrice" value='<c:out value="${pageInfo.productPrice}"/>'>
	</div>
	<div class="input_wrap">
		<label>카테고리</label>
		<input name="productCategory" value='<c:out value="${pageInfo.productCategory}"/>' >
	</div>
	
	
        <a class="btn" id="list_btn">목록 페이지</a> 
        <a class="btn" id="modify_btn">수정 완료</a>
        <a class="btn" id="cancel_btn">수정 취소</a>
        <a class="btn" id="delete_btn">삭제</a>

	</form>
	<form id="infoForm" action="/bread/modify" method="get">
		<input type="hidden" id="productId" name="productId" value='<c:out value="${pageInfo.productId}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type}">
		<input type="hidden" name="keyword" value="${cri.keyword }"> 
	</form>
<script>
let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
let mForm = $("#modifyForm");    // 페이지 데이터 수정 from

/* 목록 페이지 이동 버튼 */
$("#list_btn").on("click", function(e){
    form.find("#productId").remove();
    form.attr("action", "/bread/list");
    form.submit();
});

/* 수정 하기 버튼 */
$("#modify_btn").on("click", function(e){
    mForm.submit();
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
    form.attr("action", "/bread/get");
    form.submit();
});   

/* 삭제 버튼 */
$("#delete_btn").on("click", function(e){
    form.attr("action", "/bread/delete");
    form.attr("method", "post");
    form.submit();
});
</script>	
</body>
</html>