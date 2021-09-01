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
		<div class="d-flex">
			<label>주소</label> <input type="text" name="url" id="urlInput" class="form-control">
			<button type="button" id="urlCheckBtn" class="btn btn-info ml-3">중복확인</button>		
		</div>
		<div class="text-danger d-none" id="duplicateDiv">중복된 url입니다</div>
		<div class="text-success d-none" id="noneDuplicateDiv">저장 가능한 url 입니다</div>
		<button class="btn btn-success form-control" id="addBtn">추가</button>		
	</div>
	
	<script>
		$(document).ready(function() {
			var isChecked = false;
			var duplicate = true;
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
				// httP:// 또는 http:// 가 아니면 잘못된 url
				if(!(url.startsWith("http://") || url.startsWith("http://"))) {
					alert("잘못된 url입니다.");
					return;
				}
				
				//중복 체크 여부 유효성 검사
				if(!isChecked) {
					alert("중복체크를 진행해주세요.");
					return;
				}
				
				//이름이 중복된 경우
				if(isDuplicate) {
					alert("중복된 url은 입력할 수 없습니다.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/lesson06/add_favorite",
					data:{"name":name, "url":url},
					success:function(data) {
						if(data.result == "success") {
							window.location.href='/lesson06/favorite_info';
						} else{
							alert("삽입 실패");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
				
			});
			
			$("#urlCheckBtn").on("click", function() {
				var url = $("#urlInput").val();
				
				if(url == null || url == "") {
					alert("주소를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/lesson06/is_duplication",
					data:{"url":url},
					success:function(data) {
						isChecked = true;
						if(data.isDuplication) {
							isDuplicate = true;
							$("#duplicateDiv").removeClass("d-none");
							$("#noneDuplicateDiv").addClass("d-none");
						} else {
							isDuplicate = false;
							$("#noneDuplicateDiv").removeClass("d-none");
							$("#duplicateDiv").addClass("d-none");
						}
					},
					error:function(e) {
						alert("Error");
					}
				})
			})
		});
	</script>
</body>
</html>