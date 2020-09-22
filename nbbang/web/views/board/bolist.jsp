<%@page import="com.nbbang.board.model.vo.Card"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.nbbang.board.model.vo.Board, java.util.List"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Card> bolist = (List<Card>) request.getAttribute("boardList");
%>
<style>
.card-wrapper {
	padding-top: 3rem;
	padding-left: 5rem;
	padding-right: 9rem;
	margin:0 auto;
	width:80em;
}
/* 
.pagination>li>.page-link {
} */

.pagination>li>a {
	color:black;
}
.card-price {
	float: right;
	margin-top: 0;
}
.card-body {
	padding: 0.5em;
}

#writeBoard {
	text-align: right;
	padding-right: 1em;
}
#writeBoard>button {
	height: 2em;
	width: 5em;
}
#interest {
	font-size:15px;
	color:gray;
}
</style>
<section>
	<div class="card-wrapper">
		<div id="boardTitle">
		<h1>게시판 이름</h1>
		</div>
		<div id="writeBoard">
			<button onclick="fn_boWrite();">글쓰기</button>
		</div>
		<%
			for (Card c : bolist) {
		%>
		<div class="card"
			onclick="location.href='<%=request.getContextPath()%>/board/boardPage?boardId=<%=c.getCardBoard().getBoardId()%>'"
			style="width: 15rem; cursor: pointer; padding:0px">
			<!-- file의 갯수 분기처리 -->
			<%-- <% if(files.length==1) {%> --%>
			<img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="160em">
			<%-- <% }else { %> --%>
			<%-- <img src="<%=request.getContextPath()%>/upload/images/<%= files[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="160em"> --%>
		<%-- 	<%} %> --%>
				
			<div class="card-body">
				<input type="hidden" value="<%= c.getCardBoard().getBoardId()%>">
				<h5 class="card-title"><%= c.getCardBoard().getBoardTitle() %></h5>
				<p><%= c.getCardBoard().getTradeArea() %></p>
				<p id="interest"><%= c.getCardBoard().getLikeCount() %> 관심 <%= c.getCardBoard().getHit() %> 조회</p>
				<h4 class="card-price"><fmt:formatNumber type="number" maxFractionDigits="3" value="<%= c.getCardBoard().getProductPrice() %>"></fmt:formatNumber>원</h4>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<br>
		<nav aria-lable="Page navigation">
			<ul class="pagination justify-content-center">
				<%=request.getAttribute("pageBar")%>
			</ul>
		</nav>
	<br>
</section>
<script>
	function fn_boWrite(){
		location.assign("<%= request.getContextPath() %>/board/boWrite");
	}
</script>
<%@ include file="/views/common/footer.jsp"%>
