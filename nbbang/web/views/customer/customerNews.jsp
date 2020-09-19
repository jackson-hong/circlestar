<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">

<style>
    table {
        width: 800px;
        height: 300px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 6%;
        margin-bottom: 10%;

    }

    th {
        background-color: #eeeeee;
        font-weight: bolder;
        text-align: center;
        font-size: 18px;
    }

    td {
        text-align: center;
        padding-top: 0.7%;
        font-size: 14px;
    }

    h1 {
        background-color: lightsalmon;
        font-size: 22px;
        margin-left: auto;
        margin-right: auto;
        margin-top: 1.8%;
        width: 600px;
        height: 70px;
        padding-left: 24px;
    }

    button {
        width: 100px;
        background-color:sandybrown;
        border: none;
        color: rgb(22, 19, 19);
        text-decoration: none;
        display: inline-block;
        font-size: 15px;
        margin: 4px;
        cursor: pointer;
        padding: 15px 0;
        text-align: center;

    }
	
	#fontBold{font-weight:bold;}
</style>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/cstmcss/main.css" type="text/css">
<style>
/*  */
</style>
<section>
<aside class="sidebar">
  <img id="logo" src="<%=request.getContextPath()%>/images/logoTitle.png" alt="">
  <ul class="ul-first">
    <li class="cstmt-list" style="font-size:20px;" id="fontBold"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerMain">N빵 가이드</a></li>
   <li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerQnA">N빵 문의</a></li>
   <li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerNews">N빵 소식</a></li>
   <li class="cstmt-list" style="font-size:16px;"><a class="main-a" href="<%=request.getContextPath() %>/customer/customerAsk">N빵 질문</a></li>
 </ul>
 <ul class="ul-second">
   <li class="list-hiper"><a href="" class="hiper-tag">홈</a></li>
   <li class="list-hiper"><a href="" class="hiper-tag">구경하기</a></li>
   <li class="list-hiper"><a href="" class="hiper-tag">해외직구</a></li>
   <li class="list-hiper"><a href="" class="hiper-tag">마이페이지</a></li>
 </ul>
 <ul class="ul-third">
   <li id="list-image1"><a href=""><image src="<%=request.getContextPath()%>/images/we.png" width="190px" height="55px"></a></li>
   <li id="list-image2"><a href=""><image src="<%=request.getContextPath()%>/images/pang.png" width="190px" height="55px"></a></li>
   <li id="list-image3"><a href=""><image src="<%=request.getContextPath()%>/images/llist1.png" width="205px" height="60px"></a></li>
 
 </ul>
</aside>
</section>
<section>
    <div class="coustomer-news">
        <table class="tbl-news" style="">
            <colgroup>
                <col width="15%">
                <col width="15%">
                <col width="35%">
                <col width="15%">
                <col width="20%">
            </colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>유형</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>

                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>공지</td>
                    <td><a href="">공지사항입니다.</a></td>
                    <td>운영자</td>
                    <td>2020.09.16</td>
                </tr>

            </thead>
        </table>
    </div>
    <!-- 작성버튼 -->
    <div id="btn-news">
        <button type="submit" id="btn-news-check">글작성</button>
    </div>



</section>
<%@ include file="/views/common/footer.jsp" %>