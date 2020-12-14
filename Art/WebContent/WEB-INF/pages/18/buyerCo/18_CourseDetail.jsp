<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">課程個別詳細介紹</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a> <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a> <span
						class="lnr lnr-arrow-right"></span> 
					<span>${cfd.coTitle}</span>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->

<div class="container" style="font-size: 18px">
<div>
<form action="<c:url value="/18/CoSubmit.ctrl"/>">
	<div>
		<img style='display: block; width: 640px; height: 360px; padding-top:20px;'src="data:image/jpg;base64, ${cfd.coAct_ImageStr}">
	</div>
<table>
<thead><tr><th style="padding-top:20px;"><font size="6" color="blue"><b>NO.${cfd.coId}    ${cfd.coTitle}</b></font></th></tr></thead>
<tbody>
<tr><td style="padding-top:20px;"><font style="text-decoration:underline">類別：${cfd.coAct_Type}</font></td></tr>
<tr>
<td style="padding-top:20px;">課程售價：${cfd.coPrice}</td></tr>
<tr><td style="padding-top:20px;">剩餘名額：${cfd.coNum}</td></tr>
<tr><td style="padding-top:20px;">請選擇數量<input type="number" min="1" max="${cfd.coNum}" name="orderNum" value="1"></td></tr>
<tr><td style="padding-top:20px;">上課地點：${cfd.coAct_Location} ${cfd.coLocation_Name}</td></tr>
<tr><td style="padding-top:20px;">請選擇開課日期<select name="orderAct_Date">
                    <option disabled>開課日期</option>
					<option>${cfd.coAct_Date}</option>
					<option>${cfd.coEnd_Date}</option>
                    </select> </td></tr>
<tr><td style="padding-top:5px;">開始時間：${cfd.coAct_Date} ${cfd.coAct_Time}</td></tr>
<tr><td style="padding-top:5px;">結束時間：${cfd.coEnd_Date} ${cfd.coEnd_Time}</td></tr>
<tr><td style="padding-top:20px;">課程簡介：<br>
${cfd.coAct_Description}</td></tr>
<tr><td style="padding-top:20px;">點擊次數：${cfd.coHot}</td></tr>
</tbody></table>

		<input type="hidden" name="coId" value="${cfd.coId}"/>
		<input type="hidden" name="orderTitle" value="${cfd.coTitle}"/>
		<input type="hidden" name="orderPrice" value="${cfd.coPrice}"/>
		<!--<input type="hidden" name="orderAct_Date" value="${cfd.coAct_Date}"/>-->
		<input type="hidden" name="orderAct_Time" value="${cfd.coAct_Time}"/>
		<!-- <input type="hidden" name="coAct_ImageStr" value="${cfd.coAct_ImageStr}"/>-->
		<div style="padding-top:20px; font-size: 25px;"><button type="submit" name="coTitle" class="genric-btn danger radius" value="${cfd.coTitle}">放入購物車</button></div>
</form>
<div style="padding-top:20px; font-size: 15px;"><a href="<c:url value='/18/cSelectAllFront.ctrl' /> ">
	    <button class='btn btn-info radius'>返回課程總覽</button></a></div>
</div>
</div>				
					