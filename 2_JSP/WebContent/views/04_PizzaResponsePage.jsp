<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 이 구문을 스크립트릿이라고 부르며, html문서내에 java코드를 쓸 수 있는 영역
	// 현재 이 jsp에서 필요로하는 데이터들 => request의 attribute영역에 담겨있음.
	// request.getAttribute("key") : Object(그에 해당하는 밸류값의 자료형으로 형변환해야함)
	String pizza = (String) request.getAttribute("pizza");
	String[] toping = (String[]) request.getAttribute("toping");
	String[] side = (String[]) request.getAttribute("side");
	int price = (int) request.getAttribute("price"); 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피자결제페이지</title>
</head>
<body>
	<h2>주문 내역</h2>
	
	<h3>
	피자는 <span style="color:red;"><%= pizza %></span>, 토핑은
	<span style="color:green;">
	<% if(toping == null){ %>
	   없고
	<%} else{%>
	   <%= String.join(",", toping) %>
	<%} %>
	</span>, 사이드는
	<span style="color:blue;">
	<% if(side == null){ %>
	   없고
	<%} else{%>
	   <%= String.join(",", side) %>
	<%} %>
	</span> 주문하셨습니다.
	</h3>

	
	<h3> 총합 : <%= price%>원</h3>
	
	<h2 style="color:pink;">즐거운 식사시간 되세요~~</h2>
	
	
</body>
</html>