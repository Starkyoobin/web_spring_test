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
<title>예약 목록 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="header.jsp"></jsp:include>
		
		<section>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>예약날짜</th>
						<th>숙박일수</th>
						<th>숙박인원</th>
						<th>전화번호</th>
						<th>예약상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="booking" items="${result }">
						<tr>
							<td>${booking.name }</td>
							<td><fmt:formatDate value="${booking.date }" pattern="yyyy년 MM월 dd일" /></td>
							<td>${booking.day }</td>
							<td>${booking.headcount }</td>
							<td>${booking.phoneNumber }</td>
							<td>
								<c:choose>
									<c:when test="${booking.state == '대기중'}">
										<span class="text-info">${booking.state }</span>
									</c:when>
									<c:when test="${booking.state == '확정'}">
										<span class="text-success">${booking.state }</span>
									</c:when>
									<c:otherwise>
										${booking.state }
									</c:otherwise>
								</c:choose>
							</td>
							<td><button type="button" class="btn btn-danger deleteBtn" data-booking-id="${booking.id }">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<script>
		$(document).ready(function() {
			$(".deleteBtn").on("click", function(e) {
				var bookingId = $(this).data("booking-id");
				
				$.ajax({
					type:"get",
					url:"/lesson06/booking_delete",
					data:{"bookingId":bookingId},
					success:function(data) {
						location.reload();
					},
					error:function(e) {
						alert("error");
					}
				});
			})
		});
	</script>
</body>
</html>