$(document).ready(function () {
	 $.ajax({
	      type:"get",
	      url:"/Art/14/barChart",    
	      contentType: "application/json",
	      dataType:"json",
	      success:function(value){
//             alert(value);
	        lineChartData = value; //parse the data into JSON

	        var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['售票系統', '得藝洋行', '得藝食堂', '路線規劃', '藝術課程', '街頭藝人'],
	        datasets: [{
	            label: '點擊率 (次)',
// 	            data: [120, 190, 30, 50, 20, 30],
				 data: lineChartData,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});





	      	
	      },
	      error:function(){
	          alert("整組壞光光");
	      }
	    });

	
})


//這是註解嗎
//這是本日的設置

$("#barNow").click(function(event){
	event.preventDefault();

  $.ajax({
	      type:"get",
	      url:"/Art/14/barChart",    
	      contentType: "application/json",
	      dataType:"json",
	      success:function(value){
//             alert(value);
	        lineChartData = value; //parse the data into JSON

	        var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['售票系統', '得藝洋行', '得藝食堂', '路線規劃', '藝術課程', '街頭藝人'],
	        datasets: [{
	            label: '點擊率 (次)',
// 	            data: [120, 190, 30, 50, 20, 30],
				 data: lineChartData,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});

	      },
	      error:function(){
	          alert("整組壞光光");
	      }
	    });

})


//本月的設置
$("#barMonth").click(function(event){
	event.preventDefault();

  $.ajax({
	      type:"get",
	      url:"/Art/14/barChart",    
	      contentType: "application/json",
	      dataType:"json",
	      success:function(value){
//             alert(value);
	        lineChartData = value; //parse the data into JSON

	        var ctx = document.getElementById('myChart').getContext('2d');
			var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['售票系統', '得藝洋行', '得藝食堂', '路線規劃', '藝術課程', '街頭藝人'],
	        datasets: [{
	            label: '點擊率 (次)',
 	            data: [190, 150, 130, 150, 120, 130],
//				 data: lineChartData,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});

	      },
	      error:function(){
	          alert("整組壞光光");
	      }
	    });

})



//本年度的設置
$("#barYear").click(function(event){
		event.preventDefault();


	    var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['售票系統', '得藝洋行', '得藝食堂', '路線規劃', '藝術課程', '街頭藝人'],
	        datasets: [{
	            label: '點擊率 (次)',
 	            data: [1940, 1720, 1737, 1820, 1720, 1845],
//				 data: lineChartData,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});

	

})