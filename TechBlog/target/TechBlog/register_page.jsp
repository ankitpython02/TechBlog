<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css"><%@include file="/css/style.css" %></style>

</head>
<body>
<!-- navbar -->
	<%@include file="/navbar.jsp"%>
	<br>
	
	<main class="d-flex align-items-center ">
	<div class="container">
			<div class="col-md-6 offset-md-3">
			<div class="card">
					<div class="card-header primary-background text-white text-center">
					<span class="fa fa-user-plus fa-3x"></span>
					<br>
						<p>Register Here</p>
					</div>
					<div class="card-body">
					<form id="reg-form" action="register" method="post" modelAttribute="user">
					<div class="form-group">
							<label for="name">User Name</label> <input
								type="text" class="form-control" id="name" name="name"
								aria-describedby="emailHelp"> <small id="name"
								class="form-text text-muted">Please share your name</small>
						</div>
					
						<div class="form-group">
							<label for="email">Email address</label> <input
								type="email" class="form-control" id="email" name="email"
								aria-describedby="emailHelp"> <small id="email"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>
						
						<div class="form-group">
							<label for="password">Password</label> <input name="password"
								type="password" class="form-control" id="password">
						</div>
						<div class="form-group">
							<label for="gender">Select Gender</label>
							<br>
							<input type="radio" id="gender" name="gender" value="Male">Male
							<input type="radio" id="gender" name="gender" value="Female">Female
						</div>
						
						<div class="form-group">
							<textarea name="about" class="form-control" id="about" rows="5" placeholder="Enter Something about yourself"></textarea>
						</div>
						
						<div class="form-group form-check">
							<input type="checkbox" class="form-check-input" name="check"
								id="check"> <label class="form-check-label"
								for="check">Terms & Condition</label>
						</div>
						<!-- <br>
						<div class="container text-center" id="loader">
						<span class="fa fa-refresh fa-spin fa-4x"></span>
						<h4>Please Wait...</h4>
						</div> -->
						<button type="submit" class="btn text-white primary-background">Submit</button>
					</form>
				</div>
					</div>
			</div>
			</div>
			</main>

				<!-- javascprit -->
				<script src="https://code.jquery.com/jquery-3.4.1.min.js"
						integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
						crossorigin="anonymous"></script>
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
						integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
						crossorigin="anonymous"></script>
					<script
						src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
						integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
						crossorigin="anonymous"></script>
					<script type="text/javascript"> <%@include file="/js/techblog.js" %> </script>
					<script type="text/javascript"></script>
					
					<!-- <script>
					$(document).ready(function()
					{
						console.log("loaded....")
						$("#reg-form").on("submit", function(event){
							event.preventDefault();
							
							let form = new FormData(this);
							
							$.ajax({
								url: "register",
								type: "POST",
								data: form,
								success: function(data, textStatus , jqXHR) {
									console.log(data)
									console.log("After success")
								},
								error: function(jqXHR, textStatus , errorThrown){
									console.log(jqXHR)
									console.log("After failure")
								},
								processData: false,
								contentType: false
								
							});
							
						});
						
					}); 
	
		</script> -->
	
</body>
</html>