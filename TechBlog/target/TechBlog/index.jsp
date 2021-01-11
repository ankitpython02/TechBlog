<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
		<style type="text/css"><%@include file="/css/style.css" %></style>

	</head>
	<body>
	<input type="checkbox" name="" class="btn-outline-light btn-lg fa fa-bolt"">
	<section>
	<!-- navbar -->
	
	<%@include file="/navbar.jsp"%>

	<!--banner  -->
	<div class="container-fluid p-0 ,m-0">
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome, Friends</h3>
				<h3>Tech Blog</h3>
				<p>Welcome to Technical Blog, world of technology Computer
					programming is the process of designing and building an executable
					computer program to accomplish a specific computing result.
					Programming involves tasks such as: analysis, generating
					algorithms, profiling algorithms' accuracy and resource
					consumption, and the implementation of algorithms in a chosen
					programming language (commonly referred to as coding).</p>
				<p>The source code of a program is written in one or more
					languages that are intelligible to programmers, rather than machine
					code, which is directly executed by the central processing unit.
					The purpose of programming is to find a sequence of instructions
					that will automate the performance of a task (which can be as
					complex as an operating system) on a computer, often for solving a
					given problem.</p>
				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-users "></span> Start, it's free
				</button>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-circle-o fa-spin"></span> Login
				</a>
			</div>
		</div>
	</div>

	<!-- cards -->
	
	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Python Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">C++ Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Angular Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">.Net Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">JQuery Programming</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="btn btn-primary primary-background text-white">Read
							More</a>
					</div>
				</div>

			</div>
		</div>
	</div>




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
	</section>
</body>
</html>