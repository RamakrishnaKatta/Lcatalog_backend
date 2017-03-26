$(function() {
	//setInterval(function(){ location.reload(); }, 3000);
	appendStates(1);
});

$("#state").change(function(){
	var stateId=$("#state").val();
	appendCities(stateId);
})

$("#city").change(function(){
	var cityId=$("#city").val();
	appendLocalities(cityId)
})

$("#subLocalitySearch").click(function(){
	var localityId=$("#locality").val();
	loadSubLocalities(localityId);
})

$(".showModal").click(function(){
	$("#registerModal").modal();
})
	
	
$(".addSubLocality").click(function(){
    
    var subLocality=$("#sub_locality").val();
    var localityId=$("#select_locality").val();
    var lat=$("#lat").val();
    var lng=$("#lng").val();
	var data={"name":subLocality,"type":"SUB-LOCALITY","parentId":localityId,"lat":lat,"lng":lng};
	var req={"request":data};
	addLocation(req);
})	

function loadSubLocalities(localityId){
	loadSubLocalitiesDatatable(findLocationById(localityId));
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
                    "mData": "id"
                }, {
                    "sTitle": "Location Name",
                    "mData": "name"
                },{
                    "sTitle": "Action",
                    "mData": "data",
                    "mRender": function(datam, type, row) {
                        return "&nbsp <button class='btn btn-default'><i class='fa fa-trash' aria-hidden='true '></i></button>"
                    }
                }]
            
            
            
            })
            
            var table = $('#subLocalitiesTable').DataTable();

	        $('#subLocalitiesTable tbody').on( 'click', 'tr', function () {
	              var rowData=table.row( this ).data();
	              deleteLocation(rowData.id);
	        });

    } else {
        dataTable_checkpoint.dataTable().fnClearTable();
        if (dataSet.length != 0) {
            dataTable_checkpoint.fnAddData(dataSet)
        }
    }
}




    
