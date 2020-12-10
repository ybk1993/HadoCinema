<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>  
<html lang="ko">  
<head>  
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <!-- Google Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  
  <!-- JQuery -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js">
  </script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.6/js/responsive.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/faq.js"></script>
<title>FAQ</title>

  <style type="text/css">  

   
    
    .wrap{
        width: 800px;
    } 

   </style>  
   
  

</head>  

<body> 
    <div class="wrap">
    <table id="example" class="table table-striped table-bordered dt-responsive ">  
 
        <thead>  

            <tr>
                <th>번호</th>
                <th class="sorting_desc">질문</th>
            </tr> 
     

        </thead>  

        <tbody>  
                
         <c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<tr>
						<td>${dto.uid }</td>
						<td><a href="view.do?uid=${dto.uid }">${dto.subject }</a></td>
										
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>   
           
        </tbody>  

    </table>  
</div>

<button class="btn btn-primary" onclick="location.href='write.do'">신규등록</button>    

</body>  

</html>



