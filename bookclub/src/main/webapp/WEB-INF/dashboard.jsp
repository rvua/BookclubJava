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
	<a href="/newBook">+Add to my shelf</a>
	<a href="/logout">Logout</a>
	
	<div class="container">
		 <h1 display="inline">Welcome: <c:out value="${user.userName}"></c:out></h1>
		 <br>
		 <h2 display="inline">Books from everyones shelves</h2>
		 <br>
		 <table>
		 	<thead>
		 		<tr>
		 			<th class="align-middle">ID</th>
		 			<th class="align-middle">Title</th>
		 			<th class="align-middle">Author</th>
		 			<th class="align-middle">Posted By: </th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<c:forEach var="i" items="${books}">
		 			<tr>
		 				<td><c:out value="${i.id}"></c:out></td>
		 				<td><a href="/oneBook/${i.id}"><c:out value="${i.title}"></c:out></a></td>
		 				<td><c:out value="${i.author}"></c:out></td>
		 				<td><c:out value="${i.user.userName}"></c:out></td>
		 			</tr>
		 		</c:forEach>
		 	</tbody>
		 </table>
	</div>
</body>
</html>