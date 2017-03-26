$(function() {
	loadStates(1);
});

$(".showModal").click(function(){
	$("#registerModal").modal();
})
	
	
$(".addState").click(function(){
    var state=$("#state").val();
	var data={"name":state,"type":"STATE","parentId":1};
	var req={"request":data};
	addLocation(req);
})	

function loadStates(){
	loadStatesDatatable(findLocationById(1));
}

function loadStatesDatatable(dataSet) {
    if (typeof dataTable_checkpoint == 'undefined') {
        dataTable_checkpoint = $("#statesTable")
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
            
            var table = $('#statesTable').DataTable();

	        $('#statesTable tbody').on( 'click', 'tr', function () {
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




    
