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
<link href="css/CartTable.css" rel="stylesheet" type="text/css">

<style>
	#logoutButton:hover {
		background-color: #52AEC2;
		color: #FFFFFF;
	}
	#logoutButton{
		color: #E65C00;
	}
</style>

<title>Cart</title>

<!--
			Bootstrap
=======================================
-->
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
<div class="container">
	<s:form action="removeCart">
		<s:textfield label="Item" value="Enter Name of Item to Remove" key="itemName"/>
		<s:textfield label="Quantity" key="removeQuantity"/>
		<s:submit value="Remove"/>
	</s:form> <br> <br>
	<div class="row">
		<div class="col-md-3 col-md-offset-3">
			<div id="CartList">
				<script>
					$(document).ready(function() {
						$.getJSON("viewCartItems", function(response){
							var $table = $("<table>").appendTo($("#CartList"));
							($table).addClass("table table-hover");
							var $thead = $("<thead>").appendTo($table);
							
							$("<tr>").appendTo($thead)
								.append($("<th>").text("Name:"))
								.append($("<th>").text("Cost:"));
							var $tbody = $("<tbody>").appendTo($table);
							$.each(response, function(index, cartItem) {
								$("<tr>").appendTo($tbody)
									.append($("<td>").text(cartItem.itemName))
									.append($("<td>").text(cartItem.itemPrice));
							});
						});
					});
				</script>
			</div>
		</div>
		<div class="col-mid-6">
		</div>
	</div>
	<div class="row">
		<div class="col-md-1 col-md-offset-4">
			<s:form action="checkout">
				<s:submit value="Checkout"/>	
			</s:form>
		</div>
	</div>
</div>

<script type="text/javascript" src="jquery-1.11.2.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>