<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>  
<html>  
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
<title>FAQ</title>

  <style type="text/css">  

    table {width:500px;}  

    .hide {display:none;}  

    .show {display:table-row;}  

    .item td {cursor:pointer;} 

    .wrap{
        width: 800px;
    } 

   </style>  



</head>  

<body>  
    <div class="wrap">
    <table id="example" class="table table-striped table-bordered dt-responsive recruit">  
 
        <thead>  

            <tr>
            	
                <th class="sorting_desc">질문</th>
                
            </tr> 
     

        </thead>  

        <tbody>  
                
         <c:choose>
			<c:when test="${empty list || fn:length(list) == 0 }">
			</c:when>

			<c:otherwise>
				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<tr class="item">
						
						
						<td>${dto.subject }</td>
										
					</tr>
					
					<tr class="hide">
						
						
						<td>${dto.answer }</td>
						
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>   
           
        </tbody>   

    </table>  
</div>
    <script type="text/javascript">  

        $(document).ready(function(){
            $('#example').DataTable({
                
                order: [ [ 0, "desc" ] ]
                //,ordering: false
                
            })
        });


        $(function(){  

            var article = (".recruit .show");  

            $(".recruit .item  td").click(function() {  

                var myArticle =$(this).parents().next("tr");  

                if($(myArticle).hasClass('hide')) {  

                    $(article).removeClass('show').addClass('hide');  

                    $(myArticle).removeClass('hide').addClass('show');  

                }  

                else {  

                    $(myArticle).addClass('hide').removeClass('show');  

                }  

            });  

        });  

    </script>  

</body>  

</html>



