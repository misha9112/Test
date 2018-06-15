<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" />
<ul class="menu">

	<c:if test="${sessionScope.id == null }">
		<a href="${pageContext.request.contextPath}/main" class="btn bg-1">홈으로</a>
		<a href="${pageContext.request.contextPath}/visit/visit" class="btn bg-1">방명록</a>
		<a href="${pageContext.request.contextPath}/photo/photo" class="btn bg-1">사진첩</a>
		<a href="${pageContext.request.contextPath}/user/login" class="btn bg-1">로그인</a>
		<a href="${pageContext.request.contextPath}/user/signup" class="btn bg-1">회원가입</a>
	</c:if>
	<c:if test="${sessionScope.id != null }">
		<a href="${pageContext.request.contextPath}/main" class="btn bg-1">홈으로</a>
		<a href="${pageContext.request.contextPath}/visit/visit" class="btn bg-1">방명록</a>
		<a href="${pageContext.request.contextPath}/photo/photo" class="btn bg-1">사진첩</a>
		<a href="${pageContext.request.contextPath}/views/logout" class="btn bg-1">로그아웃</a>
	</c:if>

</ul>