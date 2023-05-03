<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">

		//내부에서 함수생성
		function func() {
			alert('func() 호출');
		};
		
		
		//내부에서 함수호출창 띄우기
		//func();
		
		
		//버튼클릭하여 창띄울때
		function btnFunc() {
			alert('button click');
		}
		
		
		//클릭하는 버튼에 따라 불러오는 해당 값이 바뀜 
		function btnFunc1(num) {
			console.log('도달');
			let name;
			if (num == 1) {
				name = 'input tag button!!';
			}else{
				name = 'button tag';
			}
			alert(name);
		
		
		/* <p id="demo">p tag id demo</p> 안에 넣어보기*/
			document.getElementById('demo').innerHTML = name;
		};	//사용자가 선택한 버튼에따라 num이 지정되고 name명이 달라짐
		
			
		//연산식 함수
		function sum(x, y) {
			return x + y;	//return값은 정해줘도되고 안정해줘도 된다
		}
		
		
		function btnclick() {
			document.getElementById('demo').innerHTML = sum(2,3);
		}
	</script>
	</head>
	<body>
	
		<p id='demo'>p tag id demo</p>
		
		<p id='demo'>p tag id demo</p>
		
		<!-- 버튼생성 -->
		<!-- input버튼  버튼명이 value에-->
		<input type= "button" value="input버튼" onclick="btnFunc1(1)">
		<br><br>
		
		<!-- 버튼명이 button사이에 -->
		<button type="button" onclick="btnFunc1(2)">button 버튼</button>
		<br><br>
		
		<button type="button" onclick="btnclick()">버튼</button>
		<br><br>
	
	</body>
</html>