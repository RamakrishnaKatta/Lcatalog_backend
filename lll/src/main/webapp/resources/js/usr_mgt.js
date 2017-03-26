$(function() {
   loadUsers();
   createRole();
});

$(".showModal").click(function(){
	   $("#registerModal").modal();
	   appendStates(-1);
	})
	
$("#select_state").change(function(){
	var stateId=$("#select_state").val();
	appendCities(stateId);
})

$("#select_city").change(function(){
	var cityId=$("#select_city").val();
	appendLocalities(cityId)
})

$("#select_locality").change(function(){
	var localityId=$("#select_locality").val();
	appendSubLocalities(localityId)
})


$("#subLocalitySearch").click(function(){
	var localityId=$("#locality").val();
	loadSubLocalities(localityId);
})	
	
	
$(".add").click(function(){
	
	var societyUserId=new Date().getTime()%10000;
	var personalProfileId=new Date().getTime()%100;
	var profileFirstName=$("#firstName").val();
	var profileLastName=$("#lastName").val();
	var phone=$("#phone").val();
	var emailId=$("#emailId").val();
	var gender=$("#gender").val();
	var bloodGroup=$("#bloodGroup").val();
	var roles=$("#roles").val();
					
	var data={	"societyUserId":societyUserId,
				"personalProfileId":personalProfileId,
				"societyMasterId":501,
				"superAdminLastName":lastName,
				"listOfAssignedRoles":[parseInt(roles)],
				"personalProfile":{
				    "personalProfileId":personalProfileId,
				    "bloodGroup":bloodGroup,
				    "emailId":emailId,
				    "gender":gender,
				    "phone":phone,
				    "profileFirstName":profileFirstName,
				    "profileLastName":profileLastName
				   }	
	        };
    var req={"request":data};
    
    console.log(JSON.stringify(req));
   
	$.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.CREATE_USER),
        data: JSON.stringify(req)
    }).done(function(response) {
    	//hideLoader();
    	if(response.code=200){
    		alert("Society User Added");
    		console.log(response);
            location.reload();     
    	}else{
    		alert("Opps Something went wrong")
    	}
       
    })
	
})	


function loadUsers(){
	 $.ajax({
         type: "GET",
         contentType: 'application/json; charset=utf-8',
         dataType: 'json',
         url: getApi(Urls.GET_USERS),
     }).done(function(response) {
         loadUsersDatatable(response.resp);
     });
}
function loadUsersDatatable(dataSet) {
    if (typeof dataTable_checkpoint == 'undefined') {
        dataTable_checkpoint = $("#societyUsersTable")
            .dataTable({
                "bDestroy": true,
                "bRetrieve": true,
                "bProcessing": true,
                "bDeferRender": true,
                "aaData": dataSet,
                "aoColumns": [{
                    "sTitle": "First Name",
                    "mData": "personalProfile.profileFirstName"

                }, {
                    "sTitle": "Last Name",
                    "mData": "personalProfile.profileLastName"
                },{
                    "sTitle": "Phone Number",
                    "mData": "personalProfile.phone"
                },{
                    "sTitle": "Email-id",
                    "mData": "personalProfile.emailId"
                },{
                    "sTitle": "Action",
                    "mData": "dat",
                    "mRender": function(datam, type, row) {
                        return "&nbsp <button class='btn btn-default'><i class='fa fa-trash' aria-hidden='true '></i></button>"
                    }
                }]
            
            
            
            })
            
            var table = $('#rolesTable').DataTable();

	        $('#rolesTable tbody').on( 'click', 'tr', function () {
	              var rowData=table.row( this ).data();
	              deleteUser(rowData.superAdminRoleId);
	          } );

    } else {
        dataTable_checkpoint.dataTable().fnClearTable();
        if (dataSet.length != 0) {

            dataTable_checkpoint.fnAddData(dataSet)

        }
    }
}

function deleteUser(id){
	var isDelete=confirm("Do you really want to delete ??")
	if(isDelete==true){
		$.ajax({
	         type: "GET",
	         contentType: 'application/json; charset=utf-8',
	         dataType: 'json',
	         url: getApi(Urls.DELETE_USER),
	     }).done(function(response) {
	         if(response.code==200){
	        	 alert("Role Deleted");
	        	 location.reload();
	         }else{
	        	 alert("Opps Something went Wrong");
	         }
	     });
	}
	
}


