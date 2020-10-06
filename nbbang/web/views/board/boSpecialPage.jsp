<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.nbbang.board.model.vo.Card"%>
<%@page import="com.nbbang.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<% 
	Card c = (Card)request.getAttribute("curCard");
	Date enrollDate = c.getCardBoard().getEnrollDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm");
	String newDate = sdf.format(enrollDate);
	List<Integer> tradeUserList = new ArrayList<Integer>();
	if(request.getAttribute("tradeUserList")!=null){
		tradeUserList = (List<Integer>)request.getAttribute("tradeUserList");
	}
	String reply = new String();
	if(request.getAttribute("reply")!=null){
  	reply = (String)request.getAttribute("reply");
	}
	Integer requestCount = (Integer)request.getAttribute("requestCount");
	int maxMems = c.getCardBoard().getMaxMems();
	int percent = Math.round(((requestCount/(float)c.getCardBoard().getMaxMems())*100));
	int target = maxMems - requestCount;
%>
<style>
  #wrapper {
    margin: 0 auto;
    <% if(!(loginnedMember.getUsid()==c.getCardBoard().getWriterUsid()&&c.getCardBoard().getTradeStage()==1)){ %>
    margin-top: 5em;
    <% } %>
    padding-top: 1em;
    width: 45em;
    text-align: center;
    align-items: center;
    margin-bottom: 3em;
    border: 0.5px solid rgb(224, 224, 224);
    border-radius: 1em;
    overflow: auto;
  }

  #imageWrapper {
    margin-bottom: 2em;
  }

  #imageWrapper>img {
    border-radius: 1em;
  }

  #userInfo {
    margin: 0 auto;
  	width:34em;
  	text-align:left;
  	font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    font-size: large;
  }

  #userInfo>#level {
    float: right;
    margin-top: 0.5em;
  }

  .content{
    width: 40em;
    margin: 0 auto;
    padding: 0.5em;
    overflow: auto;
  }

  #title {
    text-align: left;
    width: 100%;
    overflow: auto;
    font-weight: bolder;
    font-size: 1.7em;
  }

  #priceAndLikeBtn {
    text-align: left;
    padding-top: 0.5em;
    overflow: auto;
  }

  
  #contentText {
    float: left;
    text-align: left;
    position: relative;
    width: 100%;
    margin-bottom: 2.5em;
  }

  #etcInfo {
    text-align: left;
    font-size: small;
  }
  
  #commentSection {
    text-align: left;
    margin: 0 auto;
    width: 38em;
    padding-left: 0.5em;
    padding-right: 0.5em;
    margin-bottom: 2em;
  }

  #commentInsert {
    width: fluid;
    margin: 0 auto;
    text-align: center;
    height: 2em;
    overflow: auto;
  }

  #commentInsert2 {
    width: fluid;
    margin: 0 auto;
    margin-top: 10px;
    text-align: left;
    overflow: auto;
  }

  #Comments {
    width: 100%;
  }

  #Comments>ul {
    padding-left: 0.5em;
    list-style: none;
    margin: 0 auto;
    overflow: auto;
  }

  .comment_area2{
    width: 100%;
    overflow: auto;
    padding-left: 2em;
    margin-top: 1em;
    margin-bottom: 1em;
  }

  .comment_area {
    padding-top: 0.5em;
    width: 100%;
    overflow: auto;
  }
  .comment_thumb {
    text-align: center;
    position: relative;
    width: 5em;
    float: left;
  }
  .comment_box {
    word-break: break-all;
    width: 29em;
    float: left;
    position: relative;
  }
  .comment_id {
    font-size: small;
    font-weight: bold;
  }

  .comment_text {
    font-size: 16px;
  }

  .comment_info {
    font-size: small;
    color: darkgray;
    margin-top: 0.25em;
  }
  
  #userThumb {
    float: left;
    margin-right: 4px;
  }
  #userIdAndAddress {
    float: left;
  }
  #userId {
    font-size: 18px;
    font-weight: bold;
  }
  #userAddress {
    font-size: 16px;
  }

  #date {
    text-align: left;
    color: darkgray;
    overflow: auto;
  }
  
  #date p {
    color: darkgreen;
    font-weight: bold;
  }
  #etcInfo a {
  	color:black;
  }
  #titleContent {
    width: 17em;
    height: 2em;
    float: left;
  }
  #titleContent>p {
    font-size: 25px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  #startBtn {
    margin-left: 2.5px;
    float: left;
    font-size: 18px;
  }
  .turnRed {
    background-color: red;
  }
  #userThumb>img {
  	border-radius: 70%;
  }
  #comment_thumb>img {
  	border-radius: 70%;
  }
  #funcBtns {
    padding-top: 0.5em;
    padding-bottom: 0px;
    padding-left: 0em;
    font-size: 12px;
  }
  #funcBtns>ul {
    padding-left: 0.25em;
    list-style: none;
    text-align: left;
  }
  #funcBtns>ul>li {
    display: inline-block;
    text-align: center;
    margin-left:0.5em;
    margin-right: 0.5em;
    padding-bottom: 0px;
    height: 4.5em;
  }
  #funcBtns>ul div {
    cursor: pointer;
  }
  #funcBtns>ul div:hover {
    transform:scale(1.1);
    font-weight: bold;
  }
  #btnForWriter {
   	margin: 0 auto;
  	margin-top:3em;
  	margin-bottom:5px;
  	text-align:right;
  	width:45em;
    font-family:'Do Hyeon', sans-serif;
  }
  #btnForWriter>button {
	height: 2em;
	width: 5em;
	font-size: 20px;
	}

	#btnForWriter>button:hover {
	border: 2px black solid;
  }
  
  .addToReple {
    text-decoration: none;
    color: gray;
  }

  .confirm {
    font-family: 'Do Hyeon', sans-serif;
  }
  .chart { 
    width: 33.33%; 
    margin-left: 26em;
    text-align: center;
  }

  .chart span.title{
  position: relative; 
  display: block; 
  width: 100%; 
  text-align: center; 
  top: 110px;
  }
  
  span.title {
  	font-family: 'Do Hyeon', sans-serif;
  	font-size:16px;
  }

  .card-img-top {
        width: 100%;
        height: 35vw;
        object-fit: cover;
    }
    
