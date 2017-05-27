$(document).ready(function(){
   loadNotications();
})

function loadNotications(){
	showLoader(); 
    $.ajax({
        type: "GET",
        async:false,
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        url: getApi(Urls.GET_NOTIFICATION),
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
                 "sTitle": "Title",
                 "mData": "title"
             },{
                 "sTitle": "Message",
                 "mData": "msg"
             },{
                 "sTitle": "Img",
                 "mData": "path",
                 "mRender": function(data,type,row){
                	 return "<img src='"+window.location.origin+data+"' height='52' width='52'>";
                 }
             } ]
         })
    
    })
}
