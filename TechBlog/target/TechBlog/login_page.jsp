<%@page import="com.techblog.entities.MyMessages"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css"><%@include file="/css/style.css" %></style>
</head>
<body>
	
	<!-- navbar -->
	<%@include file="/navbar.jsp"%>
	<br>
	
	<main class="d-flex align-items-center ">
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header primary-background text-white text-center">
					<span class="fa fa-user fa-3x"></span>
					<br>
						<p>Login Here</p>
					</div>
					<%
						MyMessages m = (MyMessages) session.getAttribute("msg");
						if (m != null) {
					%>
					<div class="alert <%= m.getCssClass() %>" role="alert">
						<%=m.getContent()%>
					</div>
					<%
						session.removeAttribute("msg");
						}
					%>
					<div class="card-body">
						<form action="login" method="post">
							<div class="form-group">
								<label for="email">Email address</label> <input
									type="email" class="form-control" id="email" name="email"
									aria-describedby="emailHelp"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input
									type="password" class="form-control" id="password" name="password">
							</div>
							<button type="submit" class="btn text-white primary-background">Submit</button>
						</form>
					</div>
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
	<script type="text/javascript"><%@include file="/js/techblog.js" %></script>
</body>
</html>