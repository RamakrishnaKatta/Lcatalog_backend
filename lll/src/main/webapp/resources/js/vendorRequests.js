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




function loadVendors(){
	showLoader(); 
    $.ajax({
        type: "GET",
        async:false,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.GET_ALL_VENDORS_REQ),
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
                 "sTitle": "Company Name",
                 "mData": "companyName"
             },{
                 "sTitle": "Contact Person Name",
                 "mData": "contactPersonName"
             },{
                 "sTitle": "Email",
                 "mData": "email"
             },{
                 "sTitle": "Address",
                 "mData": "loc"
             },{
                 "sTitle": "Mobile-No",
                 "mData": "mobile"
             },{
                 "sTitle": "Pin",
                 "mData": "pin"
             },{
                 "sTitle": "state",
                 "mData": "state"
             },{
                 "sTitle": "No-of-Models",
                 "mData": "totModels"
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