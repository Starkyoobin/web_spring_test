<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/lesson06/css/style.css" type="text/css">
<title>예약 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		
		<section class="d-flex mt-3">
			<div class="col-3"></div>
			<div class="col-6 justify-content-center">
				<h3 class="text-center">예약하기</h3>
				<label>이름</label>
				<input type="text" class="form-control" id="nameInput">
				<label>예약날짜</label>
				<input type="text" class="form-control" id="datepicker">
				<label>숙박일수</label>
				<input type="text" class="form-control" id="dayInput">
				<label>숙박인원</label>
				<input type="text" class="form-control" id="headcountInput">
				<label>전화번호</label>
				<input type="text" class="form-control" id="phoneNumberInput">
				
				<button id="addBtn" type="button" class="mt-3 form-control btn btn-warning">예약하기</button>			
			</div>
			<div class="col-3"></div>
		</section>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<script>
		$(document).ready(function() {
			$("#datepicker").datepicker({
				dateFormat:"yy-m-d",
				minDate:0
			});
			
			$("#addBtn").on("click", function(e) {
				var	name = $("#nameInput").val();
				var	date = $("#datepicker").val();
				var	day = $("#dayInput").val();
				var	headcount = $("#headcountInput").val();
				var	phoneNumber = $("#phoneNumberInput").val();
				
				if(name == null || name == "") {
					alert("이름을 입력하세요");
					return;
				}
				
				if(date == null || date == "") {
					alert("예약날짜 입력하세요");
					return;
				}
				
				if(day == null || day == "") {
					alert("숙박일수를 입력하세요");
					return;
				}
				if(isNaN(day)) {
					alert("숙박일수는 숫자만 입력가능합니다");
					return;
				}
				
				if(headcount == null || headcount == "") {
					alert("인원수를 입력하세요");
					return;
				}
				if(isNaN(headcount)) {
					alert("인원수는 숫자만 입력가능합니다");
					return;
				}
				
				if(phoneNumber == null || phoneNumber == "") {
					alert("전화번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"get",
					url:"/lesson06/add_booking",
					data:{"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber},
					success:function(data) {
						if(data.result == "success") {
							location.href = "/lesson06/booking_info";
						} else {
							alert("삽입 실패");
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