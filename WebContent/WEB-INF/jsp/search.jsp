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

</head>
<body>
	<div id='site-nav'>
		<div class='wrapper' id="noUserWrapper">
			<ul class='status-info'>
				<li>
					<div class='main-link-div'>
						<a class='main-link' href='${pageContext.request.contextPath}/'> <i
							class='glyphicon glyphicon-home'></i> 首页
						</a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 122646843</li>
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
				<a href='/FamilyEdu'> <img alt="启学家教网" class="header-logo-img"
					src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</div>
		</div>
	</div>

	<div id='search-item-div'>
		<div class='div wrapper'>
			<div class='search-item-box'>
				<table class='table'>
					      &nbsp; &nbsp;课程筛选
					    <h4></h4>
					<tr>
						<td width='100px'>学生年级:</td>
						<td align='left'>
							<ul>
								<li id="sPeriod_0" ><a
									href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=0&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sPeriod_1" class="sPeriod"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=100&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">小学</a></li>
								<li id="sPeriod_2" class="sPeriod"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=2&sGrade=200&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初中</a></li>
								<li id="sPeriod_3"  class="sPeriod"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=3&sGrade=300&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高中</a></li>
							</ul>
							<ul class='grade-div' id="sPeriod1">
								<li id="sGrade_100" class="sGrade"><a
									href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=100&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sGrade_1" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=1&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">一年级</a></li>
								<li id="sGrade_2" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=2&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">二年级</a></li>
								<li id="sGrade_3" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=3&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">三年级</a></li>
								<li id="sGrade_4" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=4&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">四年级</a></li>
								<li id="sGrade_5" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=5&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">五年级</a></li>
								<li id="sGrade_6" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=1&sGrade=6&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">六年级</a></li>
								
							</ul>
							<ul class='grade-div' id="sPeriod2">
								<li id="sGrade_200" class="sGrade"><a
									href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=2&sGrade=200&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sGrade_7" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=2&sGrade=7&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初一</a></li>
								<li id="sGrade_8" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=2&sGrade=8&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初二</a></li>
								<li id="sGrade_9" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=2&sGrade=9&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">初三</a></li>
								
							</ul>
							<ul class='grade-div' id="sPeriod3">
								<li id="sGrade_300" class="sGrade"><a
									href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=3&sGrade=300&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}" rel="nofollow">全部</a>
								</li>
								<li id="sGrade_10" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=3&sGrade=10&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高一</a></li>
								<li id="sGrade_11" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=3&sGrade=11&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高二</a></li>
								<li id="sGrade_12" class="sGrade"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sPeriod=3&sGrade=12&sTeachMethod=${sessionScope.searchTeachMethod}&sGender=${sessionScope.searchGender}"
									rel="nofollow">高三</a></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>家教性别:</td>
						<td>
							<ul>
								<li id="sGender_0" class="sGender"><a
									href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sGender=0&sTeachMethod=${sessionScope.searchTeachMethod}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}" rel="nofollow">全部</a>
								</li>
								<li id="sGender_1" class="sGender"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sGender=1&sTeachMethod=${sessionScope.searchTeachMethod}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">男</a></li>
								<li id="sGender_2" class="sGender"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sGender=2&sTeachMethod=${sessionScope.searchTeachMethod}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">女</a></li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>授课方式:</td>
						<td>
							<ul>
								<li id="sTeachMethod_0" class="sTeachMethod"><a
									href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sTeachMethod=0&sGender=${sessionScope.searchGender}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}" rel="nofollow">全部</a>
								</li>
								<li id="sTeachMethod_1" class="sTeachMethod"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sTeachMethod=1&sGender=${sessionScope.searchGender}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">一对一上门教授</a></li>
								<li id="sTeachMethod_2" class="sTeachMethod"><a href="${pageContext.request.contextPath}/user/nav?page=1&keyword=${sessionScope.currentKeyword}&sTeachMethod=2&sGender=${sessionScope.searchGender}&sPeriod=${sessionScope.searchPeriod}&sGrade=${sessionScope.searchGrade}"
									rel="nofollow">一对多补习班式教学</a></li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<div id='product'>
		<div class='wrapper'>
			<div class='course-list-div'>
				<c:forEach items="${sessionScope.searchResultLists}"
					var="searchResult">
					<div class='course-list-box'>
						<a
							href='${pageContext.request.contextPath}/user/myCourses/detail?courseId=${searchResult.id }'
							target='_blank'>
							<div class='course-list-box-left'>
								<div class='course-list-box-left-header'>
									<img alt="家教老师头像" src="${pageContext.request.contextPath}${searchResult.createUser.userImage }" />
								</div>
							</div>
						</a>
						<div class='course-list-box-middle'>
							<div class='course-list-box-middle-name'>
								<span>${searchResult.createUser.username }</span> &nbsp;
								${searchResult.createUser.gender } &nbsp;
								${searchResult.createUser.age }岁
							</div>
							<div class='course-list-box-middle-check'>
								<img alt="Xlrz" class="course-list-box-middle-check-rz"
									src="${pageContext.request.contextPath}/image/prove1.png"
									title="学历认证" /> <img alt="Sfrz"
									class="course-list-box-middle-check-rz"
									src="${pageContext.request.contextPath}/image/prove2.png"
									title="身份认证" />
							</div>
							<div class='course-list-box-middle-line'>${searchResult.createUser.school }-
								${searchResult.createUser.major } -
								${searchResult.createUser.grade }</div>
							<div class='course-list-box-middle-line'>教学科目：${searchResult.teachPeriod }${searchResult.teachGrade }${searchResult.teachSubject }</div>
							<div class='course-list-box-middle-line'>授课经验：
								${searchResult.createUser.teachYear }年 &nbsp;&nbsp;&nbsp;&nbsp;
								授课方式： ${searchResult.teachMethod }</div>
							<div class='course-list-box-middle-line'>个人简介:
								${searchResult.createUser.introduction }</div>
						</div>
						<div class='course-list-box-right'>
							<div class='course-list-box-right-detail'>
								<a
									href="${pageContext.request.contextPath}/user/myCourses/detail?courseId=${searchResult.id }"
									class="btn btn-success" target="_blank"
									style="margin-top: 50px;">查看详情</a>
							</div>
						</div>
						<div class='course-list-box-line'></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div id="pageNav"
		style="text-align: center; width: 1100px; margin: 0 auto;">
		<nav style="text-align: center;">
		<ul class="pagination">
			<c:if test="${sessionScope.searchCurrentPage!=1}">

				<li><a
					href="${pageContext.request.contextPath}/user/nav?page=${sessionScope.searchCurrentPage}&pageAction=pre&keyword=${sessionScope.currentKeyword}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>

			</c:if>
			<c:forEach begin="${sessionScope.searchBeginPage}"
				end="${sessionScope.searchTotalPage}" var="v">
				<c:if test="${ v==searchCurrentPage}">
					<li class="active"><a
						href="${pageContext.request.contextPath}/user/nav?page=${v }&keyword=${sessionScope.currentKeyword}">${v}</a>
						</form></li>
				</c:if>
				<c:if test="${ v!=searchCurrentPage}">
					<li><a
						href="${pageContext.request.contextPath}/user/nav?page=${v }&keyword=${sessionScope.currentKeyword}">${v}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if
				test="${sessionScope.searchTotalPage!=sessionScope.searchCurrentPage}">
				<c:if test="${sessionScope.searchTotalPage!=0}">
				<li><a
					href="${pageContext.request.contextPath}/user/nav?page=${sessionScope.searchCurrentPage}&pageAction=next&keyword=${sessionScope.currentKeyword}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
				</c:if>
			</c:if>
		</ul>
		</nav>
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
					<br> Copyright © 2015 - 2016启学家教网
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
		function searchPeriod0(){
			jQuery("#sPeriod1").hide();
			jQuery("#sPeriod2").hide();
			jQuery("#sPeriod3").hide();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_0").attr("class","search-active");
		}
		function searchPeriod1(){
			jQuery("#sPeriod1").show();
			jQuery("#sPeriod2").hide();
			jQuery("#sPeriod3").hide();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_1").addClass("search-active");
		}
		function searchPeriod2(){
			jQuery("#sPeriod1").hide();
			jQuery("#sPeriod2").show();
			jQuery("#sPeriod3").hide();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_2").addClass("search-active");
			
		}
		function searchPeriod3(){
			jQuery("#sPeriod1").hide();
			jQuery("#sPeriod2").hide();
			jQuery("#sPeriod3").show();
			jQuery(".sPeriod").removeClass("search-active");
			jQuery("#sPeriod_3").addClass("search-active");
		}
		function searchGrade(grade){
			jQuery(".sGrade").removeClass("search-active");
			jQuery("#sGrade_"+grade).addClass("search-active");
		}
		function searchGender(gender){
			jQuery(".sGender").removeClass("search-active");
			jQuery("#sGender_"+gender).addClass("search-active");
		}
		function searchTeachMethod(teachMethod){
			jQuery(".sTeachMethod").removeClass("search-active");
			jQuery("#sTeachMethod_"+teachMethod).addClass("search-active");
		}
	</script>
	<%
		if (session.getAttribute("user") == null) {
			out.print("<script type='text/javascript'>noUser();</script>");
		}
		if (session.getAttribute("user") != null) {
			out.print("<script type='text/javascript'>hasUser();</script>");
		}
		if(session.getAttribute("searchPeriod")==null || session.getAttribute("searchPeriod").equals("0")){
			out.print("<script type='text/javascript'>searchPeriod0();</script>");
		}
		else if(session.getAttribute("searchPeriod").equals("1")){
			out.print("<script type='text/javascript'>searchPeriod1();</script>");
		}else if(session.getAttribute("searchPeriod").equals("2")){
			out.print("<script type='text/javascript'>searchPeriod2();</script>");
		}else if(session.getAttribute("searchPeriod").equals("3")){
			out.print("<script type='text/javascript'>searchPeriod3();</script>");
		}
		if(session.getAttribute("searchGrade")!=null){
			out.print("<script type='text/javascript'>searchGrade("+session.getAttribute("searchGrade")+");</script>");
		}
		if(session.getAttribute("searchGender")!=null){
			out.print("<script type='text/javascript'>searchGender("+session.getAttribute("searchGender")+");</script>");
		}
		if(session.getAttribute("searchTeachMethod")!=null){
			out.print("<script type='text/javascript'>searchTeachMethod("+session.getAttribute("searchTeachMethod")+");</script>");
		}
	%>
</body>
</html>