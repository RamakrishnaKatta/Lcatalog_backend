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
		GET_ALL_ARTICLES:"web/article/web/all",
		
		//GET ALL VENDORS REQUEST
		GET_ALL_VENDORS_REQ:"app/vendor/getVendorRequests",
		
		//ADD VENDOR
		ADD_VENDOR:"web/vendor/vendor_reg",
		
		//UPDATE VENDOR
		UPDATE_VENDOR:"web/vendor/update",
		
		//ADD ADMIN
		ADD_ADMIN:"web/user/register",
		
		//UPDATE ADMIN
		UPDATE_ADMIN:"web/user/update",
		
		//DEL USER
		DEL_USER:"web/user/delete?id=",
		
		//ADD ARTICLE
		ADD_ARTICLE:"web/article/add_article",
		
		//GET VENDOR NAMES
		GET_VENDOR_ID:"",
		
		//UPDATE ARTICLE
		UPDATE_ARTICLE:"web/article/update",
		
		//DEL VENDOR
		DEL_VENDOR:"web/vendor/delete?id=",
		
		//ADD NOTIFICATION
		SEND_NOTIFICATION:"app/notify/send",
		
		//GET NOTIFICATION
		GET_NOTIFICATION:"app/notify/get_all"
}

function getApi(name){
	return address+"/"+name;
}


/****************** Angular Module Initialisation **********************/

//var app=angular.module("lll",[]);

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

function loadVendorsDropDown(){
	showLoader(); 
    $.ajax({
        type: "GET",
        async:false,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.GET_ALL_VENDORS),
    })
    .done(function(response){
    hideLoader();
    console.log(response);
    if(response.code==200){
        var options="<option value=null selected='selected'>--Select Vendor Id--</option>";
        for(var i=0;i<(response.resp).length;i++){
        var option="<option value='"+response.resp[i].id+"'>"+response.resp[i].name+"</option>";
        options=options+option;
        }
        $("#vendorId").append(options);
        $("#vendorIdU").append(options);
        $("#vendorSearch").append(options);
    }
    })
}


$("#vendorId").change(function(){
 	var vendorId=$("#vendorId").val();
    $("#uploadedUserId").val(ParseInt(vendorId)+1);
})

function httpFailure(){
	alert("Opps Server is not responding");
}


