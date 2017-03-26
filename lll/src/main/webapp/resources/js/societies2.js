$(function() {
	//setInterval(function(){ location.reload(); }, 3000);
	//appendStates(1);
});

$("#state").change(function(){
	var stateId=$("#state").val();
	appendCities(stateId);
})

$("#city").change(function(){
	var cityId=$("#city").val();
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

$(".showModal").click(function(){
	$("#registerModal").modal();
	$(".editSubLocality").hide();
})
	
	
$(".addSubLocality").click(function(){
    
	var societyName=$("#societyName").val();
	var societyNickName=$("#societyNickName").val();
	var residenceType=$("#residenceType").val();
	var societyUrl=$("#societyUrl").val();
	var societyImagePath=$("#societyImagePath").val();
	var societyStatus=$("#societyStatus").val();
	var localityId=$("#select_locality").val();
	var subLocality=$("#sub_locality").val();
	var lat=$("#lat").val();
	var lng=$("#lng").val();
	var licenceType=$("#licenceType").val();
	var zipCode=$("#zipCode").val();
	
	var data={"societyName":societyName,"societyNickName":societyNickName,
			"residenceType":residenceType,"societyUrl":societyUrl,"societyImagePath":societyImagePath,
			"societyStatus":societyStatus,"localityId":localityId,"subLocality":subLocality,
			"lat":lat,"lng":lng,"licenceType":licenceType,"zipCode":zipCode};
	var req={"request":data};
	addSociety(req);
})	


function addSociety(req){
	console.log(JSON.stringify(req));
	showLoader();
	$.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: window.location.origin + "/bind/society/create",
        async: false, 
        data: JSON.stringify(req)
    }).done(function(response) {
    	hideLoader();
    	if(response.code==200){
    		alert("Society Created");
    		console.log(response);
            location.reload();
    	}else{
    		alert("Opps Something went wrong")
    	}
       
    })
}

function loadSubLocalities(localityId){
	showLoader();
	$.ajax({
        type: "GET",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: window.location.origin + "/bind/society/getby?localityId="+localityId,
    }).done(function(response) {
    	hideLoader();
    	if(response.code==200){
    		loadSubLocalitiesDatatable(response.resp);
    	}else{
    		alert("Opps Something went wrong")
    	}
       
    })
	
}

function loadSubLocalitiesDatatable(dataSet) {
    if (typeof dataTable_checkpoint == 'undefined') {
        dataTable_checkpoint = $("#subLocalitiesTable")
            .dataTable({
                "bDestroy": true,
                "bRetrieve": true,
                "bProcessing": true,
                "bDeferRender": true,
                "aaData": dataSet,
                "aoColumns": [{
                    "sTitle": "Id",
                    "mData": "societyMasterId"
                }, {
                    "sTitle": "Location Name",
                    "mData": "societyNickName"
                }, {
                    "sTitle": "Location Name",
                    "mData": "societyUrl"
                }, {
                    "sTitle": "Action",
                    "mData": "data",
                    "mRender": function(datam, type, row) {
                        return "&nbsp <button class='btn btn-default delete'><i class='fa fa-trash' aria-hidden='true '></i></button> <button class='btn btn-default edit'><i class='glyphicon glyphicon-zoom-in' aria-hidden='true '></i></button>"
                    }
                }]
            
            
            
            })
            
            var table = $('#subLocalitiesTable').DataTable();

	        $('#subLocalitiesTable tbody').on( 'click', '.delete', function () {
	        	 var row = $(this).closest("tr").get(0);
	        	 var aData = table.row(row).data(); 
	        	 deleteSociety(aData.societyMasterId,aData.subLocalityId);
	        });
	        
	        $('#subLocalitiesTable tbody').on( 'click', '.edit', function () {
	        	 var row = $(this).closest("tr").get(0);
	        	 var aData = table.row(row).data();
	        	 populateEditModal(aData);
	        });

    } else {
        dataTable_checkpoint.dataTable().fnClearTable();
        if (dataSet.length != 0) {
            dataTable_checkpoint.fnAddData(dataSet)
        }
    }
}

function deleteSociety(societyId,locId){
    console.log(societyId);
    console.log(locId);
    var isDelete=confirm("Do you really want to delete ??")
	if(isDelete==true){
	showLoader();
	$.ajax({
        type: "GET",
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: window.location.origin + "/bind/society/delete?societyId="+societyId+"&locId="+locId,
    }).done(function(response) {
    	hideLoader();
    	if(response.code==200){
    		alert("Society Deleted");
    		location.reload();
    	}else{
    		alert("Opps Something went wrong")
    	}
       
    })
	}
}


function populateEditModal(aData){
	
	$("#registerModal").modal();
	$(".headerText").html("Edit Society");
	$(".form-control").attr('readonly', true) ;
	$(".addSubLocality").hide();
	$(".editSubLocality").show();
	
	
	$("#societyName").val(aData.societyName);
	$("#societyNickName").val(aData.societyNickName);
	$("#residenceType").val(aData.residenceType);
	$("#societyUrl").val(aData.societyUrl);
	$("#societyImagePath").val(aData.societyImagePath);
	$("#societyStatus").val(aData.societyStatus);
	$("#select_locality").val(aData.localityId);
	$("#sub_locality").val(aData.subLocality);
	$("#lat").val(aData.lat);
	$("#lng").val(aData.lng);
	$("#licenceType").val(aData.licenceType);
	$("#zipCode").val(aData.zipCode);
	
	
}

    
