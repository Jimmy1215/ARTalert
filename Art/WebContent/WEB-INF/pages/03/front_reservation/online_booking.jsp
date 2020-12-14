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
							得藝食堂</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<div class="container">
		<br>
		<div class=title>
			<h3 align="center" style="margin-top: 20px;">得藝食堂</h3>
		</div>
		<p>加上輪播圖片</p>
		<div class=title align="center">
			<!-- <form method="post" -->
			<%-- action="<c:url value="/03/front/reservation/chooseNumberAndDate"/>"> --%>
			<div class="submitButton" align="center" style="font-size: larger">
				<a href="<c:url value="/03/front/reservation/chooseNumberAndDate"/>"
					class="genric-btn primary-border circle arrow">線上預約 <span
					class="lnr lnr-arrow-right"></span></a>
				<!-- <input type="submit" name="submit" value="線上預約"> -->
			</div>
			<!-- </form> -->
		</div>
		<br>
		<div class=content>
			<p>火鍋店注意事項</p>
		</div>
	</div>
</body>
<!-- ====================================================== -->
<script>
	
</script>
</html>
