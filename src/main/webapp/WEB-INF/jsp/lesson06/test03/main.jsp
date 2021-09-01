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
            <img src="test06_banner1.jpg" id="bannerImage">
        </section>
        <sction class="d-flex">
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
                    
                        <label>회원
                        <input type="radio" name="type" value='member' checked></label>
                        <label class="ml-3">비 회원
                        <input type="radio" name="type" value="nonMemeber"></label>
                    </div>
                    <div class="member-input mt-3" id="member">
                        <div class="input-gorup form-inline">
                            <label class="input-label">아이디 :</label>
                            <input type="text" class="form-control text-input" id="id">
                        </div>
                        <div class="input-gorup form-inline mt-3">
                            <label class="input-label">비밀번호 :</label>
                            <input type="password" class="form-control text-input" id="password">
                        </div>

                    </div>

                    <div class="no-member-input mt-3 d-none" id="nonMember">
                        <div class="input-gorup form-inline">
                            <label class="input-label">이름 </label>
                            <input type="text" class="form-control text-input" id="name">
                        </div>
                        <div class="input-gorup form-inline mt-3">
                            <label class="input-label">전화번호 </label>
                            <input type="text" class="form-control text-input" id="phoneNumber">
                        </div>
                        <div class="input-gorup form-inline mt-3">
                            <label class="input-label">날짜 </label>
                            <input type="text" class="form-control text-input" id="date">
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
        </section>

        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>