<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	function del(id) {
		if (confirm('정말로 삭제하시겠습니까?')) {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/visit/delete",
						type : "post",
						data : {
							id : id
						},
						success : function(data) {
							alert("삭제가 완료 되었습니다.");
							location.href = "${pageContext.request.contextPath}/views/visit";
						}
					});
		}
	}

	function check(f) {
		if (/^.{1,2000}$/.test(f.content.value) == false) {
			alert("내용은은 2000글자 미만으로 작성하셔야 합니다.");
			f.content.focus();
			return;
		}

		f.submit();
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
		<form action="${pageContext.request.contextPath}/visit/insert"
			method="post" class="form-inline">
			<input type="hidden" name="u_id" value="${sessionScope.id }" />
			<div class="form-group">
				<textarea class="form-control" id="name" name="content" cols="80"
					rows="2"></textarea>
				<button type="button" class="btn" onclick="check(this.form);">등록</button>
			</div>
		</form>
		<hr />
		<c:if test="${empty visitList }">
			<div class="text_center">등록된 글이 없습니다.</div>
		</c:if>
		<div>
			<c:forEach var="vvo" items="${visitList }">
				<div class="form-group form-inline">

					<div class="v_comment">${vvo.content }
						<br />
					</div>
					<div class="form-group">
						<div class="v_title">${vvo.u_id } <small>${vvo.regdate }</small>
						</div>
					</div>
					<button type="button" class="btn btn-sm" onclick="del(${vvo.id})">삭제</button>
				</div>
			</c:forEach>
		</div>
		<hr />
	</div>
	<div class="footer"></div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>