.time > *{
font-size:2em;
font-weight:bold;
}

#urlh{
text-decoration:none;
color:darkgray;
}

</style>
<section>

  	
  	<% if(loginnedMember.getUsid()==9999) {%>
  	<div id="btnForWriter"> 
  	  		<button onclick="fn_modifyBoard();">수정하기</button>
  		<button onclick="fn_deleteBoard();">삭제하기</button>
  	</div>
  	<%} %>
  	
  <div id="wrapper">
    <div id="imageWrapper">
      <div id="carouselField" name="carouselField" >
        <div id="carouselNB" class="carousel slide " data-ride="carousel" data-interval="false">
          <ol class="carousel-indicators">
            <% for(int i = 0; i < c.getCardFile().getFileName().length; i++)  {%>
            <% if(i==0) { %>
            <li data-target="#carouselInhee" data-slide-to="<%= i %>" class="active"></li>
            <% }else { %>
              <li data-target="#carouselInhee" data-slide-to="<%= i %>"></li>
            <% }} %>
          </ol>
          <div class="carousel-inner" role="listbox">
            <% for(int i = 0; i < c.getCardFile().getFileName().length; i++)  {%>
              <% if(i==0) { %>
            <div class="carousel-item active">
              <img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[i] %>"
                class="d-block w-90 card-img-top" alt="..." width="600em" height="500em">
            </div>
            <% }else { %>
              <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/upload/images/<%= c.getCardFile().getFileName()[i] %>"
                  class="d-block w-90 card-img-top" alt="..." width="600em" height="500em">
              </div>
            <% }} %>
          </div>
    
          <a class="carousel-control-prev" href="#carouselNB" role="button"
            data-slide="prev"> <span class="carousel-control-prev-icon"
            aria-hidden="true"></span> <span class="sr-only">Previous</span>
          </a> 
          <a class="carousel-control-next" href="#carouselNB" role="button"
            data-slide="next"> <span class="carousel-control-next-icon"
            aria-hidden="true"></span> <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </div>
    <div id="userInfo">
    	<hr>
        <div id="userIdAndAddress">
           <div id="userId">기업명 : <%= c.getCardBoard().getWriterNickname() %></div>
     	<div class="time"><p id="count"></p></div>
        </div>
 
    </div>
    <div class="content">
      <hr>
      <div id="title">
        <div id="titleContent"><p><%= c.getCardBoard().getBoardTitle() %></p></div>

      </div>
      
      <div id="date"><%= newDate %> &nbsp&nbsp 조회수 <%= c.getCardBoard().getHit() %> &nbsp&nbsp 
