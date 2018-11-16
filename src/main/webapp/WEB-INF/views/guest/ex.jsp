<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>index</title>
	<meta name="description" content="">
	<meta name="author" content="JOO">

	<meta name="viewport" content="width=device-width; initial-scale=1.0">

	<link rel="stylesheet" href="${R}../res/css/style.css">
	<link rel="stylesheet" href="${R}../res/css/prism.css">
	<link rel="StyleSheet" href="${R}../res/css/zooTree.css" />

	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="${R}../res/js/zooTree.js"></script>

	<script>
		$(document).ready(function(){
			$.ajax({
				async: false,
				type: "GET",
				url : "exexex",
				dataType: "json",
				cache: false,
				success:function(data){
					if(data.length == 0) {
					}else{
						$("#beforeJSON").html( JSON.stringify(data, null, "    ") );
						var jsonData = getTreeModel( data, '999',{
			            	id: "itemId",
			            	parentId: "parentId",
                            order: ["label","desc"]
						});
						$("#afterJSON").html( JSON.stringify(jsonData, null, "    ") );
						$(".verticalTree").zooTree(jsonData, {
							forceCreate: true,
							render: function(data) {
								var $a = $("<a>").append(data.label);
								return $a;
							}
						});
					}
				}
			});
		});
	</script>
</head>

<body>


	<div class="verticalTree"></div>

	<script src="${R}../res/js/prism.js"></script>
</body>
</html>
