<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<br>
	<div class=title>
		<h2 align="center" style="margin-top: 20px;">得藝食堂 管理系統</h2>
	</div>
	<br>
	<div class="container">
		<div class=content>
			<form method="post"
				action="<c:url value = "/03/cms/restaurant/searchByYearMonth.ctrl"/>">
				<table id="03A" class="display table table-hover table-blue">
					<thead>
						<tr class="head">
							<th scope="col" colspan="5" style="font-size: larger;"><div
									align="center">
									<h4>訂位時間管理</h4>
								</div></th>
						</tr>
					</thead>
					<tfoot></tfoot>
					<tbody>
						<tr>
							<td style="font-size: larger">請選擇年份:</td>
							<td><select id="year" name="year" class="custom-select"
								required="required">
									<option selected value="2020">2020年</option>
									<option value="2021">2021年</option>
							</select></td>
							<td style="font-size: larger">請選擇月份:</td>
							<td><select id="month" name="month" class="custom-select"
								required="required">
									<option value="01">1月</option>
									<option value="02">2月</option>
									<option value="03">3月</option>
									<option value="04">4月</option>
									<option value="05">5月</option>
									<option value="06">6月</option>
									<option value="07">7月</option>
									<option value="08">8月</option>
									<option value="09">9月</option>
									<option value="10">10月</option>
									<option value="11">11月</option>
									<option selected value="12">12月</option>
							</select></td>
							<td><input id="btn" class='btn btn-outline-info'
								type="button" value="查詢"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
	<br>
	<div class=content id="result"></div>
</div>
<!-- ====================================================== -->
<script>
	$(document).ready(function() {
		$('#03A').DataTable({});
	});

	window.onload = function() {
		var btn = document.getElementById("btn"); //按鈕的事件處理函數

		btn.onclick = function() {
			//先清空之前查詢的資料

			var year = document.getElementById("year").value;
			var month = document.getElementById("month").value;
			var xhr = new XMLHttpRequest();

			xhr
					.open(
							"POST",
							"<c:url value='/03/cms/restaurant/searchByYearMonth.ctrl' />",
							true);

			xhr.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xhr.send("year=" + year + "&month=" + month);

			xhr.onreadystatechange = function() {
				// 向伺服器提出的請求已經收到回應
				if (xhr.readyState == 4 && xhr.status == 200) {
					// status: HTTP通訊協定的狀態碼伺服器，
					// 200表示Server成功的處理請求
					// getResponseHeader: 取得回應內容的MIME Type

					var restaurantList = JSON.parse(xhr.responseText);

					// 假如有預約資料
					if (restaurantList.length > 0) {

						// 插入該月訂位時間表已存在
						var content = "<div class='submitButton' align='center' style='font-size: larger; font-weight:bold;'>"
								+ month + "月訂位時間表已存在</div><br>";

						// 插入詳情(X)、更新與刪除的按鈕表單
						content += "<div class='submitButton' align='left' style='font-size: larger;'>";

						// 插入排版用的TABLE
						content += "<table><tr>";

						// 排版用的td
						content += "<td>&emsp;</td>";
						
						// 插入更新的 From 表單
						content += "<td><div><form method='post' action='<c:url value='/03/cms/restaurant/updateRestaurantConfirm.ctrl'/>'> ";
						// 預約編號的迴圈
						for (var i = 0; i < restaurantList.length; i++) {
							content += "<div style='display: none'><Input type='hidden' name='restaurantNo' value=" + restaurantList[i].restaurantNo +"></div>";
						}
						content += "<button name='updateButton' type='submit' class='btn btn-outline-info'>修改"
								+ month
								+ "月訂位時間表</button>"
								+ "</form></div></td>";

						// 排版用的td
						content += "<td>&nbsp;&nbsp;</td>";

						// 插入刪除的 From 表單
						content += "<td><div><form method='post' action='<c:url value='/03/cms/restaurant/deleteRestaurant.ctrl'/>'> ";
						// 預約編號的迴圈
						for (var i = 0; i < restaurantList.length; i++) {
							content += "<div style='display: none'><Input type='hidden' name='restaurantNo' value=" + restaurantList[i].restaurantNo +"></div>";
						}
						content += "<button name='deleteButton' type='submit' class='btn btn-outline-info'>刪除"
								+ month
								+ "月訂位時間表</button>"
								+ "</form></div></td></tr></table>"
								+ "</div><br>";

						// 插入查詢結果 table
						content += "<table id='03B' class='display table table-bordered table-hover table-blue'>";
						content += "<thead><tr><th class='table-warning'>日期</th><th class='table-success'>當日是否營業</th>";
						content += "<th class='table-danger'>線上訂位人數上限</th><th class='table-info'>可訂位時段</th></tr></thead><tbody>";

						// 迴圈印出預約資料
						for (var i = 0; i < restaurantList.length; i++) {
							if (restaurantList[i].open == 0) {
								var openMsg = "店休日"
							} else {
								var openMsg = "營業日";
							}

							content += "<tr><td>" + month + "/"
									+ restaurantList[i].day + "</td>" + "<td>"
									+ openMsg + "</td>" + "<td>"
									+ restaurantList[i].maximum + "人</td><td>";

							if (restaurantList[i].h09 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>09:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>09:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h10 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>10:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>10:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h11 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>11:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>11:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h12 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>12:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>12:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h13 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>13:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>13:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h14 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>14:00</label><br>";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>14:00</label><br>";
							}
							if (restaurantList[i].h15 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>15:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>15:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h16 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>16:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>16:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h17 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>17:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>17:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h18 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>18:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>18:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h19 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>19:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>19:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h20 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>20:00</label>&nbsp;&nbsp;";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>20:00</label>&nbsp;&nbsp;";
							}
							if (restaurantList[i].h21 == -1) {
								content += "<input type='checkbox' >"
										+ "<label>21:00</label>";
							} else {
								content += "<input type='checkbox' checked>"
										+ "<label>21:00</label>";
							}

						}
						content += "</td></tr></tbody></table><br>";

						var result = document.getElementById("result");
						result.innerHTML = content;
					} else {
						// 假如沒有該月訂位時間表
						// 新增的 From

						var content = "<div class='submitButton' align='center' style='font-size: larger; font-weight:bold;'>查無"
								+ month + "月訂位時間表</div><br>"
						content += "<div><form method='post' action='<c:url value='/03/cms/restaurant/createRestaurantConfirm.ctrl'/>' > "
								+ "<div class='submitButton' align='center' style='font-size: larger'> "
								+ "<div style='display: none'>"
								+ "<Input type='hidden' name='year' value=" + year +">"
								+ "<Input type='hidden' name='month' value=" + month +">"
								+ "</div>"
								+ "<button type='submit' class='btn btn-outline-info'>新增"
								+ month
								+ "月訂位時間表</button>"
								+ "</div></form></div><br><br>";
						var result = document.getElementById("result");
						result.innerHTML = content;
					}
				}
			}
		}
	}

	// 	$("#result").change(function() {
	// 		$('#03B').DataTable({});
	// 	});
</script>