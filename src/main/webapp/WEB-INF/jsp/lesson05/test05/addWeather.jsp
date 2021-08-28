<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력 페이지</title>
<link rel="stylesheet" href="/lesson05/test05/css/style.css" type="text/css">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrap">
		<div class="d-flex">
			<jsp:include page="menu.jsp"></jsp:include>
			<section class="mt-3 ml-5">
				<h2>날씨 입력</h2>
				<form method="post" action="/lesson05/test05/add_weather">
					<div class="d-flex justify-content-between mt-5">
	                        <div class="d-flex align-items-center">
	                            <div class="input-label">날짜</div> 
	                            <input type="text" class="form-control" id="date" name="date">
	                        </div>
	                        <div class="d-flex align-items-center">
	                            <div class="input-label">날씨</div> 
	                            <select class="form-control" name="weather">
	                                <option>맑음</option>
	                                <option>구름조금</option>
	                                <option>흐림</option>
	                                <option>비</option>
	                            </select>
	                        </div>
	
	                        <div class="d-flex align-items-center">
	                            <div class="input-label">미세먼지</div> 
	                            <select class="form-control" name="microDust">
	                                <option>좋음</option>
	                                <option>보통</option>
	                                <option>나쁨</option>
	                                <option>최악</option>
	                            </select>
	                        </div>
	                    </div>
	
	                    <div class="d-flex justify-content-between mt-5">
	                        <div class="d-flex align-items-center">
	                            <div class="input-label">기온</div> 
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="temperatures">
	                                <div class="input-group-append">
	                                    <span class="input-group-text">℃</span>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="d-flex align-items-center">
	                            <div class="input-label">강수량</div> 
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="precipitation">
	                                    <div class="input-group-append">
	                                        <span class="input-group-text">mm</span>
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="d-flex align-items-center">
	                            <div class="input-label">풍속</div> 
	                            <div class="input-group">
	                                <input type="text" class="form-control" name="windSpeed">
	                                    <div class="input-group-append">
	                                        <span class="input-group-text">km/h</span>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="text-right mt-4 mb-5">
	                        <input type="submit" class="btn btn-success" value="저장">
	                    </div>
				</form>
			</section>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<script>
	    // ready 함수: DOM tree가 모두 구성된 후 불려지는 함수
	    $(document).ready(function() {
	        $('#date').datepicker({
	            changeMonth: true,  // 월 셀렉트 박스 
	            changeYear: true,   // 년 셀렉트 박스 
	            dateFormat:"yy-mm-dd",  // 표시 포멧 
	        });
	    });
    </script>
</body>
</html>