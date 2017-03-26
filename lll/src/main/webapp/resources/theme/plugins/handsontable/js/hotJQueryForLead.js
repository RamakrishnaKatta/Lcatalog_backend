$( document ).ready(function() {

	function getDataTest() {
		return [
		        {"agentId":"128","areaCode":"30140001","urn":"","syncStatus":"READY_FOR_SYNC","branchCode":"3014","subarea":"Aaa","city":"0262","cross":"Aaa","street":"Aaa","doorNo":"Aaa","firstName":"Amit","fmsFlag":"Father","fmsName":"Mcs","landmark":"","lastName":"Surana","leadId":"139099424463150","status":"L_CAPTURED","loanCycle":"NEW","mainarea":"Aaa","middleName":"M","mobileNo":"9465656265","notionalBatchName":"AmitTest","notionalBatchNo":"AmitTest_139087226643387","pincode":"560011","state":"KARNATAKA","primaryIdType":"Driving License","primaryIdValue":"ETN037","productCode":"814","remarks":"Closed - Converted","secondaryIdValue":"DKDKD","secondaryIdType":"Gazette letter","secondaryIdExpiry":1435948200000,"primaryIdExpiry":1435948200000,"loanAmount":25000.0,"statusLastUpdTime":0,"dob":489177000000,"capturedDateTime":1435917694562,"batchSubmissionTime":1435917725252,"syncRetries":0,"batchCount":1},
		        {"agentId":"128","areaCode":"30140001","urn":"","syncStatus":"READY_FOR_SYNC","branchCode":"3014","subarea":"Aaa","city":"0262","cross":"Aaa","street":"Aaa","doorNo":"Aaa","firstName":"oDxAQwENmM","fmsFlag":"Father","fmsName":"Mcs","landmark":"","lastName":"jckWZdvseU","leadId":"18851548501694","status":"L_CAPTURED","loanCycle":"NEW","mainarea":"Aaa","middleName":"suvrUWxJlq","mobileNo":"9465656265","notionalBatchName":"gen_HhILCe","notionalBatchNo":"18851519718360","pincode":"560011","state":"KARNATAKA","primaryIdType":"Driving License","primaryIdValue":"0hmUCHZrxK","productCode":"814","remarks":"Closed - Converted","secondaryIdValue":"iNRpYnx55h","secondaryIdType":"Gazette letter","secondaryIdExpiry":1435948200000,"primaryIdExpiry":1435948200000,"loanAmount":25000.0,"statusLastUpdTime":0,"dob":489177000000,"capturedDateTime":1435917694562,"batchSubmissionTime":1435917789912,"syncRetries":0,"batchCount":1}
		        ];
	}


	var initialData = getDataTest();
	initialData.forEach(function reformatTheTime(arrayItem){

		var d = new Date(0);
		var value = arrayItem.capturedDateTime /1000;
		d.setUTCSeconds(value);
		var dd = d.getDate(),
		mm = d.getMonth() + 1, 
		yyyy = d.getFullYear(), 
		dateFormatted = dd+'/'+mm+'/'+yyyy;
		arrayItem.capturedDateTime = dateFormatted;

		var d2 = new Date(0);
		var value2 = arrayItem.dob /1000;
		d2.setUTCSeconds(value2);
		var dd2 = d2.getDate(),
		mm2 = d2.getMonth() + 1, 
		yyyy2 = d2.getFullYear(), 
		dateFormatted2 = dd2+'/'+mm2+'/'+yyyy2;
		arrayItem.dob = dateFormatted2;

		var d3 = new Date(0);
		var value3 = arrayItem.primaryIdExpiry /1000;
		d3.setUTCSeconds(value3);
		var dd3 = d3.getDate(),
		mm3 = d3.getMonth() + 1, 
		yyyy3 = d3.getFullYear(), 
		dateFormatted3 = dd3+'/'+mm3+'/'+yyyy3;
		arrayItem.primaryIdExpiry = dateFormatted3;

		var d4 = new Date(0);
		var value4 = arrayItem.secondaryIdExpiry /1000;
		d4.setUTCSeconds(value4);
		var dd4 = d4.getDate(),
		mm4 = d4.getMonth() + 1, 
		yyyy4 = d4.getFullYear(), 
		dateFormatted4 = dd4+'/'+mm4+'/'+yyyy4;
		arrayItem.secondaryIdExpiry = dateFormatted4;

		var d5 = new Date(0);
		var value5 = arrayItem.batchSubmissionTime /1000;
		d5.setUTCSeconds(value5);
		var dd5 = d5.getDate(),
		mm5 = d5.getMonth() + 1, 
		yyyy5 = d5.getFullYear(), 
		dateFormatted5 = dd5+'/'+mm5+'/'+yyyy5;
		arrayItem.batchSubmissionTime = dateFormatted5;

		var d6 = new Date(0);
		var value6 = arrayItem.statusLastUpdTime /1000;
		d6.setUTCSeconds(value6);
		var dd6 = d6.getDate(),
		mm6 = d6.getMonth() + 1, 
		yyyy6 = d6.getFullYear(), 
		dateFormatted6 = dd6+'/'+mm6+'/'+yyyy6;
		arrayItem.statusLastUpdTime = dateFormatted6;
	});

	// Instead of creating a new Handsontable instance
	// with the container element passed as an argument,
	// you can simply call .handsontable method on a jQuery DOM object.
	var $container = $("#hoTable");

	$container.handsontable({
		data: initialData,
		rowHeaders: true,
		//colHeaders: true,
		colHeaders: [
		             'agentId',
		             'areaCode',
		             'urn',
		             'syncStatus',
		             'branchCode',
		             'subarea',
		             'city',
		             'cross',
		             'street',
		             'doorNo',
		             'firstName',
		             'fmsFlag',
		             'fmsName',
		             'landmark',
		             'lastName',
		             'leadId',
		             'status',
		             'loanCycle',
		             'mainarea',
		             'middleName',
		             'mobileNo',
		             'notionalBatchName',
		             'notionalBatchNo',
		             'pincode',
		             'state',
		             'primaryIdType',
		             'primaryIdValue',
		             'primaryIdExpiry',
		             'productCode',
		             'remarks',
		             'secondaryIdValue',
		             'secondaryIdType',
		             'secondaryIdExpiry',
		             //'primaryIdExpiry',
		             'loanAmount',
		             'statusLastUpdTime',
		             'dob',
		             'capturedDateTime',
		             'batchSubmissionTime',
		             'syncRetries',
		             'batchCount'
		             ],

		             columns : [{
		            	 data : 'agentId'
		             }, {
		            	 data : 'areaCode'
		             }, {
		            	 data : 'urn'
		             }, {
		            	 data : 'syncStatus'
		             }, {
		            	 data : 'branchCode'
		             }, {
		            	 data : 'subarea'
		             }, {
		            	 data : 'city'
		             }, {
		            	 data : 'cross'
		             }, {
		            	 data : 'street'
		             }, {
		            	 data : 'doorNo'
		             }, {
		            	 data : 'firstName'
		             }, {
		            	 data : 'fmsFlag'
		             }, {
		            	 data : 'fmsName'
		             }, {
		            	 data : 'landmark'
		             }, {
		            	 data : 'lastName'
		             }, {
		            	 data : 'leadId'
		             }, {
		            	 data : 'status'
		             }, {
		            	 data : 'loanCycle'
		             }, {
		            	 data : 'mainarea'
		             }, {
		            	 data : 'middleName'
		             }, {
		            	 data : 'mobileNo'
		             }, {
		            	 data : 'notionalBatchName'
		             }, {
		            	 data : 'notionalBatchNo'
		             }, {
		            	 data : 'pincode'
		             }, {
		            	 data : 'state'
		             }, {
		            	 data : 'primaryIdType'
		             }, {
		            	 data : 'primaryIdValue'
		             },{
		            	 data : 'primaryIdExpiry', type: 'date', dateFormat: 'DD/MM/YYYY', correctFormat: true
		             }, {
		            	 data : 'productCode'
		             }, {
		            	 data : 'remarks'
		             }, {
		            	 data : 'secondaryIdValue'
		             }, {
		            	 data : 'secondaryIdType'
		             }, {
		            	 data : 'secondaryIdExpiry' , type: 'date', dateFormat: 'DD/MM/YYYY', correctFormat: true
		             },  {
		            	 data : 'loanAmount'
		             }, {
		            	 data : 'statusLastUpdTime', type: 'date', dateFormat: 'DD/MM/YYYY', correctFormat: true
		             }, {
		            	 data : 'dob', type: 'date', dateFormat: 'DD/MM/YYYY', correctFormat: true
		             }, {
		            	 data : 'capturedDateTime', type: 'date', dateFormat: 'DD/MM/YYYY', correctFormat: true
		             }, {
		            	 data : 'batchSubmissionTime', type: 'date', dateFormat: 'DD/MM/YYYY', correctFormat: true
		             }, {
		            	 data : 'syncRetries'
		             }, {
		            	 data : 'batchCount'
		             }
		             ],

		             columnSorting: true,
		             contextMenu: true,
		             stretchH: 'all', //this prevents the tilted column header issue
					 afterChange: function (changes, source) {
                         if (source=== 'loadData') {
                            return; //don't do anything as this is called when table is loaded
                        }
                         
                        var rowIndex = changes[0];
                        changedRow.push(rowIndex);
                        var col = changes[1];
                        var oldCellValue = changes[2];
                        var newCellValue = changes[3];

                        
                        // apply your changes...
                        
                        console.log(rowIndex + " " + col + " "+ oldCellValue + " "+ newCellValue );
                      }
	});


	// This way, you can access Handsontable api methods by passing their names as an argument, e.g.:
	var hotInstance = $("#hoTable").handsontable('getInstance');
	
	var finalData = JSON.parse(JSON.stringify(hotInstance.getData()));
	//console.log("the type of finalData "+typeof(finalData));
	
	
	// the following should ideally affect only a copy of the HOT data, instead affects what is rendered also
	finalData.forEach(function reformatTheTimeBack(arrayItem2){
		
			var parts = arrayItem2.dob.split("/");
			var dt = new Date(parseInt(parts[2], 10),
			                  parseInt(parts[1], 10) - 1,
			                  parseInt(parts[0], 10)).getTime();

			arrayItem2.dob = dt;
			
			var parts2 = arrayItem2.capturedDateTime.split("/");
			var dt2 = new Date(parseInt(parts2[2], 10),
			                  parseInt(parts2[1], 10) - 1,
			                  parseInt(parts2[0], 10)).getTime();

			arrayItem2.capturedDateTime = dt2;
			
			var parts3 = arrayItem2.primaryIdExpiry.split("/");
			var dt3 = new Date(parseInt(parts3[2], 10),
			                  parseInt(parts3[1], 10) - 1,
			                  parseInt(parts3[0], 10)).getTime();

			arrayItem2.primaryIdExpiry = dt3;
			
			var parts4 = arrayItem2.secondaryIdExpiry.split("/");
			var dt4 = new Date(parseInt(parts4[2], 10),
			                  parseInt(parts4[1], 10) - 1,
			                  parseInt(parts4[0], 10)).getTime();

			arrayItem2.secondaryIdExpiry = dt4;
			
			var parts5 = arrayItem2.batchSubmissionTime.split("/");
			var dt5 = new Date(parseInt(parts5[2], 10),
			                  parseInt(parts5[1], 10) - 1,
			                  parseInt(parts5[0], 10)).getTime();

			arrayItem2.batchSubmissionTime = dt5;
			
			var parts6 = arrayItem2.statusLastUpdTime.split("/");
			var dt6 = new Date(parseInt(parts6[2], 10),
			                  parseInt(parts6[1], 10) - 1,
			                  parseInt(parts6[0], 10)).getTime();

			arrayItem2.statusLastUpdTime = dt6;
			
	});
	
	
	
	//dump contents to console
	$("#hot2console").click(function(){
		// console.log("hot2console button was clicked");
		//console.log(hotInstance.getData().toString());
		//$("#hoTableContents").append(JSON.stringify(hotInstance.getData()));
		//console.log(JSON.stringify(hotInstance.getData()));
		console.log(JSON.stringify(finalData));
	});

});