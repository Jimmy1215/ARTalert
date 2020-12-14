<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container">
<div>
<img style='display: block; width: 640px; height: 360px;'src="data:image/jpg;base64, ${cfd.coAct_ImageStr}">
</div>
<table>
<thead><tr><th><font size="6" color="blue"><b>NO.${cfd.coId}    ${cfd.coTitle}</b></font></th></tr></thead>
<tbody>
<%-- <tr><td>NO. ${cfd.coId}   ${cfd.coTitle}</td></tr> --%>
<tr><td><font style="text-decoration:underline">類別：${cfd.coAct_Type}</font></td></tr>
<tr><td style="padding-top:20px;">課程售價：${cfd.coPrice}</td></tr>
<tr><td style="padding-top:20px;">剩餘名額：${cfd.coNum}</td></tr>
<tr><td style="padding-top:20px;">上課地點：${cfd.coAct_Location} ${cfd.coLocation_Name}</td></tr>
<tr><td style="padding-top:5px;">開始時間：${cfd.coAct_Date} ${cfd.coAct_Time}</td></tr>
<tr><td>結束時間：${cfd.coEnd_Date} ${cfd.coEnd_Time}</td></tr>
<tr><td style="padding-top:20px;">課程簡介：<br>
${cfd.coAct_Description}</td></tr>
<tr><td style="padding-top:20px;">點擊次數：${cfd.coHot}</td></tr>
</tbody>
</table>
<br>
<div><a href="<c:url value='/18/cSelectAll.ctrl' />"><button class='btn btn-info'>回課程總覽</button></a></div>
</div>	
				  
					
<script type="text/javascript">
function delSA(coId){
	swal("提示","您確定要刪除？", "warning",{
	    buttons: {
	      danger: {
	          text: "是"
	        },
	      "否": true,
	    },
	  })

		.then((value) => {
		switch (value) {
		case "danger":
	    	swal("提示","刪除成功", "success")
	    	setTimeout(function(){window.location="<c:url value='/18/cDelete.ctrl?coId="+coId+"'/>" ; },2000);
	        break;
	      case "不是":
	        swal("提示","取消刪除", "info");
	        break;
	      default:
	    	  swal("提示","商品未刪除", "info");
	        break;
		}
		});
};
</script>				
					
		