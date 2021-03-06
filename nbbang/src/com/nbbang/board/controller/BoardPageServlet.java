package com.nbbang.board.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nbbang.board.model.service.BoardService;
import com.nbbang.board.model.vo.Card;

/**
 * Servlet implementation class BoardPageServlet
 */
@WebServlet("/board/boardPage")
public class BoardPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String boardId = request.getParameter("boardId");
		int writerUsid = Integer.parseInt(request.getParameter("writerUsid"));
		String reply = new String();
		if(request.getParameter("reply")!=null) {
			reply = request.getParameter("reply");
		}
		Cookie[] cookies = request.getCookies();
		String boardHistory = "";
		boolean hasRead = false;
		if(cookies!=null) {
			for(Cookie c : cookies) {
				String name = c.getName();
				String value = c.getValue();
				
				if("boardHistory".equals(name)) {
					boardHistory = value;
					if(value.contains("|"+boardId+"|")) {
						//읽은 게시글
						hasRead = true;
						break;
					}
				}
			}
		}
		
		//읽지 않은 게시물
		if(!hasRead) {
			Cookie c = new Cookie("boardHistory", boardHistory+"|"+boardId+"|");
			c.setMaxAge(-1);
			response.addCookie(c);
		}
		Card c = new BoardService().boardPage(boardId, hasRead, writerUsid);
		
		List<Integer> paidUsers= new ArrayList<Integer>();
		List<Integer> deliveryUsers = new ArrayList<Integer>();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ArrayList<Integer> tradeUserList = new BoardService().tradeUserList(Integer.parseInt(boardId));
		int likeCount = new BoardService().requestCount(Integer.parseInt(boardId));
		if(c==null) {
			request.setAttribute("msg", "문서를 불러오는데 실패했습니다");
			request.setAttribute("loc", "/boList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			if(c.getCardBoard().getTradeStage()==2) {
				paidUsers = new BoardService().paidUsers(Integer.parseInt(boardId));
			}
			if(c.getCardBoard().getTradeStage()==3) {
				deliveryUsers = new BoardService().deliveryUsers(Integer.parseInt(boardId));
			}
			String temp = c.getCardBoard().getTradeArea();
			if(temp!=null) {
				if(temp.length()>8) {
				String newTemp = temp.substring(0, temp.indexOf(" ", temp.indexOf(" ") + 1));
				c.getCardBoard().setTradeArea(newTemp);
				}
			}
			if(tradeUserList!=null)request.setAttribute("tradeUserList", tradeUserList);
			if(request.getParameter("reply")!=null) {request.setAttribute("reply", reply);}
			request.setAttribute("paidUsers", paidUsers);
			request.setAttribute("deliveryUsers", deliveryUsers);
			request.setAttribute("requestCount", likeCount);
			request.setAttribute("curCard", c);
			request.getRequestDispatcher("/views/board/boPage.jsp").forward(request, response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
