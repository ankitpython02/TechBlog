<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" isErrorPage="true"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.techblog.entities.User"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 
<% 
/* Caterogies caterogies = (Caterogies)session.getAttribute("caterogies"); */
ModelAndView modelAndView = new ModelAndView();
User user = (User)session.getAttribute("currentUser"); 
if(user==null){
	
	modelAndView.setViewName("login_page");
} 

%>

<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>User LoggedIn</title>

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
				
											<!-- Start of navbar -->

							<nav class="navbar navbar-expand-lg navbar-dark primary-background">
								<a class="navbar-brand" href="index.jsp"><span
									class="fa fa-desktop"></span> Tech Blog</a>
								<button class="navbar-toggler" type="button" data-toggle="collapse"
									data-target="#navbarSupportedContent"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="navbar-toggler-icon"></span>
								</button>
						
								<div class="collapse navbar-collapse" id="navbarSupportedContent">
									<ul class="navbar-nav mr-auto">
										<li class="nav-item active"><a class="nav-link" href="#">Learn
												Code <span class="sr-only">(current)</span>
										</a></li>
										<li class="nav-item dropdown"><a
											class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"> Categories </a>
											<div class="dropdown-menu" aria-labelledby="navbarDropdown">
												<a class="dropdown-item" href="#">Programming</a> <a
													class="dropdown-item" href="#">Data Structure</a>
												<div class="dropdown-divider"></div>
												<a class="dropdown-item" href="#">Project Implementation</a>
											</div></li>
										<li class="nav-item"><a class="nav-link" href="load_post.jsp">Contact</a></li>
										<li class="nav-item"><a class="nav-link" href="#"
											data-toggle="modal" data-target="#add-post-modal">Write Your
												Post</a></li>
									</ul>
									<ul class="navbar-nav mr-right">
										<li class="nav-item"><a class="nav-link" href="#!"
											data-toggle="modal" data-target="#profile-model"><span
												class="fa fa-user-circle"></span> <%=user.getName()%></a></li>
										<li class="nav-item"><a class="nav-link" href="logout"><span
												class="fa fa-user-plus "></span> Logout</a></li>
						
									</ul>
								</div>
							</nav>

											<!-- end of navbar -->
											
			<!--Start of  Main body of the page  -->							
											
		<main>
			<div class="container">
				<div class="row">
		
		<!-- 	first col -->
		
					<div class="col-md-4">
					<br>
						<!-- categories -->
				<div class="list-group">
					<from >
					<a class="list-group-item list-group-item-action active text-white primary-background" id="all_post">All Post</a>
					<c:forEach items= "${list}"  var = "cat" >
					<a class="list-group-item list-group-item-action">
					${cat.name}</a>
					</c:forEach>
					</from>
				</div>

			</div>
					
		<!-- 	Second col -->
					
					<div class="col-md-8">
						<!-- post -->
						<div id="loader" class="container text-center">
						<i class="fa fa-refresh fa-4x fa-spin mt-3"></i>
						<h3>Loading........</h3>
						</div>
						<div class="container-fluid"  id="post_container">
						
						<div class="row">

							<div class="col-md-6">
								<c:forEach items="${post}"  var="allpost">
								<div class="card mt-2">
								<div class="card-body">
								
								<b>${allpost.title}</b>
								<p>${allpost.content}</p>
								<pre>${allpost.code}</pre>
								
								</div>

								</div>
								</c:forEach>
								</div>

								</div>
						
						
						
						</div>
					
					</div>
		
				</div>
		
			</div>
			
		</main>		
										
			<!--End OF Main body of the page  -->									
											
										<!-- Start of Profile Model -->
				
					<div class="modal fade" id="profile-model" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header primary-background text-white">
									<h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="container text-center">
										<img src="img/guest-user.jpg" <%=user.getDisplay() %>
											class="img-fluid" style="border-radius: 30%; max-width: 100px" />
										<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
										<!-- details -->
				
										<div id="profile_detail">
											<table class="table">
												<tbody>
													<tr>
														<th scope="row">Id:</th>
														<td><%=user.getId()%></td>
				
													</tr>
				
													<tr>
														<th scope="row">Email:</th>
														<td><%=user.getEmail()%></td>
				
													</tr>
													<tr>
														<th scope="row">Gender:</th>
														<td><%=user.getGender()%></td>
				
													</tr>
													<tr>
														<th scope="row">About:</th>
														<td><%=user.getAbout()%></td>
				
													</tr>
												</tbody>
											</table>
										</div>
				
										<!-- 	Start of Edit Details -->
				
										<div id="profile_edit" style="display: none">
											<h3 class="mt-2">Please Edit Your Profile</h3>
											<form modelAttribute="userUpdate" method="post"
												action="updateProfile?id=<%=user.getId()%>">
												<table class="table">
													<tr>
														<th scope="row">Id:</th>
														<td><%=user.getId()%></td>
													</tr>
													<tr>
														<th scope="row">Name:</th>
														<td><input type="text" class="form-control" name="name"
															value="<%=user.getName()%>"></td>
													</tr>
													<tr>
														<th scope="row">Email:</th>
														<td><input type="email" class="form-control" name="email"
															value="<%=user.getEmail()%>"></td>
													</tr>
													<tr>
														<th scope="row">Password:</th>
														<td><input type="password" class="form-control"
															name="password" value="<%=user.getPassword()%>"></td>
													</tr>
													<tr>
														<th scope="row">Gender:</th>
														<td><%=user.getGender()%></td>
													</tr>
													<tr>
														<th scope="row">About:</th>
														<td><textarea class="form-control" name="about" rows="3"><%=user.getAbout()%></textarea>
														</td>
													</tr>
												</table>
												<div class="container">
													<button type="submit" class="btn primary-background text-white">Save</button>
				
												</div>
											</form>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" id="edit-profile-btn" class="btn text-white primary-background">Edit</button>
								</div>
							</div>
						</div>
					</div>
				
					<!-- 	End of Edit Details -->
				
				<!-- End of Profile Model -->
				
						
				<!-- Start of Post Model -->
				
						<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Please Post
											Your Content</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
								
										<form id="add_post" action="addPost?id=<%=user.getId()%>" method="post"  modelAttribute="postform">
											
											 <div class="form-group">
												
												<select class="form-control">
												<option selected disabled>---Select Category---</option>
												<c:forEach items= "${list}"  var = "cat" >
												<option>${cat.name}</option>
												</c:forEach>
												</select>
											</div> 
											<div class="form-group">
												<label for="title">Title</label> <input
													placeholder="Please share your post Title.....	" type="text"
													class="form-control" id="title" name="title">
											</div>
					
											<div class="form-group">
												<label for="content">Content</label>
												<textarea name="content" class="form-control" id="content" rows="2"
													placeholder="Enter Content of your Blog...."></textarea>
											</div>
											<div class="form-group">
												<label for="code">Programming Code</label>
												<textarea name="code" class="form-control" id="code" rows="2"
													placeholder="Enter Programming Code of your Blog (if any)..."></textarea>
											</div>
											<div class="form-group">
												<label for="link">Link</label> <input
													placeholder="Paste your Link Here.....	" type="text"
													class="form-control" id="link" name="link">
											</div>
											<div class="container text-center">
											<button type="submit" id= "postSave" class="btn primary-background text-white">POST</button>
											</div>
										</form>
				
									</div>
									
								</div>
							</div>
						</div>

					<!-- End of Post Model -->


					<!-- javascprit -->
				<script src="https://code.jquery.com/jquery-3.4.1.min.js"
						integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
						crossorigin="anonymous"></script>
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
						integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
						crossorigin="anonymous"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
					</script>
					<script
						src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
						integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
						crossorigin="anonymous"></script>
					<script type="text/javascript"><%@include file="/js/techblog.js" %></script>
						<script src="https://cdn.jsdelivr.net/npm/darkmode-js@1.5.5/lib/darkmode-js.min.js"></script>
					
					
	<script>


		$(document).ready(function() 
		
		{
			
		$("#post_container").hide();		

			/* Edit button function */
			
			let editStatus = false;			//Just a variable

			$('#edit-profile-btn').click(function() {

				if (editStatus == false) {

					//alert("butttttttt")

					$('#profile_detail').hide()

					$('#profile_edit').show()

					editStatus = true;
					$(this).text("Back")

				} else {

					$('#profile_detail').show()

					$('#profile_edit').hide()

					editStatus = false;
					$(this).text("Edit")

				}

			});

			/* End of Edit button function */

			
			/* Sweat alert function */
			$('#postSave').click(function() {

				if (postStatus == true) {
					swal("Good job!", "Your post have be saved!!", "success");

				} else {
					swal("Do Again!!", "Please, Update again!!", "failed");

				}

			});
			/* End of Sweat alert function */

			
			
			/* Loading Categories with ajax function */
			$.ajax({
				type : "GET",
				url : 'getCat', // the URL of the controller action method
				data : null, // optional data
				success : function(result) {
					// do something with result
				},
				error : function(req, status, error) {
					// do something with error   
				}
			});

			/*End of Loading Categories with ajax function */

			
			/* Loading all post with ajax function */
			$('#all_post').click(function() {

				let post = false;

				if (post == false) {

					$.ajax({
						type : "GET",
						url : 'getAllPost', // the URL of the controller action method
						data : null, // optional data
						success : function(result) {
							$("#loader").hide();
							$("#post_container").show();
							// do something with result
						},
						error : function(req, status, error) {
							// do something with error   
						}
					});
				} else {

					$("#loader").hide();
					post = false;
				}

			});

			/*End of Loading all post with ajax function */

		});
	</script>

</body>
</html>