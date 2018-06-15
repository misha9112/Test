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
	var dualCheck = false;

	function checkPwd() {
		var password = $("#password").val();
		var password_check = $("#password_check").val();
		if (password_check == "") {
			$("#alert").html("");
		} else if (password == password_check) {
			$("#alert").html("success");
		} else {
			$("#alert").html("please check the password")
		}
	}

	function checkId() {
		var id = $("#id").val();
		console.log(1);
		$.ajax({
			type : "post",
			url : "/user/dualCheck",
			data : {
				id : id
			},
			success : function(data) {
				if (data == 'y') {
					alert("중복된 아이디 입니다.");
				} else if (data == 'n') {
					alert("사용 가능한 아이디 입니다.");
					dualCheck = true;
				} else {
					alert("잠시후 다시 시도해 주세요.");
				}
			}
		});
	}

	function check(form) {
		if (form.id.value == "") {
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return;
		}

		if (dualCheck == false) {
			alert("중복확인을 해주세요.");
			return;
		}

		if (form.password.value == "") {
			alert("패스워드를 입력해 주세요.");
			form.password.focus();
			return;
		}

		if ($("#alert").html() != "success") {
			alert("두 비밀번호가 일치하지 않습니다.");
			return;
		}

		if (form.name.value == "") {
			alert("이름을 입력해 주세요.");
			form.name.focus();
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
			<jsp:include page="../menu.jsp" />
		</div>
		<br />
		<div class="main container">
			<div class="row">
				<div class="col-sm-14">
					<form action="${pageContext.request.contextPath }/user/signup"
						class="form-horizontal" method="post">
						<div class="form-group">
							<label for="id" class="col-xs-4 control-label">아이디(*)</label>
							<div class="col-xs-3">
								<input type="text" id="id" name="id" class="form-control" />
							</div>
							<div class="col-xs-3">
								<button type="button" class="btn btn-default" onclick="checkId()">중복확인</button>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-xs-4 control-label">패스워드(*)</label>
							<div class="col-xs-3">
								<input type="password" id="password" name="password"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="password_check" class="col-xs-4 control-label">패스워드확인(*)</label>
							<div class="col-xs-3">
								<input type="password" id="password_check" class="form-control"
									onkeyup="checkPwd()" />
							</div>
							<div class="col-xs-3">
								<span id="alert"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-xs-4 control-label">이름</label>
							<div class="col-xs-3">
								<input type="text" id="name" name="name" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-xs-4 control-label">전화번호</label>
							<div class="col-xs-3">
								<input type="text" id="phoneNum" name="phoneNum"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-xs-4 control-label">주소</label>
							<div class="col-xs-3">
								<input type="text" id="addr" name="addr" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-xs-4 control-label">이메일</label>
							<div class="col-xs-3">
								<input type="text" id="email" name="email" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<button type="button" class="btn btn-default" onclick="check(this.form)">제출</button>
								<button type="button" class="btn btn-default" onclick="location.href='../views/main'">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<br />
	</div>
	<div class="footer"></div>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>