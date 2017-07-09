<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师资格认证</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/imgBig.js"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />

<style>
#preview {
	position: absolute;
	padding: 5px;
	display: none;
	color: #fff;
}
</style>

<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery(".failBtn").click(function() {
			jQuery("#failReason").attr("action", $(this).attr('name'));
		});

	});
</script>
</head>
<body style="overflow: scroll; margin: 0px auto;">
	<table class="table table-hover" style="background-color: #D6FAEB;">
		<thead>
			<tr>
				<th style="text-align: center;">用户名</th>
				<th style="text-align: center;">提交验证时间</th>
				<th style="text-align: center;">个人头像</th>
				<th style="text-align: center;">身份证件</th>
				<th style="text-align: center;">教学证件</th>
				<th style="text-align: center;" colspan="2">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.waitingValidateTeachers }"
				var="waitingValidateTeacher">
				<tr>
					<th style="text-align: center; vertical-align: middle;">${waitingValidateTeacher.username}</th>
					<th style="text-align: center; vertical-align: middle;"><fmt:formatDate
							value="${waitingValidateTeacher.parentStatuDate}"
							pattern="yyyy-MM-dd HH:mm:ss" /></th>
					<th style="width: 208px; height: 208px;"><a class="preview"
						rel="${pageContext.request.contextPath}${waitingValidateTeacher.userImage}" href="#"> <img
							src="${pageContext.request.contextPath}${waitingValidateTeacher.userImage}"
							style="width: 188px; height: 188px;"></a></th>
					<th style="width: 208px; height: 208px;"><a href="#"
						rel="${pageContext.request.contextPath}${waitingValidateTeacher.idImage}" class="preview"><img
							src="${pageContext.request.contextPath}${waitingValidateTeacher.idImage}"
							style="width: 188px; height: 188px;"></a></th>
					<th style="width: 208px; height: 208px;"><a href="#"
						rel="${pageContext.request.contextPath}${waitingValidateTeacher.teachImage}" class="preview"><img
							src="${pageContext.request.contextPath}${waitingValidateTeacher.teachImage}"
							style="width: 188px; height: 188px;"></a></th>
					<th style="text-align: center; vertical-align: middle;">
						<a style="margin-right: 20px;"
						class="btn btn-info" onClick="return confirm('点击确认通过审核？')"
						href="${pageContext.request.contextPath}/admin/checkedSuccess/${waitingValidateTeacher.id}/教师资格">审核通过</a>
						<a
						class="btn btn-info failBtn" data-toggle="modal"
						data-target="#myModal"
						name="${pageContext.request.contextPath}/admin/checkedFail/${waitingValidateTeacher.id}">审核不通过</a></th>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<nav style="text-align: center;">
	<ul class="pagination">
		<c:if test="${sessionScope.teachersCurrentPage!=1}">
			<li><a
				href="${pageContext.request.contextPath}/admin/findWaitingValidateTeachers?page=${sessionScope.teachersCurrentPage}&pageAction=pre"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
		</c:if>
		<c:forEach begin="${sessionScope.teachersBeginPage}"
			end="${sessionScope.teachersTotalPage}" var="v">
			<c:if test="${ v==teachersCurrentPage}">
				<li class="active"><a
					href="${pageContext.request.contextPath}/admin/findWaitingValidateTeachers?page=${v }">${v}</a></li>
			</c:if>
			<c:if test="${ v!=teachersCurrentPage}">
				<li><a
					href="${pageContext.request.contextPath}/admin/findWaitingValidateTeachers?page=${v }">${v}</a></li>
			</c:if>
		</c:forEach>
		<c:if
			test="${sessionScope.teachersTotalPage!=sessionScope.teachersCurrentPage}">
			<c:if test="${sessionScope.teachersTotalPage!=0}">
			<li><a
				href="${pageContext.request.contextPath}/admin/findWaitingValidateTeachers?page=${sessionScope.teachersCurrentPage}&pageAction=next"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
			</c:if>
		</c:if>
	</ul>
	</nav>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form id="failReason" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">审核不通过原因</h4>
					</div>
					<input type="hidden" name="type" value="教师资格">
					<div class="modal-body">
						<textarea rows="5" cols="78" style="resize: none;"
							placeholder="输入审核不通过原因" name="failReason"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="submit" class="btn btn-primary" id="reasonSumbit">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</form>
		</div>
		<!-- /.modal -->
	</div>
</body>

</html>