<!-- 用户注销 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
   <meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%
	 session.removeAttribute("admin");
 	 response.sendRedirect(request.getContextPath()+"/admin/login");
%>
