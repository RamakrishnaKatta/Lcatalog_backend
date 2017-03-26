$(function() {
	//setInterval(function(){ location.reload(); }, 3000);
	appendStates(1);
});

$("#state").change(function(){
	var stateId=$("#state").val();
	appendCities(stateId);
})

$("#localitySearch").click(function(){
	var cityId=$("#city").val();
	loadCities(cityId);
})

$(".showModal").click(function(){
	$("#registerModal").modal();
})
	
	
$(".addLocality").click(function(){
    var state=$("#select_state").val();
    var city=$("#select_city").val();
    var locality=$("#select_locality").val();
    var lat=$("#lat").val();
    var lng=$("#lng").val();
	var data={"name":locality,"type":"LOCALITY","parentId":city,"lat":lat,"lng":lng};
	var req={"request":data};
	addLocation(req);
})	

function loadCities(cityId){
	loadCitiesDatatable(findLocationById(cityId));
}

function loadCitiesDatatable(dataSet) {
    if (typeof dataTable_checkpoint == 'undefined') {
        dataTable_checkpoint = $("#localitiesTable")
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
            
            var table = $('#localitiesTable').DataTable();

	        $('#localitiesTable tbody').on( 'click', 'tr', function () {
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




    
