<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<h3 class="title text-center">Community</h3>
		</div>
		<div class="text-center bg-1">
			<jsp:include page="/views/menu.jsp" />
		</div>
		<br />
		<div class="container-flud text-center">
			<img src="../img/najarik.jpg" />
		</div>
		<br />
	</div>
	<div class="footer"></div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>