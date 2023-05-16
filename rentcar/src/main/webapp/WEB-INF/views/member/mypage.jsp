<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS, JQuery -->
<%@ include file="/WEB-INF/views/includes/common.jsp"  %>
<script>
    $(document).ready(function(){

        $("#btnDelete").on("click", function(){
            location.href = "/member/deleteConfirm";
        });
        
        $("#btnPWChange").on("click", function(){
            location.href = "/member/changePW";
        });

    });
    
   
</script>
</head>
<body>
 <!-- 상단메뉴 -->
<%@ include file="/WEB-INF/views/includes/header.jsp" %>


<article class="container">
    <div class="page-header">
        <div class="col-md-6 col-md-offset-3">
        <h3>MyPage</h3>
        </div>
    </div>
    
    <div class="col-sm-6 col-md-offset-3">
        
            <div class="form-group">
                <label for="mem_name">이름</label>
                <input type="text" class="form-control" id="mem_name" name="mem_name" value='<c:out value="${memberVO.mem_name }" />' readonly placeholder="이름을 입력해 주세요">
            </div>
            <div class="form-group">
                <label for="mem_id">아이디</label>
                <input type="text" class="form-control" id="mem_id" name="mem_id" value='<c:out value="${memberVO.mem_id }" />' readonly placeholder="아이디를 입력해 주세요">
                <button id="btnUserIDCheck" type="button" class="btn btn-default">중복확인</button>
                <span id="result" style="color:red;"></span>
            </div>
            
            
            <div class="form-group">
                <label for="mem_email">이메일 주소</label>
                <input type="email" class="form-control" id="mem_email" name="mem_email" value='<c:out value="${memberVO.mem_email }" />' readonly placeholder="이메일 주소를 입력해주세요">
            </div>
            <div class="form-group">
                <label for="sample2_postcode">우편번호</label>
                <input type="email" class="form-control" id="sample2_postcode" name="mem_zipcode" value='<c:out value="${memberVO.mem_zipcode }" />' readonly placeholder="우편번호를 입력해주세요">
                
            </div>
            <div class="form-group">
                <label for="sample2_address">기본주소</label>
                <input type="email" class="form-control" id="sample2_address" name="mem_addr" value='<c:out value="${memberVO.mem_addr }" />' readonly placeholder="기본주소를 입력해주세요">
            </div>
            <div class="form-group">
                <label for="sample2_detailAddress">나머지주소</label>
                <input type="email" class="form-control" id="sample2_detailAddress" name="mem_addr_d" value='<c:out value="${memberVO.mem_addr_d }" />' readonly placeholder="나머지주소를 입력해주세요">
                <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
            </div>
            
            <div class="form-group">
                <label for="mem_phone">휴대폰 번호</label>
                <input type="tel" class="form-control" id="mem_phone" name="mem_phone" value='<c:out value="${memberVO.mem_phone }" />' readonly placeholder="휴대폰번호를 입력해 주세요">
            </div>
            

            <div class="form-group text-center">
                <button type="button" id="btnDelete" class="btn btn-primary">
                    회원삭제<i class="fa fa-check spaceLeft"></i>
                </button>
                <button type="button" id="btnPWChange" class="btn btn-primary">
                    비밀번호변경<i class="fa fa-check spaceLeft"></i>
                </button>
            </div>
       
    </div>

</article>

  <!-- 하단 -->
  <%@ include file="/WEB-INF/views/includes/footer.jsp" %>
  
</body>
</html>