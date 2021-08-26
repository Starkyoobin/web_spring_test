<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력 페이지</title>
<link rel="stylesheet" href="style.css" type="text/css">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-3">
		<div class="d-flex">
			<div class="mr-5">
				<jsp:include page="header.jsp"></jsp:include>
				
				<jsp:include page="menu.jsp"></jsp:include>
			</div>
			<section>
				<h2>날씨 입력</h2>
				<form method="get" action="/lesson05/test05/1">
					<div class="d-flex">
						<label>날짜</label> <input type="text" name="date" class="col-6 form-control">
						<label>날씨</label>
						<select class="form-control col-2" name="weather">
							<option value="sunny">맑음</option>
							<option value="partlyCloudy">구름조금</option>
							<option value="cloudy">흐림</option>
							<option value="rainy">비</option>
						</select>
						<label>미세먼지</label>
						<select class="form-control col-2" name="microDust">
							<option value="good">좋음</option>
							<option value="normal">보통</option>
							<option value="bad">나쁨</option>
						</select>
					</div>
					<div class="d-flex mb-5">
						<label>기온</label>
						<div class="input-group">
							<input class="form-control col-3" type="text" name="temperatures">
							<span class="input-group-addon">°C</span>
						</div>
						<label>강수량</label>
						<div class="input-group">
							<input class="form-control col-3" type="text" name="temperature">
							<span class="input-group-addon">mm</span>
						</div>
						<label>풍속</label>
						<div class="input-group">
							<input class="form-control col-3" type="text" name="temperature">
							<span class="input-group-addon">km/h</span>
						</div>
					</div>
					<input type="submit" class="btn btn-success" value="저장">				
				</form>
			</section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>