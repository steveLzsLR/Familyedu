<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
	if(session.getAttribute("admin")==null){
		session.setAttribute("noLogin", "用户未登录,请登录！");
		response.sendRedirect("/FamilyEdu/admin/login");
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>启学家教网管理员管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
	<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>

  </head>
  
 <body scroll="no">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="79" background="${pageContext.request.contextPath}/image/top_bg.gif" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="500"><img src="${pageContext.request.contextPath}/image/logo2.png" width="250" height="79"></td>
          <td>&nbsp;</td>
          <td width="500" height="79"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><div style="font-size: 25px;text-align: right;margin-right: 100px;">管理员管理系统</div></td>
              </tr>
              <tr>
                <td><table width="500" border="0" cellspacing="0" cellpadding="0">
                  <tr style="float: right;margin-right:75px;">
                    <td width="86" height="32" ><i
						class='glyphicon glyphicon-user'></i>&nbsp;${ sessionScope.admin.username}</td>
						<td width="86" height="32"><a class='register-link' href='${pageContext.request.contextPath}/admin/adminLoginOut'> 注销 </a></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="100%"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" style="background-repeat: repeat-x;">
        <tr>
          <td width="175" height="100%" valign="top"><table width="175" height="100%" border="0" cellspacing="0" cellpadding="0" background="images/menu_bg.gif">
              <tr>
                <td height="25"><img src="${pageContext.request.contextPath}/image/menu_top.gif" width="175" height="25"></td>
              </tr>
              <tr>
                <td  style="background:url('${pageContext.request.contextPath}/image/menu_bg.gif');" valign="top"><div class="dtree">
                    <script type="text/javascript">
					d = new dTree('d');
					d.config.stepDepth = 1;
					d.config.useStatusText = true;
					 
					d.add(0,-1,' <strong>管理员管理系统</strong>');
					d.add(5,0,'后台管理');
					d.add(501,5,'用户资格审核');
					d.add(50101,501,'教师资格审核','${pageContext.request.contextPath}/admin/findWaitingValidateTeachers?page=1',"",'page');
					d.add(50102,501,'家长资格审核','${pageContext.request.contextPath}/admin/findWaitingValidateParents?page=1',"",'page');
					d.add(502,5,'用户信息管理');
					d.add(50201,502,'家长信息管理','#'); 
					document.writeln(d);
					</script>
                </div></td>
              </tr>
              <tr>
                <td height="31"><img src="${pageContext.request.contextPath}/image/menu_foot.gif" width="175" height="31"></td>
              </tr>
            </table></td>
          <td><iframe src="${pageContext.request.contextPath}/admin/findWaitingValidateTeachers?page=1" width="100%" height="100%" frameborder="0" name="page"></iframe></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
