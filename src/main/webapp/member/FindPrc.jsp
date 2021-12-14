<%@page import="connect.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// id/pw찾기의 value값을 받음.
	String find = request.getParameter("find");
	
	String result = null;
	MemberDAO dao = new MemberDAO();	
	
	// id찾기인 경우 DAO의 findId() 메서드 호출
	if(find.equals("idFind")) {
		String name = (String)request.getParameter("user_name");
		
		result = dao.findId(name);
	}
	// pw찾기인 경우 DAO의 findPw() 메서드 호출
	if(find.equals("pwFind")) {		
		String id = (String)request.getParameter("user_id");
		String name = request.getParameter("user_name");
	
		result = dao.findPw(id, name);
	}
	// 아이디/비밀번호 찾기에 실패한 경우
	if(result == null) {
%>
		<script>
			alert('아이디/비밀번호 찾기에 실패했습니다');
			history.back();
		</script>
<%
	}
	// DB에서 검색한 값을 반환받은 경우
	else {
		//아이디 찾기일 경우
		if(find.equals("idFind")) {
%>
			<script>
				alert("아이디는 <%= result %> 입니다.");
				location.href="Login.jsp";
			</script>
<%
		}
		//비밀번호 찾기일 경우
		if(find.equals("pwFind")) {
%>
		<script>
			alert("비밀번호는 <%= result %> 입니다.");
			location.href="Login.jsp";
		</script>
<%
		}
	}
%>