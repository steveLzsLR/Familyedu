<!-- 用户注销 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
   <meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%
	 session.removeAttribute("user");
 	 response.sendRedirect(request.getContextPath());
%>
