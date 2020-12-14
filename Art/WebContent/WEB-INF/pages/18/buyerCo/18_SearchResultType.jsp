<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!-- start banner Area -->
<section class="banner-area relative" id="home">
	<div class="overlay overlay-bg"></div>
	<div class="container">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="about-content col-lg-12">
				<h1 class="text-white">尋找您想要的課程</h1>
				<p class="text-white link-nav">
					<a href="index.html">首頁</a> <span class="lnr lnr-arrow-right"></span>
					<a href="<c:url value='/18/cSelectAllFront.ctrl' />">課程總覽</a>
					<span class="lnr lnr-arrow-right"></span>
					<span>課程類型搜尋結果</span>
				</p>
			</div>
		</div>
	</div>
</section>
<!-- End banner Area -->


<div class="container" style="font-size: 18px">
<div style="margin: 20px">
<form action="<c:url value="/18/searchByWord.ctrl"/>">
	<p style="text-align: center; display: block; font-size:25px">
							課程名稱關鍵字查詢： <input type="text" name="searchWord" id=searchw> 
							<input type="submit" name="" value="送出" class="genric-btn success radius">
	</p>
</form>
</div>

<button id="flower" class="genric-btn primary-border radius">一鍵輸入欲查詢之關鍵字</button>

<div style="margin: 20px">
<form action="<c:url value="/18/searchByType.ctrl"/>">

<p style="font-size: 22px;">請選擇分類：
	<br>
	<button type="submit" name="searchType" class="genric-btn info circle" value="語文">語文</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="園藝">園藝</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="風俗信仰">風俗信仰</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="手工製作">手工製作</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="國畫書法">國畫書法</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="運動">運動</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="藝術鑑賞">藝術鑑賞</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="美術">美術</button>
	<button type="submit" name="searchType" class="genric-btn info circle" value="戲劇">戲劇</button>	
</p>			
</form>
</div>

<div style="text-align: center;">
				<form action="toCoCart.ctrl">
                <input type="hidden" name="method" value="order"/>
                <input type="submit" style="margin-left: 10px; font-size: 25px;"
							class="genric-btn danger radius large" name="check" value="結帳">
                </form>
			</div>


<table id="cTableFSRT" class="table table-bordered" width="100%"
	cellspacing="0">
	<thead>
		<tr>
			<th>課程編號</th>
			<th>課程名稱</th>
			<th>課程類型</th>
			<th>課程圖片</th>
			<th>剩餘名額</th>
			<th>課程詳細及購買</th>
			<th>查看次數</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="cSearchResultt" varStatus="stat" items="${psbt}">
			<tr>
				<td>${cSearchResultt.coId}</td>  <!--直接設定編號${stat.count}-->
				<td>${cSearchResultt.coTitle}</td>
				<td>${cSearchResultt.coAct_Type}</td>
				<td><img style='display: block; width: 320px; height: 180px;'
					src="data:image/jpg;base64, ${cSearchResultt.coAct_ImageStr}"></td>
				<td>${cSearchResultt.coNum}</td>
				<td><a href="<c:url value='/18/cCourseDetail.ctrl?coId=${cSearchResultt.coId}' /> ">
								<input class='genric-btn success-border radius' type='button' value='查看課程詳細' /></a></td>
				<td>${cSearchResultt.coHot}</td>
			</tr>
		</c:forEach>		
	</tbody>
</table>
</div>


<script>
	$(document).ready(function() {
		$('#cTableFSRT').DataTable({

		});
	});


	$("#flower").click(function(){
		$("#searchw").val("花");
	})
</script>