<%if(c.getCardBoard().getProductUrl()!=null){ %><a id="urlh" href="http://<%= c.getCardBoard().getProductUrl() %>" target="_blank">제품 페이지</a><%} else { %>제품 페이지<%} %>
      </div>
      <div id="priceAndLikeBtn">
          <h5><%= c.getCardBoard().getProductPrice() %>원</h5>
      </div>
      <div id="contentText"><%= c.getCardBoard().getContent() %></div>
      <div class="chart chart1" data-percent="<%=percent%>"><span class="title">특가 마감 <%= target %>명!</span></div>

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
      <script src="<%=request.getContextPath()%>/js/easy-pie/dist/easypiechart.js"></script>
      <script src="<%=request.getContextPath()%>/js/easy-pie/dist/jquery.easypiechart.js"></script>
      <script>
        $('.chart1').easyPieChart({
      barColor: '#f16529',
      trackColor: '#ccc',
      scaleColor: '#fff',
      lineCap: 'butt',
      lineWidth: 30,
      size: 200,
      animate: 1000,
      onStart: $.noop,
      onStop: $.noop
    });

      </script>
            <div id="funcBtns">
        <ul>
        <li>
         <% if(!loginnedMember.getNickname().equals("ADMIN")) {%>
      <div id="openFuncBtn" onclick="fn_pay();">
       
            </div>
             <%} %>
            </li>
            </ul>
            </div>
      
      <hr>
    </div>
    <div id="commentSection">
      <div id="commentInsert">
          <select name="commentTo" id="commentTo">
            <option value="openComment" selected>전체댓글</option>
            <option value="secretComment">비밀댓글</option>
          </select>
          <input type="text" name="commentContent" class="commentContent" id="commentContent" size="48">
          <input type="hidden" name="commentLevel" id="commentLevel" value="1">
          <button class="commentInsertBtn" id="commentInsertBtn">댓글입력</button>
      </div>
    <div id="Comments">
      <ul class="comment_list">
      </ul>
    </div>
    </div>
  </div>
</section>
<script>

Timer('<%=c.getCardBoard().getTime() %>', 'count');	

function Timer(dt, id) {
    var end = new Date(dt);
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;
    function showRemaining() {
        var now = new Date();
        var distance = end - now;

        if (distance < 0) {
            clearInterval(timer);
            document.getElementById(id).innerHTML = '특딜이 마감되었습니다!';
            console.log("마감");
            $("#openFuncBtn").html("");
            return;
        }
        
        $("#openFuncBtn").html("<img src='<%= request.getContextPath() %>/images/dollar.png' width='40px' height='40px'><p>특가 결제하기</p>");
        
        var days = Math.floor(distance / _day);
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);

        document.getElementById(id).innerHTML = hours + '시간 ';
        document.getElementById(id).innerHTML += minutes + '분 ';
        document.getElementById(id).innerHTML += seconds + '초';
    }
    timer = setInterval(showRemaining, 1000);
}

<% if(reply.equals("success")) { %>
  function autoReple() {
    $("#commentContent").val("<p class='confirm'>결제했습니다.</p>");
    $("#commentInsertBtn").click();
    $("#commentContent").val("");
  }
  <% } %>
