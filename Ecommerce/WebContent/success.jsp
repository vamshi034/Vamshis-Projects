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
<title>Insert title here</title>

<style>
	/* Center align the text within the three columns below the carousel */
	.marketing .col-lg-4 {
		margin-bottom: 20px;
	 	text-align: center;
	}
	.marketing h2 {
	 	font-weight: normal;
	}
	.marketing .col-lg-4 p {
	 	margin-right: 10px;
	 	margin-left: 10px;
	}
	
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

<!--Bootstrap-->
<link href="css/bootstrap.css" rel="stylesheet" media="screen">
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
      <a href="success.jsp" class="navbar-brand" >Vamshi's Ecommerce Site</a>
    </div>

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
			Carousel
=======================================
-->
<div class="container">
	<h2 style="text-align:center">
		Featured Items:
	</h2>
	<div class="row">
		<div id="featuresCarousel" class="carousel slide">
			
			<ol class="carousel-indicators">
				<li data-target="#featuresCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#featuresCarousel" data-slide-to="1"></li>
				<li data-target="#featuresCarousel" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img src="pictures/Image 1.JPG" alt="Image 1" class="img-responsive">
					<div class="carousel-caption">
						<h3>Item 1</h3>
						<p><a class="btn btn-lg btn-primary" href="Item1111.jsp">Learn more</a></p>
					</div>
				</div>
				
				<div class="item">
					<img src="pictures/Image 2.JPG" alt="Image 2" class="img-responsive">
					<div class="carousel-caption">
						<h3>Item 2</h3>
						<p><a class="btn btn-lg btn-primary" href="Item1112.jsp">Learn more</a></p>
					</div>
				</div>
				
				<div class="item">
					<img src="pictures/Image 3.JPG" alt="Image 3" class="img-responsive">
					<div class="carousel-caption">
						<h3>Item 3</h3>
						<p><a class="btn btn-lg btn-primary" href="Item1113.jsp">Learn more</a></p>
					</div>
				</div>
			</div>
			
			<a class="carousel-control left" href="#featuresCarousel" data-slide="prev">
				<span class="icon-prev"></span>
			</a>
			
			<a class="carousel-control right" href="#featuresCarousel" data-slide="next">
				<span class="icon-next"></span>
			</a>
		</div>
	</div>
</div>



<div class="container marketing" style="padding-top:2.5%">
	<div class="row">
        <div class="col-lg-4">
          <a href="Item1111.jsp"><img class="img-circle" src="pictures/Image 1.JPG" width="140" height="140"></a>
          <p style="text-align:center">Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh
           ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
        </div>
		<div class="col-lg-4">
			<a href="Item1112.jsp"><img class="img-circle" src="pictures/Image 2.JPG"  width="140" height="140"></a>
			<p style="text-align:center">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl est, finibus ac cursus
			vitae, porta sed nisl. Aenean efficitur mi vitae libero faucibus, vel sodales ligula sagittis.
			In sed.</p>
		</div>
		<div class="col-lg-4">
			<a href="Item1113.jsp"><img class="img-circle" src="pictures/Image 3.JPG" width="140" height="140" ></a>
			<p style="text-align:center">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl est, finibus ac cursus
			vitae, porta sed nisl. Aenean efficitur mi vitae libero faucibus, vel sodales ligula sagittis.
			In sed.</p>
		</div>
	</div>

	
</div>

<script type="text/javascript" src="jquery-1.11.2.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>