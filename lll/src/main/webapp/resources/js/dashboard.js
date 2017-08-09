var vendors;
var articles;
var users;
var requests;
$(document).ready(function(){
	
	getStats();
	$(".vendors").text(vendors);
	$(".articles").text(articles);
	$(".users").text(users);
	$(".reqs").text(requests);
	
	var options1 = {
			title: {
				text: "LLL Analytics"
			},
	                animationEnabled: true,
			data: [
			{
				name: "Vendors",
		        showInLegend: true,
				dataPoints: [
					{ y: vendors }
				]
			},
			{
				name: "Articles",
		        showInLegend: true,
				dataPoints: [
					{ y: articles }
				]
			},
			{
				name: "Users",
		        showInLegend: true,
				dataPoints: [
					{ y: users }
				]
			},
			{
				name: "Requests",
		        showInLegend: true,
				dataPoints: [
					{ y: requests }
				]
			}
			]
		};

		$("#resizable").resizable({
			create: function (event, ui) {
				$("#chartContainer1").CanvasJSChart(options1);
			},
			resize: function (event, ui) {
				$("#chartContainer1").CanvasJSChart().render();
			}
		});
})


function getStats(){
	$.ajax({
        type: "GET",
        async:false,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.GET_DASHBOARD_STATS),
    })
    .done(function(response){
    hideLoader();
    console.log(response);
    if(response.code==200){
    	vendors = response.resp.vendors;
    	articles = response.resp.articles;
    	users = response.resp.users;
    	requests = response.resp.vendorReqs;
     }
    })
}




