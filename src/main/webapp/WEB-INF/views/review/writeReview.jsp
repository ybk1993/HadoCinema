<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
  <title>관람평 등록하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="${pageContext.request.contextPath }/resources/css/review.css" rel="stylesheet">
</head>

	<script type="text/javascript">
		$(document).ready(function(){

			
			$(".submitR").on("click", function(){
				
				var formObj = $("form[name='writeForm']");
				var name = $('#rMovieName').val();
				var content = $('#reviewContent').val();
				
				if(name.trim()==""){					
					alert('영화 제목을 입력하세요');				
					return false;					
				}
				if(content.trim()==""){					
					alert('관람평을 입력하세요');					
					return false;					
				}
				
				formObj.attr("action", "/review/writeReviewOk");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			$('.starRev span').click(function(){
				  $(this).parent().children('span').removeClass('on');
				  $(this).addClass('on').prevAll('span').addClass('on');
				  
				  var countStar = $('.on').length
				  $('.reviewGrad').html(countStar);				  
				  $('#reviewGrade').val(countStar);		
				  return false;
				});
			
			$('textarea').on('keyup', function(){
				  // 남은 글자 수를 구한다.
				  var letterLength = $(this).val().length;
				  var result = letterLength+" / 최대 200자";
				  // 문서 객체에 입력한다.
				  $('.byte').html(result);
				});	
		})	
</script>
<body>

<div class="container">

  <h2>Large Modal</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">관람평 작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
       	<form name="writeForm" method="post" action="/review/writeReviewOk">
	<input type="hidden" id="rMemId" name="rMemId" value="ac3232"/>
<textarea id="rMovieName" name="rMovieName" cols="2" rows="2" placeholder="영화 제목을 입력해주세요"></textarea>

<div class="bx_score">
<span class="tit"></span>
<span class="reviewGrad" style="text-align:center;font-size: 20px;font-style: bold;">10</span>점			
<div class="starRev">
  <span class="star on">별1</span>
  <span class="star on">별2</span>
  <span class="star on">별3</span>
  <span class="star on">별4</span>
  <span class="star on">별5</span>
  <span class="star on">별6</span>
  <span class="star on">별7</span>
  <span class="star on">별8</span>
  <span class="star on">별9</span>
  <span class="star on">별10</span>
</div>
</div>		
<textarea id="reviewContent" name="reviewContent" cols="20" rows="5" placeholder="평점 및 영화 리뷰를 작성해주세요. 최대 200자 작성 가능합니다."></textarea>
<input type="hidden" id="reviewGrade" name="reviewGrade" value="10"> 

<span class="byte" id="counter">0 / 최대 200자</span>


</form>
				
</div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="submitR btn btn-secondary btn-block write_btn">작성</button>	
        </div>
        
      </div>
    </div>
  </div>
  
</div>

</body>
</html>
