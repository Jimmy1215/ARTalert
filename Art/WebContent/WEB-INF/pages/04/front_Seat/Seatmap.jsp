<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='/frontstyle/css/processbar.css' />">

<style>
.area {
    background:	#CC0000;
    display:block;
    height:195px;
    opacity:0;
    position:absolute;
    width:352px;
}
#area1 {
    left:136px;
    Top:110px;
}
#area2 {
    left:136px;
    Top:300px;
}
#area3 {
	background:	#CC0000;
    display:block;
    height:675px;
    opacity:0;
    position:absolute;
    width:600px;
	clip-path: polygon(6% 17%, 21% 17%, 21% 74%, 79% 74%, 79% 17%, 94% 17%, 94% 93%, 6% 93%);
}
#area1:hover, #area2:hover ,#area3:hover{
    opacity:0.4;
}

tr:hover { 
background-color:#CC0000;
 opacity:0.4;
 }

.color{
}
.ticketarea{
width:20px;
}
.tickettype{
width:100px;
}
.seat{
}
.price{
}
.seatnum{
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
					<h1 class="text-white">AAART Ticket</h1>
					<p class="text-white link-nav">
						<a href="<c:url value='/index.html' />">Home </a> <span
							class="lnr lnr-arrow-right"></span> <a href=""> Search</a><span
							class="lnr lnr-arrow-right"></span><a href=""> Order</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<div class="container">

		<div class="row bs-wizard" style="border-bottom: 0;">

			<div class="col-lg-3 bs-wizard-step start">
				<!-- start -->
				<div class="text-center bs-wizard-stepnum">Step 1</div>
				<div class="progress">
					<div class="progress-bar" style="width: 100%;"></div>
				</div>
				<a href="" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center">區域/張數</div>
			</div>

			<div class="col-lg-3 bs-wizard-step complet">
				<!-- complete -->
				<div class="text-center bs-wizard-stepnum">Step 2</div>
				<div class="progress">
					<div class="progress-bar" style="width: 50%;"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center">劃位</div>
			</div>

			<div class="col-lg-3 bs-wizard-step active">
				<!-- complete -->
				<div class="text-center bs-wizard-stepnum">Step 3</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center">購票確認</div>
			</div>

			<div class="col-lg-3 bs-wizard-step disabled">
				<!-- active -->
				<div class="text-center bs-wizard-stepnum">Step 4</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center">完成訂購</div>
			</div>
		</div>


		<c:set var="seat" value="${requestScope.seat}" />
		<form name="order" action="<c:url value='/04/booking.ctrl'/>"
			method="get">
			<p id="ticketnum" style="display: none">${sessionScope.shoppingcart.TICKET_NUM}</p>
			<h1>票區選擇</h1>
			<h2>選擇票區</h2>
			<p>請在灰色空位上點選您要的票區</p>

			<div class="row">
				<div class="col-sm-5">
					<table class="table table-bordered">
						<tr>
							<td class="color">顏色</td>
							<td class="ticketarea">票區</td>
							<td class="tickettype">票種</td>
							<td class="seat">座位</td>
							<td class="price">票價</td>
							<td class="seatnum">剩餘票券</td>

						</tr>
						<tr class="trA">
							<td style="background-color: rgb(156, 194, 229)"></td>
							<td>A</td>
							<td>全票<br>半票</td>
							<td>50</td>
							<td >$1000<br>$2000</td>
							<td >45</td>

						</tr>
						<tr class="trB">
							<td style="background-color: rgb(48, 84, 150)"></td>
							<td>B</td>
							<td>全票<br>半票</td>
							<td>50</td>
							<td >$1000<br>$2000</td>
							<td >50</td>

						</tr>
						<tr class="trC">
							<td style="background-color: rgb(255, 192, 0)"></td>
							<td>C</td>
							<td>全票<br>半票</td>
							<td>64</td>
							<td >$1000<br>$2000</td>
							<td>64</td>
						</tr>
					</table>
				</div>
				<div class="col-sm-7">

					<a id="area1" class="area" href="<c:url value='/04/booking.ctrl'/>"></a>
       				<a id="area2" class="area" href="#"></a>
       				<a id="area3" class="area" href="#"></a>
					<img src="<c:url value='/images/04/seatmap2.jpg' />" border="0" usemap="#Map" alt="座位表" id="seatmap" class="map"   /> 
<!-- 					<map name="Map" id="Map"> -->
<!-- 						<area target="sssssss" shape="rect" coords="123,111,470,304" -->
<!-- 							href="sun.html" alt="淺藍色" /> -->
<!-- 						<area target="sssssss" shape="rect" coords="123,303,470,495" -->
<!-- 							href="" alt="深藍色" /> -->
<!-- 						<area target="" alt="area1" title="" href="" -->
<!-- 							coords="39,113,123,113,125,495,474,493,474,113,561,113,562,457,521,458,522,534,473,533,473,573,387,573,386,612,211,611,211,571,127,572,127,534,81,535,81,458,40,459" -->
<!-- 							shape="poly"> -->
<!-- 					</map> -->
				</div>
<!-- 				<br> <br> <input type="submit" id="submit" -->
<!-- 					class="genric-btn primary-border radius" value="下一步" -->
<!-- 					onclick="checknum()"> -->
<!-- 		</form> -->




		</body>
<script type="text/javascript">
$("#area1").mouseenter(function(){
	  $(".trA").css({"background-color":"#CC0000","opacity":"0.4"});
	}).mouseleave(function(){
	  $(".trA").css({"background-color":"","opacity":""});
	});;
$("#area2").mouseenter(function(){
	  $(".trB").css({"background-color":"#CC0000","opacity":"0.4"});
	}).mouseleave(function(){
	  $(".trB").css({"background-color":"","opacity":""});
	});;
$("#area3").mouseenter(function(){
	  $(".trC").css({"background-color":"#CC0000","opacity":"0.4"});
	}).mouseleave(function(){
	  $(".trC").css({"background-color":"","opacity":""});
	});;

</script>
</html>