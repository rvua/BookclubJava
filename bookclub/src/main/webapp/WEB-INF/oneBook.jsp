<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
</head>
<body>
	<a href="/dashboard">Back to Shelf</a>
	<div class="container">
	
		<h1>One Book</h1>
		<h4>
			<c:out value="${book.title}"></c:out>
		</h4>
		
		<br>
		
		<h4>Author</h4>
		<p>
			<c:out value="${book.author}"></c:out>
		</p>
		
		<br>
		
		<h3>Thoughts</h3>
		<p>
			<c:out value="${book.thought}"></c:out>
		</p>
		
		<br>
		<a href="/editBook/${id}">Edit Idea</a>
		<!-- <p>Attendees</p>
		<c:forEach var="i" items="${expense.attendees}">
			<p> <c:out value="${i.firstName} - ${i.lastName}"></c:out> </p>
		</c:forEach> -->
	</div>
</html>