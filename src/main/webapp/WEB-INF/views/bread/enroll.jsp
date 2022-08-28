<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

#result_card {
	position: relative;
}

.imgDeleteBtn {
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;
}
</style>
</head>
<body>
	<h1>게시판 등록</h1>
	<form action="/bread/enroll" method="post">
		<div class="input_wrap">
			<label>Name</label> <input name="productName">
		</div>
		<div class="input_wrap">
			<label>Price</label>
			<input name="productPrice">
		</div>
		<div class="input_wrap">
			<label>Category</label> <input name="productCategory">
		</div>


		<!-- 상품 이미지 등록 -->
		<div class="form_section">
			<div class="form_section_title">
				<label>상품 이미지</label>
			</div>
			<div class="form_section_content">
				<input type="file" id="fileItem" name='uploadFile'
					style="height: 30px;">
				<!-- 이미지 => js 코드로 실행-->
				<div id="uploadResult">
					<!--<div id="result_card">
						<div class="imgDeleteBtn">x</div>
						<img src="/bread/display?fileName=test.png">
					</div>-->
				</div>
			</div>
		</div>
		<input type="submit" value="등록">


	</form>



	<script>
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		let formData = new FormData(); //FormData: form 태그의 역할 객체의 주소를 변수에 저장하여 FormData 자체를 서버로 전송해야함
		
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		/*
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		*/
		
		formData.append("uploadFile", fileObj); //사용자가 선택한 파일을 FormData에 "uploadFile"이란 이름(key)으로 추가해주는 코드를 작성
		
		$.ajax({ // AJAX를 사용하여 서버로 전송 (processData, 와 contenttype 속성의 값을 'false'로 해주어야만 첨부파일이 서버로 전송)
			url: '/bread/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success : function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}
	    	
	    	
	    	//url : 서버로 요청을 보낼 url
	    	//processData : 서버로 전송할 데이터를 queryStirng 형태로 변환할지 여부
	     	//contentType : 서버로 전송되는 데이터의 content-type
	    	//data : 서버로 전송할 데이터
	    	//type : 서보 요청 타입(GET, POST)
	    	//dataType : 서버로부터 반환받을 데이터 타입
		});	
		
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr){
			
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			
			let uploadResult = $("#uploadResult");
			
			let obj = uploadResultArr[0];
			
			let str = "";
			
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/"  + obj.fileName);
			
			str += "<div id='result_card'>";
			str += "<img src='/bread/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
			str += "</div>";		
			
	   		uploadResult.append(str);     
		}	
		
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
	</script>
</body>
</html>