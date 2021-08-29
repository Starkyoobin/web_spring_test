<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2>즐겨찾기 추가하기</h2>
		<label>제목</label> <input type="text" name="name" id="nameInput" class="form-control">
		<label>주소</label> <input type="text" name="url" id="urlInput" class="form-control">
		<button class="btn btn-success form-control" id="addBtn">추가</button>		
	</div>
	
	<script>
		$(document).ready(function() {
			$("#addBtn").on("click", function(e) {
				e.preventDefault();
				
				var name = $("#nameInput").val();
				var url = $("#urlInput").val();
				
				if(name == null || name == "") {
					alert("제목을 입력하세요");
					return;
				}
				if(url == null || url == "") {
					alert("주소를 입력하세요");
					return;
				}
				//if(url.startsWith("http://")) {
					
				//}
				
				$.ajax({
					type:"post",
					url:"/lesson06/add_favorite",
					data:{"name":name, "url":url},
					success:function(data) {
						if(data.result == "success") {
							window.location.href='/lesson06/favorite_info';
						} else {
							alert("추가 실패");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
				
			});
		});
	</script>
</body>
</html>