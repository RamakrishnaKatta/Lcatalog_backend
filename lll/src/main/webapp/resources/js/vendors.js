$(document).ready(function(){
   loadVendors();
})

$("form#data").submit(function() {
            var formData = new FormData($(this)[0]);
            uploadFile(formData);
            $("#data")[0].reset();
            console.log(formData);
            $("#myModal").modal("hide");
            return false; 
 });

function deleteVendor(id){
	alert(id);
}

function uploadFile(formData) {
    showLoader();
    $.ajax({
    	url: getApi(Urls.ADD_VENDOR),
        type: 'POST',
        data: formData,
        async: false,
        success: function(data) {
            hideLoader();
            console.log(data);
            if (data.code == 200) {
                alert("Vendor Added");
                location.reload();
            } else {
                alert("Some error occurred while uploading material. Please try again");
            }
        },
        error: function ( xhr, status, error) {
        	location.reload();
        },
        cache: false,
        contentType: false,
        processData: false
    });
}

function loadVendors(){
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
    
    $('#myTable').DataTable({  
        "data": response.resp,
         "order": [[ 0, "desc" ]],   
         "destroy": true,
         "columns": [
             {
                 "sTitle": "Id",
                 "mData": "id",
                 "visible":true
             },{
                 "sTitle": "Name",
                 "mData": "name"
             },{
                 "sTitle": "Code",
                 "mData": "code"
             },{
                 "sTitle": "logo",
                 "mData": "logo",
                 "mRender": function(data,type,row){
                	 return "<img src='"+window.location.origin+data+"' height='42' width='42'>";
                 }
             },{
                 "sTitle": "Type",
                 "mData": "type"
             },{
                     "sTitle": "Action",
                     "mData": "id",
                     "mRender": function(data, type, row) {
                        return "<button class= 'glyphicon glyphicon-trash delBtn btn btn-default' title='Delete Route'><button class='glyphicon glyphicon-zoom-in viewResult btn btn-default' title='View Results'></button>";
                     }
                } ]
         })
         
         $(".viewResult").click(function(){
	$("#myUpdateModal").modal();
	$(".edit").hide();
})
    
    })
    
    var table = $('#myTable').DataTable();

    $('#myTable tbody').on( 'click', '.delBtn', function () {
    var con=confirm("Do you really want to delete ??");
    console.log(con);
    if(con==true){
     var data = table.row( $(this).parents('tr') ).data();
     deleteVendor(data.id);	
    }
   
    }); 
}

function deleteVendor(id){
    showLoader();
    //console.log(photo.split("/")[]);
    $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: getApi(Urls.DEL_VENDOR)+id
            })
            .done(function(response)  {
                hideLoader();
                if(response.code==200){
                  alert("Vendor deleted");
                  location.reload();
                }else{
                  alert("Opps Something Went Wrong");
                }

            }).fail(function(jqXHR, textStatus, errorThrown) {
                alert("Opps something went wrong");
                hideLoader();
            })
}


$(".showModal").click(function(){
	$("#myModal").modal();
	$(".edit").hide();
})

