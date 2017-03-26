$(function () {
	getDashBoardStats();
})

function getDashBoardStats(){
	 showLoader();
	 $.ajax({
         type: "GET",
         contentType: 'application/json; charset=utf-8',
         dataType: 'json',
         async: false, 
         url: getApi(Urls.GET_DASHBOARD_STATS),
     }).done(function(response) {
    	 hideLoader();
    	 $(".vendors").html(response.resp.vendors);
    	 $(".users").html(response.resp.users);
    	 $(".articles").html(response.resp.articles);
     });
}