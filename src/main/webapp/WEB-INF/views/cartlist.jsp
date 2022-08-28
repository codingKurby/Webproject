<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%	if(session.getAttribute("member") == null){response.sendRedirect("/index");} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>장바구니</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Myeongjo&family=Poor+Story&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/cart/cartList.css" type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>

<div class="wrapper">
	<div class="wrap">

	<div class="top_gnb_area">
				<ul class="list">
					<c:if test="${member != null}">
						<li><a href="/">Main</a></li>
						<li><a id="gnb_logout_button">로그아웃</a></li>
						<li><a href="/memberMyPage">마이룸</a></li>
						<li><a href="/cartlist/${member.memberId}">장바구니</a></li>
					</c:if>
				</ul>
			</div>		
			
	<div class="subject">
		<div class="logo_area">
			<a href="/main"><img src="/resources/img/mLogo.png"></a>
		</div>
		<div class="subject_name">
			<a href="cartlist"><span>장바구니</span></a>
		</div>
	</div>
	
	
	
	<div class="container">
		<!-- <div>${msg}</div> -->

		<c:choose>
			<c:when test="${0 != cartInfo.size() }">
				<table class="table">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">Cart No.</th>
							<th scope="col">상품코드</th>
							<th scope="col">상품명</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>
							<th scope="col"></th>
							<th scope="col">판매가</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="info" items="${cartInfo}" varStatus="status">
							<tr>
								<th><input name="checkbox-<c:out value="${info.cartId}" />"
									id="checkbox-<c:out value="${info.cartId}" />"
									class="form-check-input" type="checkbox"></th>
								<th><c:out value="${info.cartId}" /></th>
								<th><c:out value="${info.productId}" /></th>
								<th><c:out value="${info.productName}" /></th>
								<th><c:out value="${info.productPrice}" /></th>
								<th><select
									name="productCount-<c:out value="${info.cartId}" />"
									id="productCount-<c:out value="${info.cartId}" />"
									class="form-select">
										<option value="1"
											<c:if test="${info.productCount eq 1}"> selected </c:if>>
											1</option>
										<option value="2"
											<c:if test="${info.productCount eq 2}"> selected </c:if>>2</option>
										<option value="3"
											<c:if test="${info.productCount eq 3}"> selected </c:if>>3</option>
										<option value="4"
											<c:if test="${info.productCount eq 4}"> selected </c:if>>4</option>
										<option value="5"
											<c:if test="${info.productCount eq 5}"> selected </c:if>>5</option>
										<option value="6"
											<c:if test="${info.productCount eq 6}"> selected </c:if>>6</option>
										<option value="7"
											<c:if test="${info.productCount eq 7}"> selected </c:if>>7</option>
										<option value="8"
											<c:if test="${info.productCount eq 8}"> selected </c:if>>8</option>
										<option value="9"
											<c:if test="${info.productCount eq 9}"> selected </c:if>>9</option>
										<option value="10"
											<c:if test="${info.productCount eq 10}"> selected </c:if>>10</option>
								</select></th>
								<th>
									<button type="button" class="btn btn-warning"
										onclick="modifiyRow(<c:out value="${info.cartId}" />)">수정</button>
								</th>
								<th><c:out value="${info.productPrice * info.productCount}" />
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<button type="button" class="btn btn-danger" onclick="deleteRow()">삭제</button>
				<button type="button" class="btn btn-success" onclick="buyRow()">구매</button>
			</c:when>
			<c:otherwise>
				<div>해당 유저의 장바구니가 비었습니다.</div>
			</c:otherwise>
		</c:choose>

	</div>
		
</div>
</div>





	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		
	function modifiyRow(cartId) {
			var productCount = $('#productCount-'+cartId).val();
			
			console.log('cartId : ' + cartId);
			console.log('productCount : ' + productCount);
			
			$.ajax({
			    url:'http://localhost:8080/cart/update'
			    , type:'POST' // GET, PUT
			    , data: { 'cartId':cartId, 'productCount':productCount }// 전송할 데이터
			    , dataType:'json'// xml, json, script, html
				, success : function(data){
					window.location.reload();		
				}
			    , error: function (request, status, error) {
					window.location.reload();		
			    }
			});
			
		}
	
		function deleteRow() {
			console.log('삭제하기 !');			

			var checkboxValues = [];

		    $('input[type="checkbox"]:checked').each(function(index, elem) {
		    	var cid = $(elem).attr('id');
		    	var tid = cid.substring(9);
		        checkboxValues.push(tid);
		    });
			
		    console.log('checkboxValues : ' + checkboxValues);
		    
		    /*  Ajax */
			$.ajax({
			    url:'http://localhost:8080/cart/delete'
			    , type:'POST' // GET, PUT
			    , data: { 'productDeleteList':checkboxValues}// 전송할 데이터
			    , dataType:'json'// xml, json, script, html
				, success : function(data){
					window.location.reload();		
				}
			    , error: function (request, status, error) {
					 window.location.reload();		
			    }
			});		    
		    
		}
		
		
	 function buyRow() {
			console.log('구매하기 !');		
			var checkboxValues = [];

		    $('input[type="checkbox"]:checked').each(function(index, elem) {
		    	var cid = $(elem).attr('id');
		    	var tid = cid.substring(9);
		        checkboxValues.push(tid);
		    });
			
		    console.log('checkboxValues : ' + checkboxValues);
		    
		    /*  Ajax */
		$.ajax({
			    url:'http://localhost:8080/cart/buy'
			    , type:'POST' // GET, PUT
			    , data: { 'productbuyList':checkboxValues}// 전송할 데이터
			    , dataType:'json'// xml, json, script, html
				, success : function(data){
			    	 alert('구매가 완료되었습니다.');
					window.location.reload();		
				}
			    , error: function (request, status, error) {
			    	 alert('구매가 완료되었습니다.');
					 window.location.reload();		
			     }
			   
			});	 

		 
			
		}
	
	
	
	</script>
	<script>
    /* gnb_area 로그아웃 버튼 작동 */
    $("#gnb_logout_button").click(function(){
        //alert("버튼 작동");
        $.ajax({
            type:"POST",
            url:"/logout.do",
            success:function(data){
                //alert("로그아웃 성공");
                document.location.reload();     
            } 
        }); // ajax 
    });
</script>

</body>
</html>