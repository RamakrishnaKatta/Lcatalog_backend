$(document).ready(function(){
	loadUsers();
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