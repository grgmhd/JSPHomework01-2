<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/IsLogin.jsp" %>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	
	String user_id = session.getAttribute("user_id").toString();
	
	if(!user_id.equals(dto.getId())) {
		String script = "<script>alert('작성자 본인만 수정할 수 있습니다.');"
				+ "history.back();</script>";
		out.println(script);
		return;
	}
%>
<%@ include file="./commons/header.jsp" %>
<body> 
<script>
	function validForm(form) {
		if(!form.title.value) {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if(!form.content.value) {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>

<div class="container">
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시물 수정 - <small>자유게시판</small></h3>
            
            <form enctype="multipart/form-data" onsubmit="return validForm(this);"
            	action="EditPrc.jsp">
            	<input type="hidden" name="num" value="<%= dto.getNum() %>">
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" name="title" class="form-control" 
                            	value="<%= dto.getTitle() %>">
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td>
                            <textarea name="content" rows="5" class="form-control"><%= dto.getContent() %></textarea>
                        </td>
                    </tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                        <button type="submit" class="btn btn-danger">작성완료</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='listT.jsp';">목록보기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Copyright영역 -->
    <%@ include file="./commons/copyright.jsp" %>
</div>
</body>
</html>