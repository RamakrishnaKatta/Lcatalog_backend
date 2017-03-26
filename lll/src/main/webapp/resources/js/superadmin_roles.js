$(function() {
   loadRoles();
   createRole();
});


function loadRoles(){
	 $.ajax({
         type: "GET",
         contentType: 'application/json; charset=utf-8',
         dataType: 'json',
         url: window.location.origin + "/bind/super_admin/retrieveActorRoles?actorType=SUPER_ADMIN",
     }).done(function(response) {
         loadRolesDatatable(response.resp);
     });
}
function loadRolesDatatable(dataSet) {
    if (typeof dataTable_checkpoint == 'undefined') {
        dataTable_checkpoint = $("#rolesTable")
            .dataTable({
                "bDestroy": true,
                "bRetrieve": true,
                "bProcessing": true,
                "bDeferRender": true,
                "aaData": dataSet,
                "aoColumns": [{
                    "sTitle": "RoleId",
                    "mData": "superAdminRoleId"

                }, {
                    "sTitle": "RoleName",
                    "mData": "superAdminRoleName"
                }, {
                    "sTitle": "Action",
                    "mData": "data",
                    "mRender": function(datam, type, row) {
                        return "&nbsp <button class='btn btn-default'><i class='fa fa-trash' aria-hidden='true '></i></button>"
                    }
                }]
            
            
            
            })
            
            var table = $('#rolesTable').DataTable();

	        $('#rolesTable tbody').on( 'click', 'tr', function () {
	              var rowData=table.row( this ).data();
	              deleteRole(rowData.superAdminRoleId);
	          } );

    } else {
        dataTable_checkpoint.dataTable().fnClearTable();
        if (dataSet.length != 0) {

            dataTable_checkpoint.fnAddData(dataSet)

        }
    }
}

function deleteRole(id){
	var isDelete=confirm("Do you really want to delete ??")
	if(isDelete==true){
		$.ajax({
	         type: "GET",
	         contentType: 'application/json; charset=utf-8',
	         dataType: 'json',
	         url: window.location.origin + "/bind/super_admin/deleterole?id="+id,
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

function createRole() {
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
            //showLoader();
            // Defined in utility.js

            var role_name = $("#role_name").val();
            var role_id=$("#role_id").val();
            var data = {
                "request": {
                    "superAdminRoleName": role_name,
                    "superAdminRoleId":parseInt(role_id)
                    
                }
            }
            
            //showLoader();
            $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: window.location.origin + "/bind/super_admin/addrole",
                data: JSON.stringify(data)
            }).done(function(response) {
            	//hideLoader();
            	if(response.code=200){
            		alert("Role Added");
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
