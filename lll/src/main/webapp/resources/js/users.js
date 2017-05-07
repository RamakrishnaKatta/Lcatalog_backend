$(document).ready(function(){
	loadUsers();
	loadVendorsDropDown();
	//alert("Haiiii")
})

app.controller('userSearch',function($scope,$http){
	$http.get(getApi(Urls.GET_ALL_VENDORS))
    .then(function(response) {
    	console.log(response.data);
        $scope.vendors = response.data.resp;
    },httpFailure);
})

function loadUsers(){
	showLoader(); 
    $.ajax({
        type: "GET",
        async:false,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.GET_ALL_USERS),
    })
    .done(function(response){
    hideLoader();
    console.log(response);
    
    $('#myTable').DataTable({  
        "data": response.resp,
         "order": [[ 0, "desc" ]],   
         "destroy": true,
         "columns": [
             {
                 "sTitle": "Id",
                 "mData": "id",
                 "visible":false
             },{
                 "sTitle": "Name",
                 "mData": "name"
             },{
                 "sTitle": "Role",
                 "mData": "type"
             },{
                 "sTitle": "Email-Id",
                 "mData": "email"
             },{
                 "sTitle": "Mobile No",
                 "mData": "mobileNo"
             },{
                 "sTitle": "Address",
                 "mData": "address"
             },{
                 "sTitle": "Vendor-Id",
                 "mData": "vendorId"
             },{
                 "sTitle": "Other details",
                 "mData": "otherDetails"
             },{
                     "sTitle": "Action",
                     "mData": "id",
                     "mRender": function(data, type, row) {
                        return "<button class= 'glyphicon glyphicon-trash delBtn btn btn-default' title='Delete Route'><button class='glyphicon glyphicon-zoom-in viewResult btn btn-default' title='View Results'></button>";
                     }
                } ]
         })
    
    })
}

$(".showModal").click(function(){
	$("#myModal").modal();
	$(".edit").hide();
})

$(".addAdmin").click(function(){
	var  name=$("#name").val();
	var address= $("#address").val();
	var password=$("#pass2").val();
	var vendorId=$("#vendorId").val();
	var email=$("#email").val();
	var pass1=$("#pass1").val();
	var pass2=$("#pass2").val();

	var phNo=$("#phNo").val();
	var otherDetails=$("#otherDetails").val();
	
	if(pass1===pass2){
		var req={"request":{"email":email,"vendorId":vendorId,"name":name,"type":"ADMIN","address":address,"password":pass2,"mobileNo":phNo,"otherDetails":otherDetails}}
		addAdmin(req)
	}else{
		alert("Password is not matching");
	}
	
	
})

function addAdmin(req){
	console.log(JSON.stringify(req));
	$.ajax({
        type: "POST",
        data: JSON.stringify(req),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.ADD_ADMIN),
    })
    .done(function(response){
    	console.log(response);
    	if(response.code=="300"){
    		alert("Admin is already exists for the vendor");
    		location.reload();
    	}else if(response.code=="200"){
    		alert("Admin Registered Succesfully");
    		location.reload();
    	}else{
    		alert("Oops something went wrong");
    		location.reload();
    	}
    	
    })
	

}


