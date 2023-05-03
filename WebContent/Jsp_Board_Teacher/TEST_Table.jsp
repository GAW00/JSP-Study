<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		function get_w(n){
			let announcement;
			if(n == 1){
				announcement = '공지사항 입니다!';
			}
			else if(n == 2){
				announcement = '게시판 입니다!';
			}
			else if(n == 3){
				announcement = 'FAQ 입니다!';
			}
			else if(n == 4){
				announcement = 'QnA 입니다!';
			}
			else if(n == 5){
				announcement = 'Java 입니다!';
			}
			else if(n == 6){
				announcement = 'JSP 입니다!';
			}
			else if(n == 7){
				announcement = 'Oracle 입니다!';
			}
			else if(n == 8){
				announcement = 'HTML 입니다!';
			}
			else if(n == 9){
				announcement = 'CSS 입니다!';
			}
			
			document.getElementById('board_w').innerHTML = announcement;
		}
	</script>
	</head>
		<style>
            table{
                width: 500px;
                height: 400px;
            }
            td{
                padding: 10px;
            }
            #subject{
                width: 50px;
            }
        </style>
    </head>
    <body>
	   
        <table border="1">
            <tr>
                <td colspan="2">
                	<a href="#" onclick="get_w(1)">공지사항</a> |
                    <a href="#" onclick="get_w(2)">게시판</a> |
                    <a href="#" onclick="get_w(3)">FAQ</a> |
                    <a href="#" onclick="get_w(4)">QnA</a>
                </td>
            </tr>
            <tr>
                <td id="subject">
                    <a href="#" onclick="get_w(5)">Java</a><br>
                    <a href="#" onclick="get_w(6)">JSP</a><br>
                    <a href="#" onclick="get_w(7)">Oracle</a><br>
                    <a href="#" onclick="get_w(8)">HTML</a><br>
                    <a href="#" onclick="get_w(9)">CSS</a>
                </td>
                <td><p id="board_w"></p></td>
            </tr>
            <tr>
                <td colspan="2">Since 2021</td>
            </tr>
        </table>
	</body>
</html>