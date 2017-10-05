$(document).ready(function() {
	loadUsers();
	loadVendorsDropDown();
})

function loadUsers() {
	showLoader();
	$
			.ajax({
				type : "GET",
				async : false,
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				url : getApi(Urls.GET_ALL_USERS),
			})
			.done(
					function(response) {
						hideLoader();
						console.log(response);

						$('#myTable')
								.DataTable(
										{
											"data" : response.resp,
											"order" : [ [ 0, "desc" ] ],
											"destroy" : true,
											"columns" : [
													{
														"sTitle" : "Id",
														"mData" : "id",
														"visible" : false
													},
													{
														"sTitle" : "Name",
														"mData" : "name"
													},
													{
														"sTitle" : "Role",
														"mData" : "type"
													},
													{
														"sTitle" : "Email-Id",
														"mData" : "email"
													},
													{
														"sTitle" : "Mobile No",
														"mData" : "mobileNo"
													},
													{
														"sTitle" : "Address",
														"mData" : "address"
													},
													{
														"sTitle" : "Vendor-Id",
														"mData" : "vendorId"
													},
													{
														"sTitle" : "Other details",
														"mData" : "otherDetails"
													},
													{
														"sTitle" : "Action",
														"mData" : "id",
														"mRender" : function(
																data, type, row) {
															return "<button class= 'glyphicon glyphicon-trash delBtn btn btn-default' title='Delete Route'><button class='glyphicon glyphicon-edit viewResult btn btn-default' title='View Results'></button>";
														}
													} ]

										})

						var table = $('#myTable').DataTable();

						$('#myTable tbody')
								.on(
										'click',
										'.delBtn',
										function() {
											var con = confirm("Do you really want to delete ??");
											if (con == true) {
												var data = table.row(
														$(this).parents('tr'))
														.data();
												deleteUser(data.id);
											}
										});

						$('#myTable tbody').on(
								'click',
								'.viewResult',
								function() {
									var data = table.row($(this).parents('tr'))
											.data();
									console.log(data);
									$("#myModal").modal();
									$(".edit").show();
									$(".add").hide();
									$(".update").hide();
									$(".headerText").text("Update Admin");
									$('.rd,.rdStrict').prop('readonly', true); 
									populateForm(data);
								});

					})

	$(".showModal").click(function() {
		$("#myModal").modal();
		$(".edit").hide();
		$(".update").hide();
		$(".add").show();
		$(".headerText").text("Add Admin");
	})

}


$(".update").click(function() {
	
	var name = $("#name").val();
	var address = $("#address").val();
	var password = $("#pass2").val();
	var vendorId = $("#vendorId").val();
	var email = $("#email").val();
	var phNo = $("#phNo").val();
	var otherDetails = $("#otherDetails").val();
    var id = $("#id").val();
    
		var req = {
			"request" : {
			    "id" : id,
				"email" : email,
				"vendorId" : vendorId,
				"name" : name,
				"type" : "ADMIN",
				"address" : address,
				"mobileNo" : phNo,
				"otherDetails" : otherDetails
			}
		}
		
		updateAdmin(req)
	

})



$(".add").click(function() {
	
	var name = $("#name").val();
	var address = $("#address").val();
	var password = $("#pass2").val();
	var vendorId = $("#vendorId").val();
	var email = $("#email").val();
	var pass1 = $("#pass1").val();
	var pass2 = $("#pass2").val();
	var phNo = $("#phNo").val();
	var otherDetails = $("#otherDetails").val();

	if (pass1 === pass2) {
		var req = {
			"request" : {
				"email" : email,
				"vendorId" : vendorId,
				"name" : name,
				"type" : "ADMIN",
				"address" : address,
				"password" : pass2,
				"mobileNo" : phNo,
				"otherDetails" : otherDetails
			}
		}
		addAdmin(req)
	} else {
		alert("Password is not matching");
	}

})


function updateAdmin(req) {
	console.log(JSON.stringify(req));
	$.ajax({
		type : "POST",
		data : JSON.stringify(req),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		url : getApi(Urls.UPDATE_ADMIN),
	}).done(function(response) {
		console.log(response);
		if (response.code == "200") {
			alert("Updated");
			location.reload();
		} else {
			alert("Oops something went wrong");
			location.reload();
		}

	})

}

function addAdmin(req) {
	console.log(JSON.stringify(req));
	$.ajax({
		type : "POST",
		data : JSON.stringify(req),
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		url : getApi(Urls.ADD_ADMIN),
	}).done(function(response) {
		console.log(response);
		if (response.code == "300") {
			alert("Admin is already exists for the vendor");
			location.reload();
		} else if (response.code == "200") {
			alert("Admin Registered Succesfully");
			location.reload();
		} else {
			alert("Oops something went wrong");
			location.reload();
		}

	})

}

function populateForm(data) {

	$("#id").val(data.id);
	$("#name").val(data.name);
	$("#address").val(data.address);
	$("#vendorId").val(data.vendorId);
	$("#email").val(data.email);
	$(".pass").hide();
	$("#phNo").val(data.mobileNo);
	$("#vendorId").val(data.vendorId);
	$("#otherDetails").val(data.otherDetails);

}

$(".edit").click(function(){
	$(".add").hide();
	$(".edit").hide();
	$(".update").show();
	$('.rd').prop('readonly', false);
})


function deleteUser(id) {
	showLoader();
	$.ajax({
		type : "GET",
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		url : getApi(Urls.DEL_USER) + id
	}).done(function(response) {
		hideLoader();
		if (response.code == 200) {
			alert("User deleted");
			location.reload();
		} else {
			alert("Opps Something Went Wrong");
		}

	}).fail(function(jqXHR, textStatus, errorThrown) {
		alert("Opps something went wrong");
		hideLoader();
	})
}
