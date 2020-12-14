<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<head>
<style>
	span{
	}
	body {
/* 		background-color: rgb(204,204,137); */
	}
	select {
		text-align: center;
	}
</style>
 <script>
$(document).ready( function () {
    $('#events').section({
    	language: {
    		zeroRecords: "没有符合的结果",
    		paginate: {
                first: "首頁",
                previous: "上一頁",
                next: "下一頁",
                last: "末頁"
            }
    	}
    } );
} );
</script>
</head>

<!-- 黑底起點 -->
<section class="banner-area relative" id="home">	
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">
					街頭藝人一覽
				</h1>	
				<p class="text-white link-nav"><a href="index.html">Home </a>  <span class="lnr lnr-arrow-right"></span>  <a href='<c:url value="/userStreetArtistPage.ctrl"/>'> 總覽</a></p>
			</div>											
		</div>
	</div>
</section>
<!-- 黑底終點 -->
<div>
<form action="searchSA2.ctrl" method="POST">
	<span style="text-align: center;display: block;">
		依樂器或分類查詢：
		<input type="text" name="word">
		<input type="submit" name="submit" value="送出">
	</span>
</form>
</div>

<div>
<form action="searchSA3.ctrl" method="POST">
	<span style="text-align: center;display: block;">
		<label>地區：
		<select name="country" style="align:center">
			<option value="*">--</option>
			<option value="臺北市">臺北市</option>
			<option value="新北市">新北市</option>
			<option value="桃園市">桃園市</option>
			<option value="臺中市">臺中市</option>
			<option value="臺南市">臺南市</option>
			<option value="高雄市">高雄市</option>
			<option value="新竹縣">新竹縣</option>
			<option value="苗栗縣">苗栗縣</option>
			<option value="彰化縣">彰化縣</option>
			<option value="南投縣">南投縣</option>
			<option value="雲林縣">雲林縣</option>
			<option value="嘉義縣">嘉義縣</option>
			<option value="屏東縣">屏東縣</option>
			<option value="宜蘭縣">宜蘭縣</option>
			<option value="花蓮縣">花蓮縣</option>
			<option value="臺東縣">臺東縣</option>
			<option value="澎湖縣">澎湖縣</option>
			<option value="金門縣">金門縣</option>
			<option value="連江縣">連江縣</option>
		</select>
		</label>
	</span>
	<span style="text-align: center;display: block;">
		<label>表演分類：
		<select name="classification">
			<option value="*">--</option>
			<option value="表演藝術">表演藝術</option>
			<option value="創意工藝">創意工藝</option>
			<option value="視覺藝術">視覺藝術</option>
		</select>
		</label>
	</span>
	<span style="text-align: center;display: block;">
		表演項目：
		<input type="text" name="theme">
	</span>
	<span style="text-align: center;display: block;">
		<input type="submit" name="submit" value="送出查詢">
	</span>
</form>
</div>
 <section class="upcoming-event-area section-gap" id="events">
 	<div class="container">
 		<div class="row">
 		<c:forEach var="userView" varStatus="stat" items="${BeanList_SA}">
 			<c:choose>
 				<c:when test="${userView.id_SA %2!=0}">
		 			<div class="col-lg-6 event-left" style="border-bottom: rgb(100,100,100) 1px solid; margin: auto; padding: 10px">
			 			<div class="single-events">
							<img class="img-fluid" src="data:image/jpg;base64, ${userView.pic2_SA}" alt="" width=450px height=450px;>
							<a href='<c:url value="/ToWeb.ctrl?id_SA=${userView.id_SA}"/>'><h2>${userView.name_SA }</h2></a>
							<h4>經常出沒於   ${userView.country_SA }</h4>
							<p>
								會用一些看起來很帥的表演的一群人
							</p>
							<a href='<c:url value="/ToWeb.ctrl?id_SA=${userView.id_SA}"/>' class="primary-btn text-uppercase">View Details</a>
						</div>
					</div>
 				</c:when>
 				<c:otherwise>
					<div class="col-lg-6 event-right" style="border-bottom: rgb(100,100,100) 1px solid; margin: 0px; padding: 10px">
						<div class="single-events">
							<a href='<c:url value="/ToWeb.ctrl?id_SA=${userView.id_SA}"/>'><h2>${userView.name_SA }</h2></a>
							<h4>經常出沒於   ${userView.country_SA }</h4>
							<p>
								這不是看起來帥，是真的很帥
							</p>
							<a href='<c:url value="/ToWeb.ctrl?id_SA=${userView.id_SA}"/>' class="primary-btn text-uppercase">View Details</a>
							<img class="img-fluid" src="data:image/jpg;base64, ${userView.pic2_SA}" alt="" width=450px height=450px;>
						</div>
					</div>
 				</c:otherwise>
 			</c:choose>
		</c:forEach>
		
		<nav aria-label="Page navigation example" style="margin: auto;">
			<ul style="margin: auto;" class="pagination">
				<li style="margin: auto;" class="page-item">
					<c:if test="${PageMum_SA>1 }">
						<a class="page-link" href='<c:url value="/userStreetArtistPage.ctrl?page=${PageMum_SA-1 }&query=${query }"/>'>
							<span aria-hidden="true">
								&laquo;
							</span>
						</a>
					</c:if>
					<c:if test="${PageMum_SA >= 1 && PageMum_SA <= 8 }">
						<c:forEach var="first8Pages" items="${first8Pages}">
							<li class="page-item">
								<a class="page-link" href='<c:url value="/userStreetArtistPage.ctrl?page=${first8Pages}&query=${query}" />' >
									${first8Pages}
								</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${PageMum_SA >= 9 && PageMum_SA <= totalPages_SA-8 }">
						<c:forEach var="middlePages" items="${middlePages}">
							<li class="page-item">
								<a class="page-link" href='<c:url value="/userStreetArtistPage.ctrl?page=${middlePages}&query=${query}" />' >
									${middlePages}
								</a>
							</li>
						</c:forEach>
					</c:if>
					<c:if test="${PageMum_SA >= totalPages_SA-7 && PageMum_SA <= totalPages_SA }">
						<c:forEach var="last8Pages" items="${last8Pages}">
							<li class="page-item">
								<a class="page-link" href='<c:url value="/userStreetArtistPage.ctrl?page=${last8Pages}&query=${query}" />' >
									${last8Pages}
								</a>
							</li>
						</c:forEach>
					</c:if>
					<!-- 
					<c:forEach var="page" items="${allPages}">
						<li class="page-item">
							<a class="page-link" href='<c:url value="/userStreetArtistPage.ctrl?page=${page}&query=${query}" />' >
								${page}
							</a>
						</li>
					</c:forEach>
					 -->
					<c:if test="${PageMum_SA != totalPages_SA}">
						<li class="page-item">
							<a class="page-link" href="<c:url value="/userStreetArtistPage.ctrl?page=${PageMum_SA+1 }&query=${query }"/>">
								<span aria-hidden="true">
									&raquo;
								</span>
							</a>
						</li>
					</c:if>
				</li>
			</ul>
		</nav>
 		</div>
 	</div>
</section>

<script>
$(function(){
    $("#queryType").change(function() {
        var query = $("#queryType").val();
    	window.location.href="<c:url value='/userStreetArtistPage.ctrl?query="+query+"'/>" ;   
    })
})
</script>