$(document).ready(function(){
   loadUsers();
   loadVendorsDropDown();
   $('.rd').prop('readonly', true);
})

$("form#data").submit(function() {
            var formData = new FormData($(this)[0]);
            uploadFile(formData);
            $("#data")[0].reset();
            console.log(formData);
            $("#myModal").modal("hide");
            return false; 
 });

$(".edit").click(function(){
	$('.rd').prop('readonly', false);
})

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
                alert("Uploaded Succesfully");
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
                        return "<button class= 'glyphicon glyphicon-trash delBtn btn btn-default' title='Delete Route'><button class='glyphicon glyphicon-edit viewResult btn btn-default' title='View Results'></button>";
                     }
              }]
         })
         
         var table = $('#myTable').DataTable();
         
         $('#myTable tbody').on( 'click', '.viewResult', function () {
    	       var data = table.row( $(this).parents('tr') ).data();
    	       console.log(data);
               rowData=data;
               populateForm(rowData);	       
          }); 
    
    })
}

$(".editArticle").click(function(){
	
	var id=$("#idU").val();
	var category=$("#categoryU").val();
	var description=$("#descriptionU").val();
	var dimension=$("#dimensionsU").val();
	var discount=$("#discountU").val();
	var name=$("#nameU").val();
	var price=$("#priceU").val();
	var quantity=$("#quantityU").val();
	var sub_category=$("#sub_categoryU").val();
	var title=$("#titleU").val();
	var uploadedUserId=$("#uploadedUserIdU").val();
	var vendorId=$("#vendorIdU").val();
	
	var request={"request":{"id":id,"category":category,"description":description,"dimensions":dimension,"discount":discount,"name":name,"price":price,
	     "quantity":quantity,"sub_category":sub_category,"title":title,"uploadedUserId":uploadedUserId,"vendorId":vendorId
	}}
	
	console.log(JSON.stringify(request))
	
	showLoader();
     $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                url: getApi(Urls.UPDATE_ARTICLE),
                data: JSON.stringify(request)
            })
            .done(function(response){
                hideLoader();
                if(response.code==200){
               	alert("Details Updated");
                //$('#myModal').modal('toggle');
               	location.reload();
               }else{
               	alert("Opps Something went wrong");
               }           
             }).fail(function(jqXHR, textStatus, errorThrown) {
                //checkSessionTimeout(jqXHR, textStatus, errorThrown);
                alert("Opps something went wrong");
                hideLoader();
            })
	
})



function populateForm(rowData){
	$("#myUpdateModal").modal();	
	$("#idU").val(rowData.id);
	$("#categoryU").val(rowData.category);
	$("#descriptionU").val(rowData.description);
	var dims=rowData.dimension.width+","+rowData.dimension.length+","+rowData.dimension.height;
	console.log(dims);
	$("#dimensionsU").val(dims);
	$("#discountU").val(rowData.discount);
	$("#nameU").val(rowData.name);
	$("#priceU").val(rowData.price);
	$("#quantityU").val(rowData.quantity);
	$("#sub_categoryU").val(rowData.sub_category);
	$("#titleU").val(rowData.title);
	$("#uploadedUserIdU").val(rowData.uploadedUserId);
	$("#vendorIdU").val(rowData.vendorId);	
}

$(".showModal").click(function(){
	$("#myModal").modal();
	$(".edit").hide();
})

$(".viewResult").click(function(){
	$("#myUpdateModal").modal();
	$(".edit").hide();
})

$("#vendorId").change(function(){
	
 	var vendorId=$("#vendorId").val();
    $("#uploadedUserId").val(parseInt(vendorId)+1);
//	
//	showLoader(); 
//    $.ajax({
//        type: "GET",
//        async:false,
//        contentType: 'application/json; charset=utf-8',
//        dataType: 'json',
//        url: getApi(Urls.GET_ALL_USERS),
//    })
//    .done(function(response){
//    hideLoader();
//    console.log(response);
//    if(response.code==200){
//        var options="<option value=null selected='selected'>--Select Uploaded User Id--</option>";
//        for(var i=0;i<(response.resp).length;i++){
//        var option="<option value='"+response.resp[i].id+"'>"+response.resp[i].name+"</option>";
//        options=options+option;
//        }
//        $("#uploadedUserId").append(options);
//    }else{
//    	alert("No Admin found for this vendor");
//    }
//    })
})