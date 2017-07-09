<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-启学家教网</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>


</head>
<body>
	<div id='site-nav'>
		<div class='wrapper' id="noUserWrapper">
			<ul class='status-info'>
				<li>
					<div class='main-link-div'>
						<a class='main-link' href=''> <i
							class='glyphicon glyphicon-home'></i> 首页
						</a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link' href='${pageContext.request.contextPath}/user/login'> <i
						class='glyphicon glyphicon-user'></i> 请登录
				</a> <a class='register-link' href='${pageContext.request.contextPath}/user/register'> 免费注册 </a></li>
			</ul>
		</div>
		<div class='wrapper' id="hasUserWrapper">
			<ul class='status-info'>
				<li>
					<div class='main-link-div'>
						<a class='main-link' href='${pageContext.request.contextPath}/'> <i
							class='glyphicon glyphicon-home'></i> 首页
						</a>
					</div>
				</li>
				<li>
					<div class='main-link-div'>
						<a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduSelect'>
							个人中心 </a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link'
					href='${pageContext.request.contextPath}/user/myFamilyEduSelect'> <i
						class='glyphicon glyphicon-user'></i> ${ sessionScope.user.username}
				</a> <a class='register-link' href='${pageContext.request.contextPath}/user/loginout'> 退出 </a></li>
			</ul>
		</div>
	</div>
	<div class='autowidth' id='header'>
		<div class='wrapper'>
			<div class='header-search'>
				<form accept-charset="UTF-8" action="${pageContext.request.contextPath}/user/search" method="post">
					<div class='header-search-form'>
						<i class='glyphicon glyphicon-search'></i> 
						<input type="hidden" name="page" value="1">
						<input type="hidden" name="sPeriod" value="0">
						<input type="hidden" name="sGender" value="0">
						<input type="hidden" name="sTeachMethod" value="0">
						<input
							class='header-search-input' name='keyword'
							placeholder='输入搜索你想学的课程试试'> <input
							class="header-search-btn" name="commit" type="submit" value="搜索" />
					</div>
				</form>

			</div>
			<div class='header-logo'>
				<a href='${pageContext.request.contextPath}/'> <img alt="启学家教网" class="header-logo-img"
					src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</div>
		</div>
	</div>

	<div id='menu'>
		<div class='wrapper'>
			<div class='menu-c-all'>
				<a href="${pageContext.request.contextPath}/filters/index">全部课程分类</a>
			</div>
		</div>
	</div>

	<div id='banner'>
		<div class='wrapper'>
			<div class='category'>
				<ul>
					<li id='category1'>
						<div class='category-title'>
							<span class='glyphicon glyphicon-th-list font-descend'></span>
							小学
						</div>
						<div class='category-subject'>
							<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=1&sGrade=100&sGender=0&sTeachMethod=0&keyword=数学">数学</a> <a href="/FamilyEdu/user/nav?page=1&sPeriod=1&sGrade=100&sGender=0&sTeachMethod=0&keyword=语文">语文</a> <a
								href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=1&sGrade=100&sGender=0&sTeachMethod=0&keyword=英语">英语</a> 
						</div>
					</li>
					<li id='category2'>
						<div class='category-title'>
							<span class='glyphicon glyphicon-th-list font-descend'></span>
							初中
						</div>
						<div class='category-subject'>
							<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=数学">数学</a> <a href="/FamilyEdu/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=语文">语文</a> <a
								href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=英语">英语</a> <a href="/FamilyEdu/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=历史">历史</a> <a
								href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=政治">政治</a> 
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=地理">地理</a>
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=物理">物理</a>
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=生物">生物</a>
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=2&sGrade=200&sGender=0&sTeachMethod=0&keyword=化学">化学</a>
						</div>
					</li>
					<li id='category3'>
						<div class='category-title'>
							<span class='glyphicon glyphicon-th-list font-descend'></span>
							高中
						</div>
						<div class='category-subject'>
							<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=数学">数学</a> <a href="/FamilyEdu/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=语文">语文</a> <a
								href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=英语">英语</a> <a href="/FamilyEdu/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=历史">历史</a> <a
								href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=政治">政治</a> 
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=地理">地理</a>
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=物理">物理</a>
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=生物">生物</a>
								<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=3&sGrade=300&sGender=0&sTeachMethod=0&keyword=化学">化学</a>
						</div>
					</li>
					<li id='category4'>
						<div class='category-title'>
							<span class='glyphicon glyphicon-th-list font-descend'></span>
							兴趣特长
						</div>
						<div class='category-subject category-subject-end' style="height: 65px;">
							<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=0&sGender=0&sTeachMethod=0&keyword=音乐">音乐</a> <a href="/FamilyEdu/user/nav?page=1&sPeriod=0&sGender=0&sTeachMethod=0&keyword=舞蹈">舞蹈</a> <a href="/FamilyEdu/user/nav?page=1&sPeriod=0&sGender=0&sTeachMethod=0&keyword=美术">美术</a> <a
								href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=0&sGender=0&sTeachMethod=0&keyword=吉他">吉他</a>
						<a href="${pageContext.request.contextPath}/user/nav?page=1&sPeriod=0&sGender=0&sTeachMethod=0&keyword=钢琴">钢琴</a>
						</div>
					</li>
					
				</ul>
			</div>
		</div>
	</div>
	<div class='carstyle'>
		<div class='introduce'>
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				</ol>
				<!-- 这里是轮播图 -->

				<div class="carousel-inner" role="listbox">

					<div class="item active">
						<div class="bcimg1"
							style="background-image: url('${pageContext.request.contextPath}/image/index1.jpg')">
						</div>
					</div>
					<div class="item">
						<div class="bcimg1"
							style="background-image: url('${pageContext.request.contextPath}/image/index2.jpg')">
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class='wrapper beautystyle'>
		<div class='row'>
			<div class='col-md-12'>
				<div class='col-md-12 floor-title'>
					<span class='gtitle'> <span class='floor-style'> 1F </span>
						最新入驻
					</span>
				</div>
			</div>
			<div class='col-md-12'>
				<div class='scrollleft'>
					<ul>
						<c:forEach items="${sessionScope.newTeacherList}" var="newTeacher">
							<li><a href="javascript:void(0)"
								class="pull-left" target="_blank"><img alt="最新入驻老师"
									src="${pageContext.request.contextPath}${newTeacher.userImage }" /></a>
								<h5>${newTeacher.username }</h5>
								<div class='badge'>${newTeacher.major }</div>
								<div>${newTeacher.teachYear }年教龄</div>
								<div>${newTeacher.school }</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class='wrapper'>
		<div class='row'>
			<div class='col-md-12'>
				<div class='col-md-12 floor-title'>
					<span class='gtitle'> <span class='floor-style'> 2F </span>
						小初高教育
					</span> 
				</div>
			</div>
		</div>
	</div>
	<div class='wrapper tusstyle'>
		<div class='row'>
			<div class='col-md-12'>
				<c:forEach items="${sessionScope.subjectCourses}" var="subjectCourse" >
					<div class='tinfo-container'>
						<a href='${pageContext.request.contextPath}/user/myCourses/detail?courseId=${subjectCourse.id }' target='_blank'>
							<div class='col-md-12 teacher-index'>
								<div class='vote-img photo-pos'>
									<img alt="小初高教育老师" class="img-circle" height="120px"
										src="${pageContext.request.contextPath}${subjectCourse.createUser.userImage }"
										width="120px" />
								</div>
								<div class='col-md-12'>
									<p>
									<h4 class='text-center text-muted photo-pos'>${subjectCourse.createUser.username }</h4>
									</p>
								</div>
								<div class='col-md-12 age-border'>
									<div class='row'>
										<div class='col-md-7 text-muted'>${subjectCourse.teachPeriod }${subjectCourse.teachGrade }${subjectCourse.teachSubject }</div>
										<div class='col-md-5'>
											<small class='font-orange'> ${subjectCourse.createUser.teachYear }年教龄 </small>
										</div>
									</div>
								</div>
								<div class='col-md-12 pdmg'>
									<p class='font-all text-muted'>${subjectCourse.createUser.school }</p>
								</div>
								<div class='top-message'>
									<div class='col-md-12 tintro'>${subjectCourse.createUser.introduction }</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class='wrapper'>
		<div class='row'>
			<div class='col-md-12'>
				<div class='col-md-12 floor-title'>
					<span class='gtitle'> <span class='floor-style'> 3F </span>
						兴趣特长教学
					</span> 
				</div>
			</div>
		</div>
	</div>
	<div class='wrapper tusstyle'>
		<div class='row'>
			<div class='col-md-12'>
				<c:forEach items="${sessionScope.interestCourses }" var="interestCourse" >
					<div class='tinfo-container'>
						<a href='${pageContext.request.contextPath}/user/myCourses/detail?courseId=${interestCourse.id }' target='_blank'>
							<div class='col-md-12 teacher-index'>
								<div class='vote-img photo-pos'>
									<img alt="小初高教育老师" class="img-circle" height="120px"
										src="${pageContext.request.contextPath}${interestCourse.createUser.userImage }"
										width="120px" />
								</div>
								<div class='col-md-12'>
									<p>
									<h4 class='text-center text-muted photo-pos'>${interestCourse.createUser.username }</h4>
									</p>
								</div>
								<div class='col-md-12 age-border'>
									<div class='row'>
										<div class='col-md-7 text-muted'>${interestCourse.teachPeriod }${interestCourse.teachGrade }${interestCourse.teachSubject }</div>
										<div class='col-md-5'>
											<small class='font-orange'> ${interestCourse.createUser.teachYear }年教龄 </small>
										</div>
									</div>
								</div>
								<div class='col-md-12 pdmg'>
									<p class='font-all text-muted'>${interestCourse.createUser.school }</p>
								</div>
								<div class='top-message'>
									<div class='col-md-12 tintro'>${interestCourse.createUser.introduction }</div>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class='wrapper usstyle'>
		<div class='row'>
			<div class='col-md-12'>
				<p class='gtitle2 text-muted text-center'>我们更可靠</p>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="身份认证"
							src="${pageContext.request.contextPath}/image/indexC1.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h3 class='text-center'>身份认证</h3>
						</p>
					</div>
					<div class='col-md-12'>全面认证入驻老师身份背景，确保老师资料真实可信。</div>
				</div>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="平台保障"
							src="${pageContext.request.contextPath}/image/indexC2.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h3 class='text-center'>平台保障</h3>
						</p>
					</div>
					<div class='col-md-12'>平台托管，任意挑选，零顾虑零风险。</div>
				</div>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="隐私保密"
							src="${pageContext.request.contextPath}/image/indexC3.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h3 class='text-center'>隐私保密</h3>
						</p>
					</div>
					<div class='col-md-12'>全球领先云加密技术，保护家教和家长的隐私安全。</div>
				</div>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="专业服务"
							src="${pageContext.request.contextPath}/image/indexC4.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h3 class='text-center'>专业服务</h3>
						</p>
					</div>
					<div class='col-md-12'>知名教育从业团队，保障服务第一，用户利益至上。</div>
				</div>
			</div>
		</div>
	</div>
	<div class='wrapper usstyle'>
		<div class='row'>
			<div class='col-md-12'>
				<p class='gtitle2 text-muted text-center'>我们更贴心</p>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="家长放心"
							src="${pageContext.request.contextPath}/image/indexC5.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h4 class='text-center mtten'>家长放心 家教省心</h4>
						</p>
					</div>
					<div class='col-md-12'>家长家教零距离接触，省去中介环节，沟通效率更高。</div>
				</div>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="本地名师"
							src="${pageContext.request.contextPath}/image/indexC6.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h4 class='text-center mtten'>本地名师 想挑就挑</h4>
						</p>
					</div>
					<div class='col-md-12'>本地优秀名师任您挑选，总能找到您满意的老师。</div>
				</div>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="在线预约"
							src="${pageContext.request.contextPath}/image/indexC7.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h4 class='text-center mtten'>在线预约 老师上门</h4>
						</p>
					</div>
					<div class='col-md-12'>电脑在线挑选，网上预约，老师上门授课。</div>
				</div>
			</div>
			<div class='col-md-3'>
				<div class='col-md-12'>
					<div class='col-md-12 text-center'>
						<img alt="客观评价"
							src="${pageContext.request.contextPath}/image/indexC8.png" />
					</div>
					<div class='col-md-12'>
						<p>
						<h4 class='text-center mtten'>客观评价 真实水平</h4>
						</p>
					</div>
					<div class='col-md-12'>家长客观评价家教授课情况，真实反映家教教学水平。</div>
				</div>
			</div>
		</div>
	</div>

	<div id='footer-div'>
		<div class='wrapper'>
			<div class='footer-service'>
				<div class='footer-service-title'>客服电话：</div>
				<div class='footer-service-content'>13119314025</div>
			</div>
			<div class='footer-intro'>
				<div class='footer-intro-head'>
					<span class='footer-intro-title'>启学家教网 </span> <span
						class='footer-intro-substitle'> 中小学生家教预约平台 </span>
				</div>
				<p class='footer-desc'>启学家教网 -中小学生家教预约平台
					是一个互联网教育平台。为了学习更有效、为了教育更灵活、更亲切，我们致力于本地化家教教育。在这个平台上，老师和学生可以免费发布信息、随时沟通、灵活教学。学生无论是为了应对升学，攻克难题，还是课外兴趣发展，我们都能提供强大的知识和经验支持。
				</p>
				<p class='footer-desc'>
					<br> Copyright © 2015 - 2017 启学家教网
				</p>
			</div>
			<div class='footer-about'>
				<i></i>
				<ul class='footer-list'>
					<li><a> 活动公告 </a></li>
					<li><a> 常见问题 </a></li>
					<li><a> 服务协议 </a></li>
					<li><a> 隐私声明 </a></li>
					<li><a> 商务合作 </a></li>
				</ul>
			</div>
			<div class='footer-contact'>
				<i></i>
				<ul class='footer-list'>
					<li><a> 意见反馈 </a></li>
					<li><a> 官方微信 </a></li>
					<li><a> 新浪微博 </a></li>
					<li><a> 关于我们 </a></li>
					<li><a> 联系我们 </a></li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function noUser() {
			jQuery("#noUserWrapper").show();
			jQuery("#hasUserWrapper").hide();
		}
		function hasUser() {
			jQuery("#hasUserWrapper").show();
			jQuery("#noUserWrapper").hide();
		}
	</script>
	<%
		if (session.getAttribute("user") == null) {
			out.print("<script type='text/javascript'>noUser();</script>");
		}
		if (session.getAttribute("user") != null) {
			out.print("<script type='text/javascript'>hasUser();</script>");
		}
	%>
</body>
</html>