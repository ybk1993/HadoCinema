<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery 의존한다 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>movie</title>

</head>

<body>
    <div class="col-md-12"> <h1>영화 검색</h1> 
        <div class="col-md-4"> <form> 
            <div class="form-group"> <input type="text" class ="form-control" id="keyword" placeholder="검색어를 입력하세요"> <br>
                <button type="button" class="btn btn-primary" id="btn-movies-find">검색</button> 
            </div> </form>
        </div> 
    </div>

    <table id="demoJSON"></table>
        <!-- 영화 검색  -->


    <div class="col-md-12"> <h1>코드 검색</h1> 
        <div class="col-md-4"> <form> 
            <div class="form-group"> <input type="text" class ="form-control" id="keyword2" placeholder="검색어를 입력하세요"> <br>
                <button type="button" class="btn btn-primary" id="btn-movies-find2">검색</button> 
            </div> </form>
        </div> 
    </div>

    <form id="demoJSON2" name="code" action="movieSaveOk" method="post" onsubmit="return chkSubmit()">
        <div>제목: <input type="text" id="name"name="name" readonly/> </div>
        <div>감독: <input type="text" id="director"name="director" readonly/></div>
        <div>개봉일: <input type="text" id="date"name="date" readonly/></div>
        <div>상영시간: <input type="text" id="time"name="time" readonly/></div>
        <div>배우: <input type="text" id="actor"name="actor" readonly/></div>
        <div>줄거리:<br><textarea name="info"></textarea></div>
       <div>이미지:<input type="file" name="img"/></div>
        <input class="btn btn-primary" type="submit" value="등록"/>
    </form>
        
  

</body>
<script>
    
    var api_key = "430156241533f1d058c603178cc3ca0e";
    
    $(document).ready(function () {
        $("#btn-movies-find").click(function () {
           var keyword = $('#keyword').val();

            // JSON
            var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=" + api_key + "&movieNm=" + keyword;
    
    
            $.get(url, function(data, status){
                if(status == "success") 
                    parseJSON(data);
            });

    
        });

        $("#btn-movies-find2").click(function () {
           var keyword = $('#keyword2').val();

           var  url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=" + api_key + "&movieCd=" + keyword;
			
           $.get(url, function(data, status){
                if(status == "success") 
                	console.log(data);
                    parseJSON2(data);
            });

           
        });
    
        
    });
    
    function parseJSON(jsonObj) {
        var row = jsonObj.movieListResult.movieList;
        var i;
    
        var table = "<tr><th>이름</th><th>코드</th></tr>";
        for (i = 0; i < row.length; i++) {
            table += "<tr>"; 
            table += "<td>" + row[i].movieNm + "</td>";
            table += "<td>" + row[i].movieCd + "</td>";
            table += "</tr>"; 
        }
        
        document.getElementById("demoJSON").innerHTML = table;
    }

    function parseJSON2(jsonObj) {
    	console.log('parseJSON2>>');
        var name = jsonObj.movieInfoResult.movieInfo.movieNm;
        var director = jsonObj.movieInfoResult.movieInfo.directors[0].peopleNm;
        var date = jsonObj.movieInfoResult.movieInfo.openDt;
        var time = jsonObj.movieInfoResult.movieInfo.showTm + "분";
        var actor = jsonObj.movieInfoResult.movieInfo.actors;
        var i;
        var actors = " ";
		console.log(actor.length);
		let actcnt = 6;
		if(actor.length < 6) {
			actcnt = actor.length;
		}
        for(i = 0; i < actcnt; i++){
            actors += actor[i].peopleNm
            if(i < actcnt-1){
                actors += ", "
            }
        }
             
        document.getElementById("name").value = name;
        document.getElementById("director").value = director;
        document.getElementById("date").value = date;
        document.getElementById("time").value = time;
        document.getElementById("actor").value = actors;
        
    }








    </script>
    
</html>