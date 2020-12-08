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
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/review/writeReviewOk");
				formObj.attr("method", "post");
				formObj.submit();
			});
			
			$('.starRev span').click(function(){
				  $(this).parent().children('span').removeClass('on');
				  $(this).addClass('on').prevAll('span').addClass('on');
				  
				  var countStar = $('.on').length
				  $('#reviewGrad').html(countStar);		
				  $('.reviewGrades').val(countStar);				  
				 		  
				  return false;
				});
			
			$('textarea').on('keyup', function(){
				  // 남은 글자 수를 구한다.
				  var letterLength = $(this).val().length;
				  var result = letterLength+" / 최대 200자";
				  // 문서 객체에 입력한다.
				  $('.byte').html(result);});
			

		})
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
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
          <h4 class="modal-title">      관람평 작성</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <strong class="tit_movie">원 데이</strong>
       	<form name="writeForm" method="post" action="/review/writeReviewOk">
	<input type="hidden" id="rMemId" name="rMemId" value="ac3232"/>
	<input type="hidden" id="rMovieName" name="rMovieName" value="도굴"> 
	<input type="hidden" id="reviewGrade" name="reviewGrade" value="도굴"> 
<div class="bx_score">
<span class="tit"></span>
<span class="reviewGrades">10</span>점			
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
<textarea id="reviewGrad" name="reviewGrad" cols="20" rows="5" placeholder="평점 및 영화 리뷰를 작성해주세요. 최대 200자 작성 가능합니다."></textarea>

<span class="byte" id="counter">0 / 최대 200자</span>


</form>
				
</div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-secondary btn-block write_btn">작성</button>	
        </div>
        
      </div>
    </div>
  </div>
  
</div>

</body>
</html>
