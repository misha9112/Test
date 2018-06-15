<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function fileCheck(obj) {
		var point = obj.value.lastIndexOf('.');
		var extension = obj.value.substring(point + 1, obj.value.length);

		if (extension != "jpg" && extension != "gif" && extension != "png") {
			alert("이미지 이외의 파일은 업로드 할 수 없습니다.");

			var parent = obj.parentNode;
			var next = obj.nextSibling;
			var tmp = document.createElement("form");
			tmp.appendChild(obj);
			tmp.reset();
			parent.insertBefore(obj, next);
		}
	}
</script>
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
		<form action="${pageContext.request.contextPath }/photo/insert"
			class="form-inline" method="post" enctype="multipart/form-data">
			<input type="hidden" id="u_id" name="u_id" value="${sessionScope.id}" />
			<div class="form-group">
				<input type="file" id="content" name="content" class="form-control"
					required accept="image/gif, image/jpeg, image/png"
					onchange="fileCheck(this)" />
			</div>
			<button type="submit" class="btn btn-default">사진추가</button>
		</form>
		<c:if test="${empty photoList }">
			<div class="text_center">등록된 사진이 없습니다.</div>
		</c:if>
		<div class="content">
			<c:forEach var="pvo" items="${photoList }">
				<div class="photo">
					<img src="../upload/${pvo.content }" alt="" />
					<div class="p_title text_center">${pvo.regdate }</div>
				</div>
				<hr />
			</c:forEach>
		</div>
		<br />
	</div>
	<div class="footer"></div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>