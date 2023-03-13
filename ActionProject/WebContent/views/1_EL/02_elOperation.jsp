<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>EL 연산</h2>
	
	<h3>1. 산술 연산 (덧셈,곱셈,빼기..)</h3>
	<p>
		* 기존 방식<br>
		10 + 3 = <%=(int)request.getAttribute("big") + (int)request.getAttribute("small")%>
	</p>
	
	<p>
		* EL방식 연산 <br>
		10 + 3 = ${big + small} <br>
		10 - 3 = ${big - small} <br>
		10 x 3 = ${big * small} <br>
		10 / 3 = ${big / small} 또는 ${big div small } <br>
		10 % 3 = ${big % small} 또는 ${big mod small } <br>
	</p>
	
	<h3>2. 숫자간 대소비교 연산</h3>
	<p>
		* 기존방식 <br>
		10 > 3 : <%=(int)request.getAttribute("big") > (int)request.getAttribute("small")%>
	</p>
	
	<p>
		* EL방식 비교연산<br>
		10 > 3 : ${big > small} 또는 ${big gt small}<br> <!-- greater then -->
		10 < 3 : ${big < small} 또는 ${bit lt small}<br> <!-- less then -->
		10 >= 3 : ${big >= small} 또는 ${big ge small}<br> <!-- greater or equal -->
		10 <= 3 : ${big <= small} 또는 ${big le small}<br> <!-- less or equal -->
	</p>
	
	<hr>
	
	<h3>3. 동등 비교 연산(많이사용됨)</h3>
	
	<p>
		*기존 방식<br>
		10과 3이 일치합니까? : <%=(int)request.getAttribute("big") == (int)request.getAttribute("small")%> <br>
		sOne과 sTwo가 일치합니까? : <%=((String)request.getAttribute("sOne")).equals((String)request.getAttribute("sTwo")) %>
						    또는 <%= (String) request.getAttribute("sOne") == (String)request.getAttribute("sTwo") %>						  
	</p>
	
	<p>
		*EL 방식동등비교방식<br>
		10과 3이 일치합니까? : ${big == small} 또는 ${big eq small} <br><!-- equal -->
		big에 담긴 값이 10과 일치합니까? : ${big == 10} 또는 ${big eq 10} <br>
		
		sOne과 sTwo가 일치합니까? : ${sOne eq sTwo} 또는 ${sOne == sTwo}<br>
		<!-- EL표현식에서 ==비교는 자바에서 equals()와 같은 동작을함 -->
		
		sOne과 sTwo가 일치하지않습니까? : ${sOne != sTwo} 또는 ${sOne ne sTwo}<br>
		<!-- EL표현식에서 !=비교는 자바에서 Not equals()와 같은 동작을함 -->
		
		sOne에 담긴 값이 "안녕"과 일치합니까? : ${sOne == "안녕"} 또는 ${sOne eq '안녕'}<br>
		<!-- EL에서 문자열 리터럴 제시시 홀따옴표, 쌍따옴표 상관 없음 -->
	</p>
	
	<h3>4. 객체가 null인지 혹은 list가 비어있는지 테스트하는 연산</h3>
	<p>
		* EL 연산<br>
		pTwo가 null입니까? : ${pTwo == null} 또는 ${empty pTwo} 또는 ${pTwo eq null}<br>
		pOne은 null입니까? : ${pOne == null} 또는 ${empty pOne} 또는 ${pOne eq null}<br>
		pOne이 null이아닙니까? : ${pOne != null} 또는 ${!empty pOne}<br>
		
		lOne이 비어있습니까? : ${empty lOne} <br>
		lTwo가 비어있습니까? : ${empty lTwo} <br> 
	</p>
	
	<h3>5. 논리연산자</h3>
	<p>
		* EL 연산 <br>
		AND 연산 : ${true && true} 또는 ${true and true}<br>
		OR 연산 : ${true || false} 또는 ${false or true }
	</p>
	
	<h3>연습문제</h3>
	<p>
	 	*EL연산에서 배운 키워드만 가지고 써보기<br>
	 	big이 small보다 크고 lOne은 텅 비어있습니까? : ${big gt small && empty lOne}<br>
	 	big과 small의 곱은 4의 배수입니까? : ${big * small % 4 == 0}<br>
	 	lTwo가 텅 비어있지 않거나 또는 sOne에 담긴 값이 "안녕하쇼"와 일치합니까? : ${!empty lTwo || sOne == '안녕하쇼'}
	</p>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<br><br><br><br><br><br><br><br>
</body>
</html>