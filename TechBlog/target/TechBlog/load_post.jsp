<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  isELIgnored="false" isErrorPage="true"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.techblog.entities.Post"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">

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
			<table>
			<tr>
						
						<td>title</td>
						<td>content</td>
						<td>code</td>
						<td>link</td	>
			</tr>
					<c:forEach items="${list}"  var="allpost">
					<tr>
						<td>${allpost.title}</td>
						<td>${allpost.content}</td>
						<td>${allpost.code}</td>
						<td>${allpost.link}</td>
					</tr>
					</c:forEach>
			
			
			
			</table>

<%-- <div class="row">

<div class="col-md-6 mt-2">

<div class="card">

<div class="card-body">
<c:forEach items= "${post}"  var = "post" >

<b>${post.id}</b>

</c:forEach>

</div>







</div>
</div>

</div> --%>





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


<!-- <script>
$(document).ready(function() {
		
	$.ajax({
			        type: "GET",
			        url: 'getAllPost', // the URL of the controller action method
			        data: null, // optional data
			        success: function(result)
			        {
			             // do something with result
			        },                
			        error : function(req, status, error) 
			        {
			             // do something with error   
			        }
    });

    });
	
	
</script> -->
								
								
</body>
</html>