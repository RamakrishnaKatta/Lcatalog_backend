$(document).ready(function(){
   loadVendors();
})

$("form#data").submit(function() {
            var formData = new FormData($(this)[0]);
            uploadFile(formData);
            $("#data")[0].reset();
            console.log(formData);
            //$("#uploadFile").modal("hide");
            
 });

function uploadFile(formData) {
    showLoader();
    $.ajax({
        url: "url",
        type: 'POST',
        data: formData,
        async: false,
        success: function(data) {
            hideLoader();
            if (data.code == 0) {
                alert("Learning material uploaded succesfully");
            } else {
                alert("Some error occurred while uploading material. Please try again");
            }
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
                 "sTitle": "Location",
                 "mData": "location"
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
    
    })
}

$(".showModal").click(function(){
	$("#myModal").modal();
	$(".edit").hide();
})