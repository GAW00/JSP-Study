<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- hello패키지 아래의 HelloBean 클래스로 myBean 객체 생성 -->
<!-- scope="page" : 이 페이지에서 적용 -->
<jsp:useBean class="hello.HelloBean" id="myBean" scope="page"></jsp:useBean>
<hr>
*. 빈 생성 후 저장된 값 출력하기<br>
이름 : <%= myBean.getName() %>
나이 : <%= myBean.getAge() %>
<hr>
*. 값을 변경한 후 값 출력하기<br>
<% myBean.setName("전수빈"); %>
이름 : <%= myBean.getName() %>
<% myBean.setAge(10); %>
나이 : <%= myBean.getAge() %>