function fn_replyToReply(comId){
  let html = "";
  html += "<div id=\"commentInsert2\">";
  html += "<input type=\"text\" name='commentContent' class='commentContent' id=\"commentContent\" size=\"46\">";
  html += "<input type=\"hidden\" name='commentLevel' id=\"commentLevel\" value=\"2\">";
  html += "<input type=\"hidden\" name='com_ref' id=\"com_ref\" value="+comId+">";
  html += "<button class=\"commentInsertBtn\">댓글입력</button>";
  html += "</div>";
  $(event.target).parent().parent().children('.replereple').html(html);
}

function fn_modifyBoard(){
  location.href = "<%=request.getContextPath()%>/board/boardSpecialModify?boardId=<%=c.getCardBoard().getBoardId()%>";
}

function fn_deleteBoard(){
  if(confirm('게시물을 삭제하시겠습니까?')){
  location.href = "<%=request.getContextPath()%>/board/boardDelete?boardId=<%=c.getCardBoard().getBoardId()%>&category=<%=c.getCardBoard().getProductCategory()%>";
  }
}

function fn_pay(){
  if(confirm('결제를 진행하시겠습니까?')) {
    location.href="<%=request.getContextPath()%>/board/boardSpecialPay?buyerUsid=<%=loginnedMember.getUsid()%>&boardId=<%=c.getCardBoard().getBoardId()%>&productPrice=<%=c.getCardBoard().getProductPrice()%>&writerUsid=<%=c.getCardBoard().getWriterUsid()%>&ln=<%=loginnedMember.getNickname()%>";
  }
}

