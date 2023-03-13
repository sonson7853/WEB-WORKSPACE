package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Reply;
import com.kh.notice.model.service.NoticeService;
import com.kh.notice.model.vo.Notice;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDetailController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 클릭했을때의 공지사항 글번호 가져오기
		int boardNo = Integer.parseInt(request.getParameter("bno"));

		BoardService bService = new BoardService();

		// 조회수 증가 / 게시글 조회 (Board) / 첨부파일 조회(Attachment)

		int result = bService.increaseCount(boardNo);

		if (result > 0) { // 유효한 게시글일때 => 게시글정보, 첨부파일을 조회해서 request영역안에 담을 후, 상세페이지로 포워딩

			Board b = bService.selectBoard(boardNo);
			Attachment at = bService.selectAttachment(boardNo);
			ArrayList<Reply> list = bService.selectReplyList(boardNo);
			
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("views/board/boardDetailView.jsp").forward(request, response);

		} else { // 조회수 증가 실패시 -> 에러페이지로 포워딩
			request.setAttribute("errorMsg", "게시글 상세조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
