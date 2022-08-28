<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>cart list</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">


</head>
<body>
	<div class="container">

		<div>
			<h1>Cart List</h1>
			<br>
		</div>
		<div style="float: right">
			<a href="/">Main</a> <a href="/memberMyPage">MyPage</a><br>
		</div>
		<div>
			<h14 style="font-size:20px;">${sessionScope.memberId}님의장바구니</h14>
			<hr>
		</div>

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

</body>
</html>