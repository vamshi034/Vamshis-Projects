<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<script type="text/javascript" src="jquery-1.11.2.js"></script>

<!--Bootstrap-->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>Login Page</title>
    <sb:head/>
<script>
$(document).ready(function(){
	var currentURL = document.location.href;
	if(currentURL == "http://localhost:8080/Ecommerce/logout" || currentURL == "http://52.4.60.149:8080/Ecommerce/logout"){
		$("#errorRemover span").remove("span");
		$("#errorRemover .control-group").removeClass("error");		
	}
});

</script>
</head>

<body>

<div class="container">
		<button type="button" data-toggle="modal" data-target="#newUserModal">Create New User</button>
<div class="modal fade" id="newUserModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				
					<div class="modal-header">
						<h4>Create New User</h4>
					</div>
					<div class="modal-body">
						<p>some text goes in here</p>				
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary" data-dismiss="modal">Close</a>
					</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>