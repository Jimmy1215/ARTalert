<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">確認訂單</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a> <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->
<body>
<!-- <c:set var="funcName" value="END" scope="session"/>
var 用來設定屬性名稱，而 value 用來設定屬性值。
想要在 session 範圍中設定一個 "funcName" 屬性
 -->
<h1>感謝您購買課程</h1>
<h3>詳細資訊已同步寄送至您的信箱</h3>
<h3>您所報名的課程為</h3>
<table id="cTableF" class="table table-bordered" width="100%"
	cellspacing="0">
	<tr>
		<th>課程名稱</th>
		<th>課程日期</th>
	</tr>	
	
	 <c:forEach var="tko" varStatus="stat" items="${TTFO}"> <!-- 兩層 ccc.cartCo 在 CourseControllerF #43 #71 -->
		<tr>
		<td>${tko.title}</td>
		<!--如果是HashMap，var後需要加上  .value 。List則不用-->
			<td>${tko.date}</td>
		</tr>
	</c:forEach>
</table>
<h3>請您準時前往參加，謝謝</h3>
</body>
</html>