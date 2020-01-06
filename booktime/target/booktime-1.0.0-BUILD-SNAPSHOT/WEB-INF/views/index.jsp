<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp" %>
<style>
.btn-blog {
    color: #ffffff;
    background-color: #37d980;
    border-color: #37d980;
    border-radius:0;
    margin-bottom:10px
}
.btn-blog:hover,
.btn-blog:focus,
.btn-blog:active,
.btn-blog.active,
.open .dropdown-toggle.btn-blog {
    color: white;
    background-color:#34ca78;
    border-color: #34ca78;
}
 h2{color:#1c1c1c;}
 .margin10{margin-bottom:10px; margin-right:10px;}
</style>  
  
  <!--검색 Navbar-->
<nav class="navbar navbar-expand-lg">

  <!-- Collapsible content -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <form class="form-inline mx-auto" action="">
      <input class="form-control-lg" type="text" placeholder="Search" aria-label="검색어를 입력하세요">
      <button class="btn btn-primary btn-lg" type="submit">검색</button>
    </form>

  </div>
  <!-- Collapsible content -->

</nav>
<!--/.Navbar-->
  
  <header>
  
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('https://19wan424aiu917var915d3yx-wpengine.netdna-ssl.com/ibiza/wp-content/uploads/sites/2/2017/02/170529_AMISTAT-IBZ_Jordi-Cervera-9573-1900x1080.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('https://cdn.designraid.net/wp-content/uploads/2019/05/22180108/LIBRO_vwdc00_Hero_designraid-1900x1080.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('https://caseantiques.com/wp-content/uploads/auctions/2018-01-27/265_19-1900x1080.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <!-- Page Content -->
  <div class="container">
  <!-- Content Row -->
    <div class="row">
      <!-- Sidebar Column -->
      <div class="col-lg-2 mb-4">
        <div class="list-group">
          <a href="#" class="list-group-item">소설</a> <!-- 100 -->
          <a href="#" class="list-group-item">시/에세이</a> <!-- 110 -->
          <a href="#" class="list-group-item">인문</a> <!-- 120 -->
          <a href="#" class="list-group-item">가정/생활/요리</a> <!-- 130 -->
          <a href="#" class="list-group-item">건강</a> <!-- 140 -->
          <a href="#" class="list-group-item">취미/레저</a> <!-- 150 -->
          <a href="#" class="list-group-item">경제/경영</a> <!-- 160 -->
          <a href="#" class="list-group-item">자기계발</a> <!-- 170 -->
          <a href="#" class="list-group-item">사회</a> <!-- 180 -->
          <a href="#" class="list-group-item">역사/문화</a> <!-- 190 -->
          <a href="#" class="list-group-item">종교</a> <!-- 200 -->
          <a href="#" class="list-group-item">예술/대중문화</a> <!-- 210 -->
          <a href="#" class="list-group-item">학습/참고서</a> <!-- 220 -->
          <a href="#" class="list-group-item">국어/외국어</a> <!-- 230 -->
          <a href="#" class="list-group-item">사전</a> <!-- 240 -->
          <a href="#" class="list-group-item">과학/공학</a> <!-- 250 -->
          <a href="#" class="list-group-item">취업/수험서</a> <!-- 260 -->
          <a href="#" class="list-group-item">여행/지도</a> <!-- 270 -->
          <a href="#" class="list-group-item">컴퓨터/IT</a> <!-- 280 -->
          <a href="#" class="list-group-item">잡지</a> <!-- 290 -->
          <a href="#" class="list-group-item">청소년</a> <!-- 300 -->
          <a href="#" class="list-group-item">유아</a> <!-- 310 -->
          <a href="#" class="list-group-item">어린이</a> <!-- 320 -->
          <a href="#" class="list-group-item">만화</a> <!-- 330 -->
          <a href="#" class="list-group-item">해외도서</a> <!-- 340 -->
        </div>
      </div>
      
      <!-- Content Column -->
      <div class="col-lg-10 mb-4">
      <br>
      <h2 class="display-4">&nbsp;추천도서</h2>
      <hr>
      <br>
      <div class="col-lg-3 col-sm-6" style="display: inline-block;margin-bottom: 30px;">        
        <div class="card h-380">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21984/15/cover150/k622636607_2.jpg" alt=""></a>
        </div>
      </div>>
      <div class="col-lg-3 col-sm-6" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-380">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/19359/16/cover150/s432636215_1.jpg" alt=""></a>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-380">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22064/21/cover150/k162636917_1.jpg" alt=""></a>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-380">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21265/76/cover150/k702636286_1.jpg" alt=""></a>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-380">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/18827/60/cover150/8954655971_3.jpg" alt=""></a>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-380">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22342/33/cover150/k432636124_1.jpg" alt=""></a>
        </div>
      </div>
    </div>
    
    </div>
    <!-- /.row -->

	</div>
  <!-- /.container -->

  <!-- Footer -->
  <%@include file="inc/bottom.jsp" %>