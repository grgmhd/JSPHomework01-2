<%@page import="connect.MemberDTO"%>
<%@page import="connect.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("passwd");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getDTO(user_id, user_pw);
	dao.close();
	
	if(dto.getId() !=null) {
		session.setAttribute("user_id", dto.getId());
		session.setAttribute("user_name", dto.getName());
		
		response.sendRedirect("../board/listT.jsp");
	}
	else {
		request.setAttribute("ErrMsg", "로그인 오류가 발생했습니다.");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}
%>