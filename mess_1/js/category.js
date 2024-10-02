$(document).ready(function(){	
	
	var categoryRecords = $('#categoryListing').DataTable({
		"lengthChange": false,
		"processing":true,
		"serverSide":true,		
		"bFilter": true,
		'serverMethod': 'post',		
		"order":[],
		"ajax":{
			url:"category_action.php",
			type:"POST",
			data:{action:'listCategory'},
			dataType:"json"
		},
		"columnDefs":[
			{
				"targets":[0, 3, 4],
				"orderable":false,
			},
		],
		"pageLength": 10
	});		
	
	
	
	
	
	
	
	
});

