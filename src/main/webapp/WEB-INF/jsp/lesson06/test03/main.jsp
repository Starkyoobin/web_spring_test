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
<title>홈페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrap" >
        <jsp:include page="header.jsp"></jsp:include>

        <section class="banner">
            <img src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" id="bannerImage">
        </section>
        <section>
            <div class="info d-flex">
	            <article class="reservation d-flex justify-content-center align-items-center">
	                <div class="display-4">
	                    실시간 <br>
	                    예약 하기 
	                </div>
	            </article>
	            <article class="reservation-confirm">
	                <div class="m-4">
	                    <div class="d-flex align-items-end">
	                        <h3 class="mr-4">예약 확인</h3>
	                    </div>
	                    <div class="member-input mt-3" id="member">
	                        <div class="input-gorup form-inline">
	                            <label class="input-label">이름</label>
	                            <input type="text" class="form-control text-input" id="nameInput">
	                        </div>
	                        <div class="input-gorup form-inline mt-3">
	                            <label class="input-label">전화번호</label>
	                            <input type="text" class="form-control text-input" id="phoneNumberInput">
	                        </div>
	                    </div>
	                    <div class="d-flex justify-content-end">
	                        <button class="btn btn-success mt-3 mr-5" id="lookupBtn">조회 하기</button>
	                    </div>
	                </div>
	            </article>
	            <article class="reservation-call d-flex justify-content-center align-items-center">
	                <div>
	                    <h3>예약문의 : </h3>
	                    <h1>010-</h1>
	                    <h1>000-1111</h1>
	                </div>
	            </article>           
            </div>
        </section>

        <jsp:include page="footer.jsp"></jsp:include>
    </div>
    
    <script>
    	$(document).ready(function() {
    		$("#lookupBtn").on("click", function(e) {
    			var name = $("#nameInput").val();
    			var phoneNumber = $("#phoneNumberInput").val();
    			
    			$.ajax({
    				type:"get",
    				url:"/lesson06/booking_check",
    				data:{"name":name, "phoneNumber":phoneNumber, "date":data, "day":day, "headcount":headcount},
    				success:function(data) {
    					if(result.name == name && result.phoneNumber == phoneNumber) {
    						alert(
    						"이름 : " + result.name
    						"\n날짜 : " + result.date
    						"\n일수 : " + result.day
    						"\n인원 : " + result.headcount
    						"\n상태 : " + result.state
    						);
    					} else {
    						alert("조회 결과가 없습니다");
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