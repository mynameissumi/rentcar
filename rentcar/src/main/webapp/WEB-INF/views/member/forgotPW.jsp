<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS, JQuery -->
<%@ include file="/WEB-INF/views/includes/common.jsp"  %>

<style>
	form {
	    border: 3px solid #f1f1f1;
	}
	
	/* Full-width inputs */
	input[type=text], input[type=email] {
	    width: 100%;
	    padding: 12px 20px;
	    margin: 8px 0;
	    display: inline-block;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
	}
	
	/* Set a style for all buttons */
	button {
	    background-color: #4CAF50;
	    color: white;
	    padding: 14px 20px;
	    margin: 8px 0;
	    border: none;
	    cursor: pointer;
	    width: 100%;
	}
	
	/* Add a hover effect for buttons */
	button:hover {
	    opacity: 0.8;
	}
	
	/* Extra style for the cancel button (red) */
	.cancelbtn {
	    width: auto;
	    padding: 10px 18px;
	    background-color: #f44336;
	}
	
	/* Center the avatar image inside this container */
	.imgcontainer {
	    text-align: center;
	    margin: 24px 0 12px 0;
	}
	
	/* Avatar image */
	img.avatar {
	    width: 40%;
	    border-radius: 50%;
	}
	
	/* Add padding to containers */
	.container {
	    padding: 16px;
	}
	
	/* The "Forgot password" text */
	span.psw {
	    float: right;
	    padding-top: 16px;
	}
	
	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
	    span.psw {
	        display: block;
	        float: none;
	    }
	    .cancelbtn {
	        width: 100%;
	    }
	}
</style>
</head>
<body>
 <!-- 상단메뉴 -->
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<!-- 로그인 폼 -->
<form id="forgotPWForm" action="/email/send" method="post">

  <div class="container">
    <label for="mem_id"><b>UserID</b></label>
    <input type="text" placeholder="아이디를 입력하세요." id="mem_id" name="mem_id" required>

    <label for="mem_email"><b>Email</b></label>
    <input type="email" placeholder="비밀번호를 입력하세요." id="mem_email" name="mem_email" required>

    <button type="button" id="btnEmail">임시비밀번호받기</button>
  </div>

</form>

 <script>

	$(document).ready(function(){

		// 장바구니 추가작업
		$("#btnEmail").on("click", function(){

		let mem_id = $("#mem_id").val();
		let mem_email = $("#mem_email").val();

		$.ajax({
			url : '/email/send',
			type: 'post',
			dataType: 'text',
			data: {mem_id : mem_id, mem_email : mem_email},
			success: function(data){
					if(data == "success"){
						alert("메일이 발송되었습니다.");
					}
				}
			});
		});

});


 </script>


  <!-- 하단 -->
  <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>