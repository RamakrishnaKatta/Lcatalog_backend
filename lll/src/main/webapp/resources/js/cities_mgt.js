$(function() {
	appendStates(1);
});

$(".citySearch").click(function(){
	var stateId=$("#state").val();
	loadCities(stateId);
})

$(".showModal").click(function(){
	$("#registerModal").modal();
})
	
	
$(".addCity").click(function(){
    var state=$("#select_state").val();
    var city=$("#select_city").val();
	var data={"name":city,"type":"CITY","parentId":state};
	var req={"request":data};
	addLocation(req);
})	

function loadCities(stateId){
	loadCitiesDatatable(findLocationById(stateId));
}

function loadCitiesDatatable(dataSet) {
    if (typeof dataTable_checkpoint == 'undefined') {
        dataTable_checkpoint = $("#citiesTable")
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
            
            var table = $('#citiesTable').DataTable();

	        $('#citiesTable tbody').on( 'click', 'tr', function () {
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




    
