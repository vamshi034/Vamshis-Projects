<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="jquery-1.11.2.js"></script>

<style>
	#logoutButton:hover {
		background-color: #52AEC2;
		color: #FFFFFF;
	}
	#logoutButton{
		color: #E65C00;
	}
</style>

<script type="text/javascript">
	function logout() 
	{
		window.location = "${pageContext.request.contextPath}/logout";
	}
</script>

<!--
			Bootstrap
=======================================
-->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
<title>Insert title here</title>
</head>
<body>
<!--
			NavBar
=======================================
-->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarCollapse1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="success.jsp" class="navbar-brand">Vamshi's Ecommerce Site</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbarCollapse1">
    	<ul class="nav navbar-nav navbar-right">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					User Info<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li id="something">
						<script>
							$(document).ready(function() {
								$.getJSON("getUserBalance", function(response){
									$("#something").html("<a> Your current balance (.getJSON): "+response+" Units</a>");
								});
							});
						</script>
					</li>
					<li class="divider"></li>
					<li><a>You're logged in as: <s:property value="#session.userName"/></a></li>
				</ul>
			</li>
			<li><a href="Cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> View Cart</a></li>
			<li><a href="#">Home</a></li>
			<li><a id="logoutButton" onClick="logout();" class="btn btn-info">Logout</a></li>
		</ul>
    </div>
  </div>
</nav>

<!--
			Item content
=======================================
-->

<div class="container">
	<div class="row">
			<div class="col-md-4">
				<img src="pictures/Image 3.JPG" class="img-responsive">
			</div>
			<div class="col-md-5">
				<h1>Item 3</h1>
				<h4>Price: <span style="font-size:130%; color:red;"> 49.99 Units</span></h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam iaculis
				 tincidunt sem eget sodales. Etiam vel felis a ligula blandit lacinia ut
				  gravida arcu. Suspendisse pellentesque ligula at consectetur ultrices.
				   Donec sollicitudin suscipit erat, eget ornare metus. Proin elementum
				    iaculis dolor, et semper turpis finibus sed. Suspendisse dictum libero
				     id ex lobortis, sit amet facilisis enim consequat.</p>
			</div>
			<div class="col-md-3">
				<s:form action="addCart">
					<s:textfield label="Item" key="itemName" value="Item 3"/>
					<s:textfield label="Price" key="price" value="49.99" readonly="true"/>
					<br><br>
					<s:submit/>
				</s:form>
			</div>
	</div>
</div>

<script type="text/javascript" src="jquery-1.11.2.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>