<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 페이지</title>
<link rel="stylesheet" href="style.css" type="text/css">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<fmt:setLocale value="ko_KR" scope="session" />
	<div class="container mt-3">
		<div class="d-flex">
			<div class="mr-5">
				<jsp:include page="header.jsp"></jsp:include>
				
				<jsp:include page="menu.jsp"></jsp:include>
			</div>	
			<section>
				<h3>과거 날씨</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${weatherHistory }">
							<fmt:parseDate value="${result.date }" pattern="yyyy-MM-dd" var="date" />
							<tr>
								<td><fmt:formatDate value="${date }" pattern="yyyy년 MM월 dd일" /></td>
								<c:choose>
									<c:when test="${result.weather == '비' }">
										<td>
											<img alt="비" src="http://marondal.com/material/images/dulumary/web/jstl/rainy.jpg">
										</td>
									</c:when>
									<c:when test="${result.weather == '흐림' }">
										<td>
											<img alt="흐림" src="http://marondal.com/material/images/dulumary/web/jstl/cloudy.jpg">
										</td>
									</c:when>
									<c:when test="${result.weather == '맑음' }">
										<td>
											<img alt="맑음" src="http://marondal.com/material/images/dulumary/web/jstl/sunny.jpg">
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<img alt="구름조금" src="http://marondal.com/material/images/dulumary/web/jstl/partlyCloudy.jpg">
										</td>
									</c:otherwise>
								</c:choose>
								<td>${result.temperatures }°C</td>
								<td>${result.precipitation }mm</td>
								<td>${result.microDust }</td>
								<td>${result.windSpeed }km/h</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>