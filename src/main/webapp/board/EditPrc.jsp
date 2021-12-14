<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/IsLogin.jsp" %>
<%
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	int affected = dao.updateEdit(dto);
	dao.close();
	
	if(affected == 1) {
		response.sendRedirect("viewT.jsp?num="+ num);
	}
	else {
		String script = "<script>alert('수정하는데 실패했습니다.');"
				+ "history.back();</script>";
		out.println(script);
	}
%>