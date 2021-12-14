<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num);
	BoardDTO dto = dao.selectView(num);
	dao.close();
%>
<%@ include file="./commons/header.jsp" %>
<body>
<script>
	function delPost() {
		var conf = confirm("현재 게시물을 삭제하시겠습니까?");
		if(conf == true) {
			document.imForm.action = "DeletePrc.jsp";
			document.imForm.submit();
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
            <h3>게시판 내용보기 - <small>자유게시판</small></h3>
            
            <form name="imForm" method="post">
            	<input type="hidden" name="num" value="<%= dto.getNum() %>">
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="25%"/>
                    <col width="15%"/>
                    <col width="15%"/>
                    <col width="15%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            <%= dto.getName() %>
                        </td>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성일</th>
                        <td class="text-center">
                            <%= dto.getPostdate() %>
                        </td>
                        <th class="text-center" 
                            style="vertical-align:middle;">조회수</th>
                        <td class="text-center">
                            <%= dto.getVisitcount() %>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td colspan="6">
                            <%= dto.getTitle() %>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td colspan="6">
                            <%= dto.getContent() %>
                        </td>
                    </tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
<%
				if(session.getAttribute("user_id") !=null
					&& session.getAttribute("user_id").toString().equals(dto.getId())) {
%>
                        <button type="button" class="btn btn-secondary"
                        	onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>';">수정하기</button>
                        <button type="button" class="btn btn-success" onclick="delPost();">삭제하기</button>
<%
				}
%>
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