function fn_enterBtn(){
  $("#hiddenEnterBtn").click();
}


  $(document).on('click', '.repleDelete', function(e){
    let comId = $(e.target).parent().parent().children('.comId').val();
    if(confirm('댓글을 삭제하시겠습니까?')) {
      $.ajax({
                url: "<%=request.getContextPath()%>/board/commentDelete",
                type: "post",
                dataType: "text",
                data: {
                    "comId":$(e.target).parent().parent().children('.comId').val()
                },
                success: function (data) {
                    if (data != "success") {
                        alert("댓글 삭제에 실패했습니다.");
                    }
                    fn_commentList(data);
                }
            })
    }
  })

  $(document).on('click', '.repleModify',function(e){
    let value = $(e.target).parent().parent().children('.comment_text').text();
    let comId = $(e.target).parent().parent().children('.comId').val();
    let html = "";
    html += "<div id=\"commentInsert2\">";
    html += "<input type=\"text\" name='commentContent' class='commentModify' id=\"commentContent\" value='"+value+"' size=\"46\">";
    html += "<input type=\"hidden\" name='comId' class=\"comId\" value=\""+comId+"\">";
    html += "<button class=\"commentModifyBtn\">댓글입력</button>";
    html += "</div>";
    $(e.target).parent().parent().children('.comment_text').html(html);
  })

  $(document).on('keypress', '.commentModify', function(e){
    if(e.keyCode == 13) {
      $(e.target).parent().children('.commentModifyBtn').click();
			$(e.target).val("");
			return false;
		}
  });

  $(document).on('click','.commentModifyBtn',function(e){
    $.ajax({
                url: "<%=request.getContextPath()%>/board/commentModify",
                type: "post",
                dataType: "text",
                data: {
                    "comId":$(e.target).parent().children('.comId').val(),
                    "content":$(e.target).parent().children('.commentModify').val()
                },
                success: function (data) {
                    if (data != "success") {
                        alert("댓글 작성에 실패했습니다.");
                    }
                    fn_commentList(data);
                }
            })
  })

  //같은 이름을 가진 모든 클래스에 Func적용
  $(document).on('keypress', '.commentContent', function(e){
    if(e.keyCode == 13) {
      $(e.target).parent().children('.commentInsertBtn').click();
			$(e.target).val("");
			return false;
		}
  });

  $(document).on('click','.commentInsertBtn',function (e){
        if ($(e.target).parent().children('.commentContent').val() != null) {
          if($(e.target).parent().children('input[name=commentLevel]').val()==1) {
            $.ajax({
                url: "<%=request.getContextPath()%>/board/commentInsert",
                type: "post",
                dataType: "text",
                data: {
                    "cBoardId": "<%= c.getCardBoard().getBoardId() %>",
                    "content": $(e.target).parent().children('input[name=commentContent]').val(),
                    "secret": $(e.target).parent().children('select[name=commentTo]').val(),
                    "cWriterNickname": "<%= loginnedMember.getNickname() %>",
                    "comLayer": $(e.target).parent().children('input[name=commentLevel]').val(),
                    "comProfile": "<%= loginnedMember.getMemberPicture() %>"
                },
                success: function (data) {
                    if (data != "success") {
                        alert("댓글 작성에 실패했습니다.");
                    }
                    $(e.target).parent().children('input[name=commentContent]').val("");
                    fn_commentList(data);
                }
            })
          }else {
            $.ajax({
                url: "<%=request.getContextPath()%>/board/commentInsert",
                type: "post",
                dataType: "text",
                data: {
                    "cBoardId": "<%= c.getCardBoard().getBoardId() %>",
                    "content": $(e.target).parent().children('input[name=commentContent]').val(),
                    "cWriterNickname": "<%= loginnedMember.getNickname() %>",
                    "comLayer": $(e.target).parent().children('input[name=commentLevel]').val(),
                    "comProfile": "<%= loginnedMember.getMemberPicture() %>",
                    "com_ref" : $(e.target).parent().children('input[name=com_ref]').val()
                },
                success: function (data) {
                    if (data != "success") {
                        alert("댓글 작성에 실패했습니다.");
                    }
                    $(e.target).parent().children('input[name=commentContent]').val("");
                    fn_commentList(data);
                }
            })
          }
        }
      })

    $(document).ready(function () {
        fn_commentList();
        <% if(reply.equals("success")) { %>
        autoReple();
        <% } %>
        $("#hideButton").hide();
        $("#likeFunc").click(function (e) {
            if ($("#likeFunc>img").attr("src") == "<%= request.getContextPath() %>/images/heart.png") {
                $.ajax({
                    url: "<%=request.getContextPath()%>/board/boardLike?key=insert",
                    type: "post",
                    dataType: "text",
                    data: {
                        'userUsid': '<%= loginnedMember.getUsid() %>',
                        'boardId': '<%= c.getCardBoard().getBoardId() %>'
                    },
                    success: function (data) {
                        $("#likeFunc>img").attr("src", "<%= request.getContextPath() %>/images/fullheart.png");
                    }
                })
            } else {
                $.ajax({
                    url: "<%=request.getContextPath()%>/board/boardLike?key=delete",
                    type: "post",
                    dataType: "text",
                    data: {
                        'userUsid': '<%= loginnedMember.getUsid() %>',
                        'boardId': '<%= c.getCardBoard().getBoardId() %>'
                    },
                    success: function (data) {
                        $("#likeFunc>img").attr("src", "<%= request.getContextPath() %>/images/heart.png");
                    }
                })
            }
        })
    })

    

    function fn_commentList() {
        $.ajax({
            url: "<%=request.getContextPath()%>/board/commentList",
            type: "post",
            dataType: "json",
            data: {
                "cBoardId": "<%= c.getCardBoard().getBoardId() %>"
            },
            success: function (data) {
                let html = "";
                $.each(data, function (index, item) {
                  let date = new Date(Date.parse(item.cenrollDate));
                  let repleDate = date.format('yyyy-MM-dd(KS) HH:mm:ss');
                  if("<%=loginnedMember.getUsid()%>"!="<%=c.getCardBoard().getWriterUsid()%>"){
                    if(item.comLayer==1){
                      if(item.cwriterNickname=="<%=loginnedMember.getNickname()%>") {
                        html += "<li class='comment_item'>";
                        html += "<hr>";
                        html += "<div class='comment_area'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + " <a class='addToReple' style='cursor:pointer' onclick='fn_replyToReply("+item.comId+");'>답글쓰기</a> <a class='addToReple repleModify' style='cursor:pointer'>수정</a> <a class='addToReple repleDelete' style='cursor:pointer' >삭제</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                      }else {
                        if(!item.secret){
                        html += "<li class='comment_item'>";
                        html += "<hr>";
                        html += "<div class='comment_area'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + " <a class='addToReple' style='cursor:pointer' onclick='fn_replyToReply("+item.comId+");'>답글쓰기</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                        }else {
                          html += "<li class='comment_item'>";
                        html += "<hr>";
                        html += "<div class='comment_area'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += "비밀댓글입니다." + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + " <a class='addToReple' style='cursor:pointer' onclick='fn_replyToReply("+item.comId+");'>답글쓰기</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                        }
                      }
                    }else {
                      if(item.cwriterNickname=="<%=loginnedMember.getNickname()%>") {
                        html += "<li class='comment_item'>";
                        // html += "<hr>";
                        html += "<div class='comment_area2'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + "  <a class='addToReple repleModify' style='cursor:pointer'>수정</a> <a class='addToReple repleDelete' style='cursor:pointer' >삭제</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                      }else {
                        html += "<li class='comment_item'>";
                        // html += "<hr>";
                        html += "<div class='comment_area2'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate;
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                      }
                    }
                  }else {
                    if(item.comLayer==1){
                      if(item.cwriterNickname=="<%=loginnedMember.getNickname()%>") {
                        html += "<li class='comment_item'>";
                        html += "<hr>";
                        html += "<div class='comment_area'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + " <a class='addToReple' style='cursor:pointer' onclick='fn_replyToReply("+item.comId+");'>답글쓰기</a> <a class='addToReple repleModify' style='cursor:pointer'>수정</a> <a class='addToReple repleDelete' style='cursor:pointer' >삭제</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                      }else {
                        if(!item.secret){
                        html += "<li class='comment_item'>";
                        html += "<hr>";
                        html += "<div class='comment_area'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + " <a class='addToReple' style='cursor:pointer' onclick='fn_replyToReply("+item.comId+");'>답글쓰기</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                        }else {
                          html += "<li class='comment_item'>";
                        html += "<hr>";
                        html += "<div class='comment_area'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + " <a class='addToReple' style='cursor:pointer' onclick='fn_replyToReply("+item.comId+");'>답글쓰기</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                        }
                      }
                    }else {
                      if(item.cwriterNickname=="<%=loginnedMember.getNickname()%>") {
                        html += "<li class='comment_item'>";
                        // html += "<hr>";
                        html += "<div class='comment_area2'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate + "  <a class='addToReple repleModify' style='cursor:pointer'>수정</a> <a class='addToReple repleDelete' style='cursor:pointer' >삭제</a>";
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                      }else {
                        html += "<li class='comment_item'>";
                        // html += "<hr>";
                        html += "<div class='comment_area2'>";
                        html += "<div class='comment_thumb'>";
                        html += "<img src='<%= memberPic %>/"+ item.comProfile +"' alt='' width='30px'" +
                                " height='30px' style='border-radius: 70%'>";
                        html += "</div>";
                        html += "<div class='comment_box'>";
                        html += "<div class='comment_id'>";
                        html += item.cwriterNickname;
                        html += "</div>";
                        html += "<input type='hidden' class='comId' value='" + item.comId + "'>";
                        html += "<div class='comment_text'>";
                        html += item.content + "</div>";
                        html += "<div class='comment_info'>";
                        html += repleDate;
                        html += "</div>";
                        html += "<div class='replereple'></div>";
                        html += "</div></div></li>";
                      }
                    }
                  }
                });
                $(".comment_list").html(html);
            }
        })
    }
Date.prototype.format = function (f) {

if (!this.valueOf()) return " ";



var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];

var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];

var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

var d = this;



return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

    switch ($1) {

        case "yyyy": return d.getFullYear(); // 년 (4자리)

        case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)

        case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)

        case "dd": return d.getDate().zf(2); // 일 (2자리)

        case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)

        case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)

        case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)

        case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)

        case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)

        case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)

        case "mm": return d.getMinutes().zf(2); // 분 (2자리)

        case "ss": return d.getSeconds().zf(2); // 초 (2자리)

        case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분

        default: return $1;

    }

});

};



String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };

String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };

Number.prototype.zf = function (len) { return this.toString().zf(len); };
</script>
<%@ include file="/views/common/footer.jsp" %>