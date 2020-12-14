<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<head>
<script>
$(document).ready( function () {
    $('#table_11').DataTable({
    	language: {
    		search: "在表格中搜尋：",
    		lengthMenu:"每頁顯示 _MENU_ 筆資料",
    		zeroRecords: "没有符合的结果",
    		info: "顯示第 _START_ 至 _END_ 項结果，共 _TOTAL_ 項",
    		infoEmpty: "顯示第 0 至 0 項结果，共 0 項",
    		paginate: {
                first: "首頁",
                previous: "上一頁",
                next: "下一頁",
                last: "末頁"
            },
            infoFiltered: "(已比對 _MAX_ 項結果)",
    	
    	}
        	
    } );
} );
</script>

</head>
 
<!-- table -->

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
<div style="padding: 50px;">
	<h1 align="center">查詢結果</h1>
	<table id="table_11" class="display" align="center">
		<thead>
			<tr>
				<th style="text-align: center;">藝名</th>
				<th style="text-align: center;">表演地區</th>
				<th style="text-align: center;">表演項目</th>
				<th style="text-align: center;">分類</th>
				<th style="text-align: center;">動作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reUserView" varStatus="stat" items="${reUBeanList_SA}">
			<tr>
				<td style="text-align: center;">${reUserView.name_SA }</td>
				<td style="text-align: center;">${reUserView.country_SA }</td>
				<td style="text-align: center;">${reUserView.theme_SA }</td>
				<td style="text-align: center;">${reUserView.classification_SA }</td>
				<td style="text-align: center;">
					<form action="ToWeb.ctrl">
						<input type="hidden" value="${reUserView.id_SA}"  name="id_SA"/>
						<input type="submit" value="了解更多" id="aaa"/>
					</form>
					<form action="ToDonate.ctrl">
						<input type="hidden" value="${reUserView.id_SA}"  name="id_SA"/>
						<input type="submit" value="支持他" id="bbb"/>
					</form>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>