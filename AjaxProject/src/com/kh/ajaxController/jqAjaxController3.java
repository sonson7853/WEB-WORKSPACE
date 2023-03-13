package com.kh.ajaxController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class jqAjaxController3
 */
@WebServlet("/jqAjax3.do")
public class jqAjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jqAjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("no"));
		
		// 데이터 조회를 완료했다는 가정하에 Member 객체에 값을 담기.
		Member m = new Member();
		m.setUserNo(memberNo);
		m.setUserName("성빈");
		m.setUserId("binryun");
		m.setAddress("안양");
		
		// m 변수에 toString() 메소드가 호출 되면서 문자열이 넘어가게 됨.
//		response.getWriter().print(m);
		
		// { 속성 : 속성값 , 속성 : 속성값 }
//		JSONObject jobj = new JSONObject();
//		jobj.put("userNo", m.getUserNo()); // {userNo : 50}
//		jobj.put("userName" , m.getUserName()); // {userNO : 50 , userName : "성빈"}
//		jobj.put("userId" , m.getUserId()); 
//		jobj.put("address", m.getAddress());
		
		response.setContentType("application/json; charset=UTF-8");
		
//		response.getWriter().print(jobj);
		
		// GSON : Google JSON
		// GSON 라이브러리를 연동 해야 사용가능.
		
		Gson gson = new Gson();
		gson.toJson(m , response.getWriter());
		// toJson(응답할 객체 , 응답할 스트림) : response.getWriter() 라는 통로로 m이라는 객체를 응답시키겠다.
		// 단, 변환 시 전달되는 키값은 VO객체의 각 필드명으로 자동 지정됨.
		
		// 응답 할 객체에 VO 객체 하나만 제시하면 JSONObject 형태로 만들어져서 응답
		// ArrayList로 지정 시 JSONArray 형태로 만들어져서 응답.
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
