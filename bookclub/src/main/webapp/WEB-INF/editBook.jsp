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
		<h1><c:out value="${user.userName}"></c:out></h1>
		<h1 display="inline">Edit a book</h1>
		<form:form action="/editingBook/${book.id}" method="post" modelAttribute="book">
			<input type="hidden" name="_method" value="put">
			<input type="hidden" name="user" value="${book.user.id}"/>
				<div class="form-group">
					<form:label path="title">Title:</form:label>
					<form:errors path="title" class="text-danger" />
					<form:input path="title" class="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="author">Author:</form:label>
					<form:errors path="author" class="text-danger" />
					<form:input path="author" class="form-control" />
				</div>
				
				<div class="form-group">
					<form:label path="thought">My Thoughts:</form:label>
					<form:errors path="thought" class="text-danger" />
					<form:textarea path="thought" class="form-control" />
				</div>
				<div class="form-group">
					<input type="submit" value="submit"> 
				</div>
		</form:form>
	</div>
</body>
</html>