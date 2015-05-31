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
<!-- Custom CSS -->
<style>
	#loginForm {
		margin-top: 10%;
	}
	
	body {
		background: url("pictures/blueBackground.png") no-repeat fixed;
	    -webkit-background-size: cover;
	    -moz-background-size: cover;
	    -o-background-size: cover;
	    background-size: cover;
	}
	
	#orangeButton {
		padding-left: 22.7%;
	}
	#createNewUserLink:hover{
		color:white;
	}
	#createNewUserLink{
		color:black;
	}

</style>
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
<!--
			NavBar
=======================================
-->
<div class="navbar navbar-inverse navbar-static-top">
	<div class="container">
	
		<a id="something" class="navbar-brand" style="color:orange">Please Note: Site under construction</a>
		
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-xs-4 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4">
			<!--
					Login Form
			=======================================
			-->
			<div id="errorRemover"> <!-- TODO: Find an alternative to fix redundant errors on logout. -->
			<s:form id="loginForm" action="asdf" enctype="multipart/form-data" theme="bootstrap" cssClass="well form-search" method="post" validate="true">
				<div class="form-group">
					<s:textfield label="Login ID" key="userId" />
				</div>
				<div class="form-group">
					<s:password label="Password" key="password" />
				</div>
				<s:submit cssClass="btn btn-primary" />
			</s:form>
			</div>
			<!--
					Create New User Form
			=======================================
			-->
			<div class="panel-group" id="accordion">
				<div class="panel panel-info" style="border-style:#0e2f44" >
					<div class="panel-heading" style="background:#0e2f44;">
						<h4 class="panel-title" id="orangeButton" style="background:#0e2f44">
							<a id="createNewUserLink"class="btn btn-warning" href="#collapseone" data-toggle="collapse" data-parent="accordion">
								Create New User:
							</a>
						</h4>
					</div>
					<div id="collapseone" class="panel-cllapse collapse" style="background:#0e2f44">
						<div class="panel-body">
							<s:form action="newUser" enctype="multipart/form-data" theme="bootstrap" cssClass="well form-search" validate="true">
								<div id="userNameValidation" class="form-group">
									<s:textfield label="Login ID: " key="newUserId"/>
								</div>
								<div class="form-group">
									<s:password label="Password: " key="newPassword"/>
								</div>
								<div class="form-group">
									<s:textfield label="Starting balance: " key="newBalance"/>
								</div>
								<s:submit />
							</s:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="js/bootstrap.min.js"></script>
<script>
	var temp = "";
	$(document).ready(function(){
		temp = $("#userNameValidation span").text();
		if(temp.indexOf("This User Name") >= 0){
			$("#collapseone").addClass("in");
		}
		if(temp.indexOf("You must") >= 0){
			$("#collapseone").addClass("in");
		}
		if(temp.indexOf("Invalid field") >= 0){
			$("#collapseone").addClass("in");
		}
	})
</script>
</body>
</html>