<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/IsLogin.jsp" %>
<%
	String num = request.getParameter("num");

	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO();
	dto = dao.selectView(num);
	
	String user_id = session.getAttribute("user_id").toString();
	
	int delFlag = 0;
	
	if(user_id.equals(dto.getId())) {
		dto.setNum(num);
		delFlag = dao.deletePost(dto);
		dao.close();
		if(delFlag == 1) {
			String script = "<script>alert('게시물이 삭제되었습니다.');"
					+ "location.href='listT.jsp';</script>";
		out.println(script);
		}
		else {
			String script = "<script>alert('삭제에 실패하셨습니다.');"
					+ "history.back();</script>";
			out.println(script);
		}
		
	}
	else {
		String script = "<script>alert('작성자만 삭제할 수 있습니다.');"
				+ "history.back();</script>";
		out.println(script);
		return;
	}
%>