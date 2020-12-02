<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>

	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<%@include file="../cdn.jsp" %>
	 	<%@include file="../header.jsp" %>
	 	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
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

	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
			</div>
			<hr />
			
			<section id="container">
				<form name="writeForm" method="post" action="/board/write">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="cs_content">내용</label><textarea id="cs_content" name="cs_content" class="chk" title="내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="cs_memid">작성자</label><input type="text" id="cs_memid" name="cs_memid" class="chk" title="작성자를 입력하세요."/>
								</td>
							<tr>
								<td>						
									<button class="write_btn" type="submit">작성</button>	
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
				
			</section>
			<hr />
		</div>
	</body>
</html>