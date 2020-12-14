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
	font-weight: 800;
	color: rgb(11, 52, 110);
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
				action="<c:url value = "/03/front/reservation/createReservation.ctrl"/>">
				<table id="03A" class="display table table-hover table-blue">
					<thead>
					</thead>
					<tfoot></tfoot>
					<tbody>
						<tr>
							<td class='table-warning'><div class="rs-symbol-color"
									style="font-size: larger; font-weight: bold;">訂位人姓名</div></td>
						</tr>
						<tr>
							<td><input type="text" name="customerName"
								value="${reservation.customerName}" required="required"
								placeholder="請輸入姓名"></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td class='table-info'>
								<div class="rs-symbol-color"
									style="font-size: larger; font-weight: bold;">訂位人稱呼</div>
							</td>
						</tr>
						<tr>
							<td><c:choose>
									<c:when test="${reservation.gender == '0'}">
										<div class="primary-radio">
											<input type="radio" name="gender" value="1"> <label>先生</label>
											<input type="radio" name="gender" value="0" checked>
											<label>小姐</label> <input type="radio" name="gender" value="2">
											<label>其他</label>
										</div>
									</c:when>
									<c:when test="${reservation.gender == '2'}">
										<div class="primary-radio">
											<input type="radio" name="gender" value="1"> <label>先生</label>
											<input type="radio" name="gender" value="0"> <label>小姐</label>
											<input type="radio" name="gender" value="2" checked>
											<label>其他</label>
										</div>
									</c:when>
									<c:otherwise>
										<div class="primary-radio">
											<input type="radio" name="gender" value="1" checked>
											<label>先生</label> <input type="radio" name="gender" value="0">
											<label>小姐</label> <input type="radio" name="gender" value="2">
											<label>其他</label>
										</div>
									</c:otherwise>
								</c:choose></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td class='table-success'>
								<div style="font-size: larger; font-weight: bold;"
									class="rs-symbol-color">連絡電話</div>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="customerPhone"
								value="${reservation.customerPhone}" required="required"
								placeholder="請輸入手機號碼"></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td class='table-danger'>
								<div style="font-size: larger; font-weight: bold;">Email</div>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="email"
								value="${reservation.email}" required="required"
								placeholder="請輸入 Email"></td>
						</tr>
						<!-- # ================== -->
						<tr>
							<td class='table-warning'>
								<div style="font-size: larger; font-weight: bold;">用餐目的</div>
						</tr>
						<!-- # 用餐目的回傳值處理 -->
						<c:if test="${reservation.purpose == '1'}">
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="1" checked>
										<label>不填寫</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="2"> <label>約會</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="3"> <label>慶生</label>
									</div></td>
							</tr>
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="4"> <label>家庭聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="5"> <label>朋友聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="6"> <label>商務聚餐</label>
									</div></td>
							</tr>
						</c:if>
						<!-- # purpose == 2 -->
						<c:if test="${reservation.purpose == '2'}">
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="1"> <label>不填寫</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="2" checked>
										<label>約會</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="3"> <label>慶生</label>
									</div></td>
							</tr>
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="4"> <label>家庭聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="5"> <label>朋友聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="6"> <label>商務聚餐</label>
									</div></td>
							</tr>
						</c:if>
						<!-- # purpose == 3 -->
						<c:if test="${reservation.purpose == '3'}">
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="1"> <label>不填寫</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="2"> <label>約會</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="3" checked>
										<label>慶生</label>
									</div></td>
							</tr>
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="4"> <label>家庭聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="5"> <label>朋友聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="6"> <label>商務聚餐</label>
									</div></td>
							</tr>
						</c:if>
						<!-- # purpose == 4 -->
						<c:if test="${reservation.purpose == '4'}">
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="1"> <label>不填寫</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="2"> <label>約會</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="3"> <label>慶生</label>
									</div></td>
							</tr>
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="4" checked>
										<label>家庭聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="5"> <label>朋友聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="6"> <label>商務聚餐</label>
									</div></td>
							</tr>
						</c:if>
						<!-- # purpose == 5 -->
						<c:if test="${reservation.purpose == '5'}">
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="1"> <label>不填寫</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="2"> <label>約會</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="3"> <label>慶生</label>
									</div></td>
							</tr>
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="4"> <label>家庭聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="5" checked>
										<label>朋友聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="6"> <label>商務聚餐</label>
									</div></td>
							</tr>
						</c:if>
						<!-- # purpose == 6 -->
						<c:if test="${reservation.purpose == '6'}">
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="1"> <label>不填寫</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="2"> <label>約會</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="3"> <label>慶生</label>
									</div></td>
							</tr>
							<tr>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="4"> <label>家庭聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="5"> <label>朋友聚餐</label>
									</div></td>
								<td><div class="primary-radio">
										<input type="radio" name="purpose" value="6" checked>
										<label>商務聚餐</label>
									</div></td>
							</tr>
						</c:if>
						<!-- # ================== -->
						<tr>
							<td class='table-info'>
								<div style="font-size: larger; font-weight: bold;">備註</div>
						</tr>
						<tr>
							<td><textarea name="note"
									placeholder="有任何特殊要求嗎?（例如兒童座椅、食物過敏或長者行動不便) 這些都可以告訴我們）">${reservation.note}</textarea></td>
						</tr>
						<!-- # ================== -->
					</tbody>
				</table>
				<!-- ====================================================== -->
				<br>
				<div class="submitButton" align="center" style="font-size: larger">
					<input type="submit" name="submit" value="完成訂位">
				</div>
				<div style="display: none">
					<input type="hidden" name="reservationNo" value="${reservation.reservationNo}">
				</div>
				<br>
			</form>
		</div>
	</div>
</body>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03A').DataTable({});
	});
</script>

</html>