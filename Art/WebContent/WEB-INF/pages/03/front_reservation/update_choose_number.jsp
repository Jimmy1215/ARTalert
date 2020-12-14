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
							href="<c:url value='/03/front/reservation/myReservation.ctrl' />">
							食堂訂位紀錄</a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	<div class="container">
		<br>
		<div class='table-warning'>
			<h2 align="center" style="margin-top: 20px;">修改用餐人數</h2>
		</div>
		<br>
		<div class=content>
			<form method="post"
				action="<c:url value="/03/front/reservation/updateAmountExecute.ctrl"/>">
				<table id="03" class="display table table-hover table-blue">
					<thead>
						<tr class="head">
							<th colspan="4" style="font-size: larger;">您所預定的用餐時段
								&ensp;${moment}&ensp;目前還剩下${remainingNum}個座位</th>
						</tr>
						<tr>
							<th style="font-size: larger">&nbsp;</th>
						</tr>
						<tr class="head">
							<th colspan="4" class='table-warning'>
								<div style="font-size: larger;">修改用餐人數</div>
							</th>
						</tr>
					</thead>
					<tfoot></tfoot>
					<tbody>
						<tr>
							<td style="font-size: larger">請選擇大人人數:</td>
							<td>
								<div>
									<select id="newAdultsNum" name="newAdultsNum"
										required="required">
										<option value="1">1位大人</option>
										<option value="2">2位大人</option>
										<option value="3">3位大人</option>
										<option value="4">4位大人</option>
										<option value="5">5位大人</option>
									</select>
								</div>
							</td>
							<td style="font-size: larger">請選擇小孩人數:</td>
							<td>
								<div>
									<select id="newChildrenNum" name="newChildrenNum"
										required="required">
										<option value="0">0位小孩</option>
										<option value="1">1位小孩</option>
										<option value="2">2位小孩</option>
										<option value="3">3位小孩</option>
										<option value="4">4位小孩</option>
										<option value="5">5位小孩</option>
									</select>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div style="display: none">
					<!-- 訂位的資訊 -->
					<input type="hidden" name="reservationNo"
						value="${reservation.reservationNo}"> <input type="hidden"
						name="customerName" value="${reservation.customerName}"> <input
						type="hidden" name="customerPhone"
						value="${reservation.customerPhone}">
					<!-- ================ -->
					<input type="hidden" name="adultsNum"
						value="${reservation.adultsNum}"> <input type="hidden"
						name="childrenNum" value="${reservation.childrenNum}"> <input
						type="hidden" name="amount" value="${reservation.amount}">
					<input type="hidden" name="dateTime"
						value="${reservation.dateTime}"> <input type="hidden"
						name="time" value="${reservation.time}">
					<!-- ================ -->
					<input type="hidden" name="payment" value="${reservation.payment}">
					<input type="hidden" name="note" value="${reservation.note}">
					<input type="hidden" name="gender" value="${reservation.gender}">
					<input type="hidden" name="email" value="${reservation.email}">
					<input type="hidden" name="purpose" value="${reservation.purpose}">
					<!-- 剩餘座位數與中文用餐時間 -->
					<input type="hidden" name="moment" value="${moment}"> <input
						type="hidden" name="remainingNum" value="${remainingNum}">
				</div>
				<br>
				<div class="submitButton" align="center" style="font-size: larger">
					<input type="submit" name="submit" value="修改用餐人數">
				</div>
				<br>
			</form>
		</div>
	</div>
</body>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03').DataTable({});
	});
</script>