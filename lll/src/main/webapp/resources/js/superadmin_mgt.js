$(function() {
   loadUsers();
});


$(".showModal").click(function(){
	   $("#registerModal").modal();
	   loadRolesInSelect();
})

function loadRolesInSelect(){
	 
	 showLoader();
	 $.ajax({
         type: "GET",
         contentType: 'application/json; charset=utf-8',
         dataType: 'json',
         url: window.location.origin + "/bind/super_admin/retrieveActorRoles?actorType=SUPER_ADMIN",
     }).done(function(response) {
    	 hideLoader();
    	 $("#multiVal").empty();
    	 $("#multiVal").multiselect("destroy");
    	 for(var i=0;i<(response.resp).length;i++){
    		 var list = $("<option value="+response.resp[i].superAdminRoleId+">"+response.resp[i].superAdminRoleName+"</option>");
    		 $("#multiVal").append(list);
    	 }
         
    	 $('#multiVal').multiselect({
		       maxHeight: 400,
		       buttonWidth: '100%',
		       enableFiltering: true,
		       enableFullValueFiltering: true,
		       includeSelectAllOption: true
		   });
   });
}
	
$(".add").click(function(){
	
	var id=new Date().getTime()%10000;
	var loginId=new Date().getTime()%100;
	var firstName=$("#firstName").val();
	var lastName=$("#lastName").val();
	var roles=$("#multiVal").val();
	var data={"superAdminUserId":id,"superAdminFirstName":firstName,"superAdminLastName":lastName,
			 "superAdminLoginId":loginId,"listOfAssignedRoles":roles};
    var req={"request":data};
    
    console.log(JSON.stringify(req));
    
    showLoader();
	$.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: window.location.origin + "/bind/super_admin/create_admin_user",
        data: JSON.stringify(req)
    }).done(function(response) {
    	hideLoader();
    	if(response.code=200){
    		alert("Super Admin Added");
    		console.log(response);
            location.reload();
    	}else{
    		alert("Opps Something went wrong")
    	}
       
    })
	
})	


function loadUsers(){
	showLoader(); 
	$.ajax({
         type: "GET",
         contentType: 'application/json; charset=utf-8',
         dataType: 'json',
         url: window.location.origin + "/bind/super_admin/get_all_super_admins",
     }).done(function(response) {
    	 hideLoader();
         loadUsersDatatable(response.resp);
     });
}
function loadUsersDatatable(dataSet) {
    if (typeof dataTable_checkpoint == 'undefined') {
        dataTable_checkpoint = $("#superAdminTable")
            .dataTable({
                "bDestroy": true,
                "bRetrieve": true,
                "bProcessing": true,
                "bDeferRender": true,
                "aaData": dataSet,
                "aoColumns": [{
                    "sTitle": "Id",
                    "mData": "superAdminUserId"

                }, {
                    "sTitle": "First Name",
                    "mData": "superAdminFirstName"
                }, {
                    "sTitle": "Last Name",
                    "mData": "superAdminLastName"
                }, {
                    "sTitle": "Login-Id",
                    "mData": "superAdminLoginId"
                }, {
                    "sTitle": "Action",
                    "mData": "data",
                    "mRender": function(datam, type, row) {
                        return "&nbsp <button class='btn btn-default'><i class='fa fa-trash' aria-hidden='true'></i></button>"
                    }
                }]
            
            
            
            })
            
            var table = $('#superAdminTable').DataTable();

	        $('#superAdminTable tbody').on( 'click', 'tr', function () {
	              var rowData=table.row( this ).data();
	              deleteSuperAdmin(rowData.superAdminUserId);
	          } );

    } else {
        dataTable_checkpoint.dataTable().fnClearTable();
        if (dataSet.length != 0) {

            dataTable_checkpoint.fnAddData(dataSet)

        }
    }
}

function deleteSuperAdmin(id){
	var isDelete=confirm("Do you really want to delete ??")
	if(isDelete==true){
		$.ajax({
	         type: "GET",
	         contentType: 'application/json; charset=utf-8',
	         dataType: 'json',
	         url: window.location.origin + "/bind/super_admin/delete_by?id="+id,
	     }).done(function(response) {
	         if(response.code==200){
	        	 alert("User Deleted");
	        	 location.reload();
	         }else{
	        	 alert("Opps Something went Wrong");
	         }
	     });
	}
	
}

function createUser() {
    $("#create_role_form").validate({
        rules: {
            role_name: {
                required: true
            },
           role_id:{
        	   required:true
           }

        },
        submitHandler: function(form) {
            var role_name = $("#role_name").val();
            var role_id=$("#role_id").val();
            var data = {
                "request": {
                    "superAdminRoleName": role_name,
                    "superAdminRoleId":parseInt(role_id)
                    
                }
            }
            
            showLoader();
            $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: window.location.origin + "/bind/super_admin/addrole",
                data: JSON.stringify(data)
            }).done(function(response) {
            	hideLoader();
            	if(response.code=200){
            		alert("Suoer Added");
            		$("#create_role_form")[0].reset();
                    location.reload();
            	}else{
            		alert("Opps Something went wrong")
            	}   
            })
            return false;
        }
    });
}
