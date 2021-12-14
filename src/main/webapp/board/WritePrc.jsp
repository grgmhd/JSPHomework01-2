<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/IsLogin.jsp" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("user_id").toString());
	
	BoardDAO dao = new BoardDAO();
	int result = dao.insertWrite(dto);
	dao.close();
	
	if(result == 1) {
		response.sendRedirect("listT.jsp");
	}
	else {
		String script = "<script>alert('게시물 등록에 실패했습니다.');"
						+ "history.back();</script>";
		out.println(script);
	}
%>