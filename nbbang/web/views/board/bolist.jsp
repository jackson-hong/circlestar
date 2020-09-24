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

.card-title {
	width: 10em;
	height: 1em;
}

.card-title>p {
	font-size: 25px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
<section>
	<div class="card-wrapper">
		<div id="boardTitle">
		<h1><%= request.getAttribute("category") %></h1>
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
			<div class="">
			<img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="160em">
			<%-- <% }else { %> --%>
			<%-- <img src="<%=request.getContextPath()%>/upload/images/<%= files[0] %>" class="card-img-top" alt="제품이미지" width="120em" height="160em"> --%>
		<%-- 	<%} %> --%>
			</div>
			<div class="card-body">
				<input type="hidden" value="<%= c.getCardBoard().getBoardId()%>">
				<h5 class="card-title"><p><%= c.getCardBoard().getBoardTitle() %></p></h5>
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
	/* $('.js-imgSizeSame').each(function(index) { // 1번 
		
		$(this).children('img').one("load", function() { // 2번 
			}).each(function() { 
				imageSizeSame($(this).parent(), 0.7); // 3번 
			}); 
		$(this).parents('.card').find('.desc-noimg').addClass('desc').removeClass('desc-noimg'); // 4번 
			
	});
	
	function imageSizeSame(wrapImgClass, ratio=0) { // 1번 
		var divHeight; 
		var div = wrapImgClass; 
		var img = div.children('img'); 
		var divWidth = div.width(); 
		if(!ratio || ratio == 0) { // 2번 
			divHeight = div.height(); // 3번 
			} else { divHeight = divWidth * ratio; // 4번 
			div.height(divHeight + 'px'); // 5번 
			} var divAspect = divHeight / divWidth; // 6번 
			var imgAspect = img.height() / img.width(); // 7번 
			if (imgAspect <= divAspect) { // 8번 // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 중앙으로 맞춤 
				var imgWidthActual = div.outerHeight(true) / imgAspect; 
				var imgWidthToBe = div.outerHeight(true) / divAspect; 
				var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2); 
				img.css({ 
					width: 'auto', 
					'margin-left': marginLeft + 'px', 
				height: '100%' 
			}); 
		} else { // 9번 
			// div가 이미지보다 납작한 경우 가로를 img에 맞추고 세로는 중앙으로 맞춤 
			var imgHeightActual = div.outerWidth(true) * imgAspect; 
			var imgHeightToBe = div.outerWidth(true) * divAspect; 
			var marginTop = Math.round((imgHeightActual - imgHeightToBe) / 2); 
			img.css({ width: '100%', 'margin-left': 0, 
				'margin-top': - marginTop + 'px', 
				height: 'auto' }); 
			} 
		} */


</script>
<%@ include file="/views/common/footer.jsp"%>
