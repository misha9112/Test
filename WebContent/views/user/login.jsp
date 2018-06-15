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
<script>
	function check(form) {
		console.log(1);
		console.log(form.id.value);
		console.log(form.password.value);
		if (form.id.value == "") {
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return;
		}
		if (form.password.value == "") {
			alert("패스워드를 입력해 주세요.");
			form.password.focus();
			return;
		}
		form.submit();
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
		<div class="row">
			<div class="col-sm-15">
				<form id="form"
					action="${pageContext.request.contextPath }/user/login"
					class="form-horizontal" method="post">
					<div class="form-group">
						<label for="id" class="col-xs-4 control-label">아이디</label>
						<div class="col-xs-3">
							<input type="text" id="id" name="id" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-xs-4 control-label">패스워드</label>
						<div class="col-xs-3">
							<input type="password" id="password" name="password" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
							<button type="button" class="btn btn-default"
								onclick="check(this.form)">로그인</button>
							<button type="button" class="btn btn-default"
								onclick="location.href='/views/main'">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br />
	<div class="footer"></div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>