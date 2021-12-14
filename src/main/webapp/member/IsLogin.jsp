<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user_id")==null) {
		String script = "<script>alert('로그인 후 이용해주세요.');"
					+ "location.href='../member/Login.jsp';</script>";
		out.println(script);
		return;
	}
%>