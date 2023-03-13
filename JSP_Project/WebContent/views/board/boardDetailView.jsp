<%@ page import="com.kh.board.model.vo.*, java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Board b = (Board) request.getAttribute("b");
   Attachment at = (Attachment) request.getAttribute("at");
   ArrayList<Reply> list = (ArrayList<Reply>) request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer table{
      border-color : white;
   }
</style>

</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <div class="outer">
      <br>
      <h2 align="center">
         일반게시판 상세보기
      </h2>
      <br>
      
      <table id="detail-area" align="center" border="1">
         <tr>
            <th width="70">카테고리</th>
            <th width="70"><%=b.getCategory() %></th>
            <th width="70">제목</th>
            <th width="350"><%=b.getBoardTitle() %></th>
         </tr>
         <tr>
            <th>작성자</th>
            <td><%=b.getBoardWriter() %></td>
            <th>작성일</th>
            <td><%=b.getCreateDate() %></td>
         </tr>
         <tr>
            <th>내용</th>
            <td colspan="3">
               <p style="height:200px"><%=b.getBoardContent() %></p>
            </td>
         </tr>
         <tr>
            <th>첨부파일</th>
            <td colspan="3">
               <%if(at == null){ %>
                  첨부파일이 없습니다.
                              
               <%}  else {%>
                  <a download="<%=at.getOriginName() %>" href="<%=contextPath %>/<%=at.getFilePath()+at.getChangeName() %>"><%=at.getOriginName() %></a>
               <%} %>
               
            </td>
         </tr>
         
      </table>
      
      <br>
      
      <div align="center">
         <a href="<%=contextPath %>/list.bo?currentPage=1" class="btn btn-secondary btn-sm">목록가기</a>
         
         <!-- 로그인한 사용자가 해당 게시글의 작성자인 경우 -->
          <% if(loginUser != null && loginUser.getUserId().equals(b.getBoardWriter())) {%>
            <a href="<%= contextPath %>/update.bo?bno=<%= b.getBoardNo() %>" class= "btn btn-warning btn-sm">수정하기</a>
            <button onclick="deleteBoard();" class="btn btn-danger btn-sm">삭제하기</button>  
         <% } %> 
      </div>
      
      <script>
      	function deleteBoard(){
      		if(!confirm("정말 삭제하시겠습니까?")){
      			return;
      		}
      		location.href = "<%= contextPath %>/delete.bo?bno=<%=b.getBoardNo() %>"
      	}
      </script>
      <br>
      
      <!-- 댓글기능 화면구현만 해두기. 요아래는 작업x -->
      
      <div id="reply-area">
         <table border="1" align="center">
            <thead>
               <% if(loginUser != null) { %>
               <!-- 로그인이 되어있을 경우 -->
               <tr>
                  <th>댓글작성</th>
                  <td>
                     <textarea id="replyContent" cols="50" rows="3" style="resize:none;"></textarea>
                  </td>
                  <td><button onclick="insertReply();">댓글등록</button></td>
               </tr>       
               <%} else { %>            
               <tr>
                  <th>댓글작성</th>
                  <td>
                     <textarea id="replyContent" cols="50" rows="3" style="resize:none;" readonly>로그인후 이용 가능한 서비스입니다.</textarea>
                  </td>
                  <td><button disabled>댓글등록</button></td>
               </tr>
               
               <% } %>
            
            </thead>
            <tbody>
				<%for(Reply r : list) { %>
					<tr>
						<td><%=r.getReplyWriter() %></td>
						<td><%=r.getReplyContent() %></td>
						<td><%=r.getCreateDate() %></td>
					</tr>
				<% } %>        
            </tbody>
         </table>
      </div>
      
      <script>
      	$(function){
      		setInterval(selectReplyList, 1000);
      		
      	});
      
      	function insertReply(){
      		$.ajax({
      			url : "<%=contextPath%>/rinsert.bo",
      			data : {
      				content : $("#replyContent").val(),
      				bno	 	: "<%=b.getBoardNo()%>"   
      			},
      			success : function(result){
      				//댓글등록 성공시 result = 1
      				
      				//댓글등록 실패시 result = 0
      				if(result > 0){
      					// 새 댓글목록 불러오는 함수
      					selectReplyList();
      					// 댓글내용 비워주기
      					$("#replyContent").val("");
      				} else{
      					alert("댓글작성에 실패했습니다.");
      				}
      			},
      			error : function(){
      				console.log("댓글작성실패");
      			}
      		});
      	}
      	
      	function selectReplyList(){
      		$.ajax({
      			url : "<%=contextPath%>/rlist.bo",
      			data : {bno : "<%=b.getBoardNo() %>"},
      			success : function(list){
      				
      				// 서버로부터 전달받은 리스트를 반복문을 통해 댓글목록으로 변환
      				let result = "";
      				for(let i of list){
      					result += "<tr>"
      								+"<td>"+i.replyWriter+"</td>"
      								+"<td>"+i.replyContent+"</td>"
      								+"<td>"+i.createDate+"</td>"
      						   + "</tr>"
      				}
      				
      				$("#reply-area tbody").html(result);
      			},
      			error : function(){
      				console.log("게시글 목록조회 실패");
      			}
      		});
      	}
      </script>
      
      
      
      
      
      
      
      
      
      
   </div>

</body>
</html>