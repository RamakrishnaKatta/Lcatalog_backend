$("form#data").submit(function() {
            var formData = new FormData($(this)[0]);
            sendNotification(formData);
            $("#data")[0].reset();
            console.log(formData);
            $("#myModal").modal("hide");
            return false; 
 });



function sendNotification(formData) {
    showLoader();
    $.ajax({
    	url: getApi(Urls.SEND_NOTIFICATION),
        type: 'POST',
        data: formData,
        async: false,
        success: function(data) {
            hideLoader();
            console.log(data);
            if (data.code == 200) {
                alert("Notification Sent");
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