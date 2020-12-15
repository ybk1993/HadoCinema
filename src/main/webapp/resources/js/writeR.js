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