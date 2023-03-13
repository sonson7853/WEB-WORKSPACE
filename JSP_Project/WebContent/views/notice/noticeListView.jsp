<%@ page import="java.util.ArrayList, com.kh.notice.model.vo.Notice" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.list-area{
		border:1px solid white;
		text-align:center;		
	}
	
	.list-area>tbody>tr:hover{
			background:gray;
			cursor:pointer;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">공지사항</h2>
		<br>
		
		<!-- 공지사항게시판의 게시판은 관리자만 작성 가능함 -->
		<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
			<div align="right" style="width:850px;">
				<a href="<%=contextPath %>/enrollForm.no" class="btn btn-secondary">글작성</a>	
			</div>	
		<% } %>
		
		
		<table class="list-area" align="center">
			<thead>
				<tr>
					<th>글번호</th>
					<th width="400">글제목</th>
					<th width="100">작성장</th>
					<th>조회수</th>
					<th width="100">작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- <tr>
					<td>3</td>
					<td>제목~~~</td>
					<td>admin</td>
					<td>123</td>
					<td>2020-03-03</td>
				</tr>
				<tr>
					<td>2</td>
					<td>제목~~~</td>
					<td>admin</td>
					<td>123</td>
					<td>2020-03-03</td>
				</tr>
				<tr>
					<td>1</td>
					<td>제목~~~</td>
					<td>admin</td>
					<td>123</td>
					<td>2020-03-03</td>
				</tr> -->
				<% if(list.isEmpty()) { %>
					<!-- 리스트가 비어있는 경우 -->
					<tr>
						<td colspan="5">존재하는 공지사항이 없습니다..</td>
					</tr>
				<% } else { %>
					<% for(Notice n : list) { %>
					<tr onclick="moveNotice(<%=n.getNoticeNo()%>)">
						<td><%= n.getNoticeNo() %></td>
						<td><%= n.getNoticeTitle() %></td>
						<td><%= n.getNoticeWriter() %></td>
						<td><%= n.getCount() %></td>
						<td><%= n.getCreateDate() %></td>
					</tr>
					<% } %>
				<% } %>	
			</tbody>
		</table>
	</div>
	
	<script>
		function moveNotice(nno){
			location.href = "<%=contextPath %>/detail.no?nno="+nno;
		}
	
		<%-- $(function(){
			
			$(".list-area>tbody>tr").click(function(){
				
				// 클릭했을때 해당 공지사항의 번호를 가져올 수 있어야함.
				let nno = $(this).children().eq(0).text();
				
				// get방식으로 요청시 url ? 붙여서 파라미터를 함께 전송할 수 있음
				// ?키=밸류&키=밸류
				// ?물음표 뒤의 내용들을 쿼리스트링이라고 부름
				// nno값은 클릭했을때 이동할 게시판의 글번호
				location.href="<%=contextPath%>/detail.no?nno="+nno;

			})
		}) --%>
	</script>
	
	
	

	
	
</body>
</html>