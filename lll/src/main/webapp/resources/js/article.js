$(document).ready(function(){
   loadUsers();
   loadVendorsDropDown();
})


$("form#data").submit(function() {
            var formData = new FormData($(this)[0]);
            uploadFile(formData);
            $("#data")[0].reset();
            console.log(formData);
            $("#myModal").modal("hide");
            return false; 
 });


function uploadFile(formData) {
    showLoader();
    $.ajax({
        url: getApi(Urls.ADD_ARTICLE),
        type: 'POST',
        data: formData,
        async: false,
        success: function(data) {
            hideLoader();
            console.log(data);
            if (data.code == 200) {
                alert("Uploaded succesfully");
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


function loadUsers(){
	showLoader(); 
    $.ajax({
        type: "GET",
        async:false,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.GET_ALL_ARTICLES),
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
                 "sTitle": "category",
                 "mData": "category"
             },{
                 "sTitle": "sub-category",
                 "mData": "sub_category"
             },{
                 "sTitle": "title",
                 "mData": "title"
             },{
                 "sTitle": "Description",
                 "mData": "description"
             },{
                 "sTitle": "Price",
                 "mData": "price"
             },{
                 "sTitle": "Quantity",
                 "mData": "quantity"
             },{
                 "sTitle": "Dimensions",
                 "mData": "dimensions"
             },{
                 "sTitle": "Discount",
                 "mData": "discount"
             },{
                 "sTitle": "VendorId",
                 "mData": "vendorId"
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