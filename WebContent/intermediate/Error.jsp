<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>Error...</title>
		<style>
			@import url('https://fonts.googleapis.com/css?family=Barrio');
			.centered {
			  position: fixed;
			  top: 50%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  /*
			  margin-top: -50px;
			  margin-left: -100px;
			  */
			}
		</style>
	</head>
	<body>
		<!-- Navigation bar -->
		<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">Group04</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="Homepage">Home</a></li>
		      <li><a href="Profile">Personal Profile</a></li>
		      <li><a href="Register.html">Logout</a></li>    <%-- log out remove session  --%>
		    </ul>
		  </div>
		</nav>
		<div class="centered" style="font-family: 'Barrio', cursive;width:400px;">
			<div class="row" style="font-size:250px">
				404
			</div>
			<div class="row" style="font-size:40px">
				<ul>
					<li>Please confirm the url again</li>
					<li>Or, please use the navigation bar to redirect <a href="Home">home</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>