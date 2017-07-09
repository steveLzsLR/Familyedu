<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>管理员用户登录</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/loginstyle.css">
	<!--[if IE]>
		<script src="${pageContext.request.contextPath}/js/html5shiv.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
	<![endif]-->
	<script>
	function adminError(){
		alert("管理员账户或密码错误，请重新输入登录");
	}
</script>
	<%
		if (session.getAttribute("adminError") != null) {
			out.print("<script type='text/javascript'>adminError();</script>");
			session.removeAttribute("adminError");
		}
	%>
	
</head>
<body>
	
	<div class="demo" style="padding: 100px 0;">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-4 col-md-4">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/admin/sign_in" method="post">
						<span class="heading">后台用户登录</span>
						<div class="form-group">
							<input name="username"type="text" class="form-control" id="inputEmail3" placeholder="在此键入用户名">
							<i class="fa fa-user"></i>
						</div>
						<div class="form-group help">
							<input name="password" type="password" class="form-control" id="inputPassword3" placeholder="在此键入密码">
							<i class="fa fa-lock"></i>
							<a href="#" class="fa fa-question-circle"></a>
						</div>
						<div class="form-group">
							<div class="main-checkbox">
								<input name="password" type="checkbox" value="None" id="checkbox1" name="check"/>
								<label for="checkbox1"></label>
							</div>
							<span class="text">记住密码</span>
							<button type="submit" class="btn btn-default">登录</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>