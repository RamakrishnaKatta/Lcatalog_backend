// Get Current Url and Path 
window.location.origin = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port: '');

var host =window.location.origin;
var path ="lll";

var address = host + "/" + path;

var Urls={
		
		//DASHBOARD
		GET_DASHBOARD_STATS:"dashboard/get_dashboard_stats",
		
		//VENDORS
		GET_ALL_VENDORS:"web/vendor/all",
		
		//USERS
		GET_ALL_USERS:"web/user/all",
			
	    //USERS
		GET_ALL_ARTICLES:"web/article/all",
		
		//GET ALL VENDORS REQUEST
		GET_ALL_VENDORS_REQ:"app/vendor/getVendorRequests"
}

function getApi(name){
	return address+"/"+name;
}






/****************** Show loader on page **********************/
function showLoader() {
    $(".fader").show();
    $(".loader").show();
}

/****************** Hide loader on page **********************/
function hideLoader() {
    $(".fader").hide();
    $(".loader").hide();
}


