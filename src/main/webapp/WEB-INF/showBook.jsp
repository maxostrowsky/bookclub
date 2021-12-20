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
	<div class="container d-flex justify-content-between">
	<h1>${Book.title }</h1>
	<a href="/dashboard" class="btn btn-success">Go Back</a>
</div>
<div class="container d-flex flex-column">
	<p>Author: ${book.author }</p>
	<p>Book Description: ${book.description }</p>
	<a href="/book/edit/${book.id }">Edit</a>
</div>

</body>
</html>