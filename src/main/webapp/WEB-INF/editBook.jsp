<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-5 d-flex justify-content-between align-items-center">
		<h1>Edit a Book!</h1>
		<a href="/dashboard">Back to the shelf</a>
	</div>
	<div class="container mt-5">
			<form:form action="/book/edit/${book.id }" method="post" modelAttribute="book" class="form">
			<input type="hidden" name="_method" value="put">
			<form:label path="title" class="form-label">Title</form:label>
			<form:errors path="title" class="text-danger" />
			<form:input path="title" type="text" class="form-control" />
			
			<form:label path="author" class="form-label">Author</form:label>
			<form:errors path="author" class="text-danger" />
			<form:input path="author" type="text" class="form-control" />
			
			<form:label path="description" class="form-label">Description</form:label>
			<form:errors path="description" class="text-danger" />
			<form:input path="description" type="text" class="form-control" />
			
			<form:hidden path="user" value="${user_id }"></form:hidden>
			
			<button class="btn btn-primary mt-3">Submit</button>
			
			</form:form>
			<form action="/book/delete/${book.id }" method="post">
    			<input type="hidden" name="_method" value="delete">
    			<input class="btn btn-danger btn-sm" type="submit" value="Delete">
			</form>
	</div>
</body>
</html>