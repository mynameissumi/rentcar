<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Car Rental Service</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
<script type="text/javascript">
$(document).ready(function() {
    $("#writeBtn").click(function(){
       location.href ="write";
    })
    
    
    $.ajax({
        url: "boardList",
        success: function(result) {
            var html = "";
            result.forEach(function(item) {
                html += "<tr> <td><a href='view?idx=" + item.idx + "'>" + item.title + "</a>"
                    + "<button type='button' class='btn btn-danger' style='float: right;' id='deleteBtn" + item.idx + "'>글삭제</button></td> </tr>";
            });

            $("#listArea").append(html);
            $('#example').DataTable();

            result.forEach(function(item) {
                $("#deleteBtn" + item.idx).click(function() {
                    var idx = item.idx;
                    $.ajax({
                        url: "deleteBoardByIdx",
                        type: "POST",
                        data: { idx: idx },
                        success: function(result) {
                            location.reload();
                        },
                        error: function(xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });
                });
            }.bind(this)); 
        }
    });
} );


</script>
</head>
<body>


<!--
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>렌트카 게시판 작업</h1> 
</div>
-->

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="index">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="board">Board</a>
      </li>
    </ul>
  </div>  
</nav>

<div class="container" style="margin-top:30px">
   <div class="row">
      <div class="col-sm-12">
         <thead>
            <tr>
               <th>게시판</th>
            </tr>   
         </thead>
         <table id="example" class="display" style="width:100%">
              <thead>
                  <tr>
                      <th>제목</th>
                  </tr>
              </thead>
              <tbody id = "listArea">
              </tbody>
          </table>
         <button type="button" class="btn btn-primary" id = "writeBtn">글쓰기</button>
      </div>
   </div>
</div>
</body>
</html>