<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my reservation</title>
<style>
/* p, div { */

/* } */
.rs-symbol-color::after {
	content: "*";
	margin-left: 3px;
	font-weight: 700;
	color: rgb(203, 27, 69);
}
</style>

</head>
<body>
	<!-- start banner Area -->
	<section class="banner-area relative" id="home">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">AAART Shop</h1>
					<p class="text-white link-nav">
						<a href="index.html">首頁 </a> <span class="lnr lnr-arrow-right"></span>
						<a
							href="<c:url value='/03/front/reservation/chooseNumberAndDate' />">
							食堂訂位</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<div class="container">
		<br>
			<div class=title>
				<h3 align="center" style="margin-top: 20px;">得藝食堂線上訂位</h3>
			</div>
			<br>
		<c:if test="${reservationUpdateMsg != null}">
			<div class=title>
				<h3 align="center" style="margin-top: 20px;">${reservationUpdateMsg}</h3>
			</div>
		</c:if>
		<c:if test="${reservationErrorMsg != null}">
		<div class=title>
				<h3 align="center" style="margin-top: 20px;">系統錯誤，請重試</h3>
			</div>
		</c:if>
	</div>
</body>
</html>
<!-- ====================================================== -->
