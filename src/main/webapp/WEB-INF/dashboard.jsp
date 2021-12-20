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
	<div class="container mb-3 mt-4">
		<h1>Welcome ${user.name }!</h1>
		<p>Books from everyone's shelves:</p>
	</div>
	<div class="container mb-3 mt-4">
		<a href="/logout">Logout</a>
		<a href="/book/new">Add a book to my shelf</a>
	</div>
	<div class="container mt-5">
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${books }">
					<tr>
						<td>${book.id }</td>
						<td><a href="/book/${book.id}">${book.title }</a></td>
						<td>${book.author }</td>
						<td>${book.user.name }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>