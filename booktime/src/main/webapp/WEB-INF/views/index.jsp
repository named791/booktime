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
    <form class="form-inline mx-auto" action="search.do">
      <input class="form-control-lg" type="text" placeholder="'알라딘'을 입력해보세요" aria-label="Search" name="searchKeyword" id="searchKeyword">
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
  <div class="container" id="mainView">
  <!-- Content Row -->
    <div class="row justify-content-end">
      <!-- Sidebar Column -->
      <div class="col-lg-2 mb-4">
        <div class="list-group">
          <a href="category.do?cateNo=1" class="list-group-item">소설/시</a> <!-- 1 -->
          <a href="category.do?cateNo=55889" class="list-group-item">에세이</a> <!-- 55889 -->
          <a href="category.do?cateNo=656" class="list-group-item">인문</a> <!-- 656 -->
          <a href="category.do?cateNo=1230" class="list-group-item">가정/생활/요리</a> <!-- 1230 -->
          <a href="category.do?cateNo=53556" class="list-group-item">건강</a> <!-- 53556 -->
          <a href="category.do?cateNo=55890" class="list-group-item">취미/레저</a> <!-- 55890 -->
          <a href="category.do?cateNo=170" class="list-group-item">경제/경영</a> <!-- 170 -->
          <a href="category.do?cateNo=336" class="list-group-item">자기계발</a> <!-- 336 -->
          <a href="category.do?cateNo=798" class="list-group-item">사회</a> <!-- 798 -->
          <a href="category.do?cateNo=74" class="list-group-item">역사/문화</a> <!-- 74 -->
          <a href="category.do?cateNo=1237" class="list-group-item">종교</a> <!-- 1237 -->
          <a href="category.do?cateNo=517" class="list-group-item">예술/대중문화</a> <!-- 517 -->
          <a href="category.do?cateNo=76001" class="list-group-item">학습/참고서</a> <!-- 76001 -->
          <a href="category.do?cateNo=1322" class="list-group-item">국어/외국어</a> <!-- 1322 -->
          <a href="category.do?cateNo=4395" class="list-group-item">사전</a> <!-- 4395 -->
          <a href="category.do?cateNo=987" class="list-group-item">과학/공학</a> <!-- 987 -->
          <a href="category.do?cateNo=1383" class="list-group-item">취업/수험서</a> <!-- 1383 -->
          <a href="category.do?cateNo=1196" class="list-group-item">여행/지도</a> <!-- 1196 -->
          <a href="category.do?cateNo=351" class="list-group-item">컴퓨터/IT</a> <!-- 351 -->
          <a href="category.do?cateNo=2913" class="list-group-item">잡지</a> <!-- 2913 -->
          <a href="category.do?cateNo=112011" class="list-group-item">장르소설</a> <!-- 112011 -->
          <a href="category.do?cateNo=13789" class="list-group-item">유아</a> <!-- 13789 -->
          <a href="category.do?cateNo=1108" class="list-group-item">어린이</a> <!-- 1108 -->
          <a href="category.do?cateNo=2551" class="list-group-item">만화</a> <!-- 2551 -->
          <a href="category.do?cateNo=90834" class="list-group-item">해외도서</a> <!-- 90834 -->
        </div>
      </div>
      
      <!-- Content Column -->
      <div class="col-lg-10 mb-4">
      <br>
      <h2 class="display-4">&nbsp;추천도서</h2>
      <hr>
      <br>
      <div class="row justify-content-around">
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">        
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21984/15/cover500/k622636607_2.jpg" alt=""></a>
	        <div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서1</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/19359/16/cover500/s432636215_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서2</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22160/14/cover500/k842636310_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서3</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21265/76/cover500/k702636286_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서4</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/18827/60/cover500/8954655971_3.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서5</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22039/45/cover500/k662636816_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서6</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22370/49/cover500/k132636222_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서7</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22271/23/cover500/8932919550_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서8</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
    </div>
    </div><!-- row -->
    
    <div class="col-lg-2 mb-4">
        <div class="list-group">
        &nbsp;
        </div>
    </div>
    
    <!-- Content Column -->
      <div class="col-lg-10 mb-4">
      <br>
      <h2 class="display-4">&nbsp;베스트 셀러</h2>
      <hr>
      <br>
      <div class="row justify-content-around">
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">        
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21984/15/cover500/k622636607_2.jpg" alt=""></a>
	        <div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서1</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/19359/16/cover500/s432636215_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서2</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22160/14/cover500/k842636310_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서3</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21265/76/cover500/k702636286_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서4</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/18827/60/cover500/8954655971_3.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서5</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22039/45/cover500/k662636816_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서6</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22370/49/cover500/k132636222_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서7</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22271/23/cover500/8932919550_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서8</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
    </div>
    </div><!-- row -->
	
	<div class="col-lg-2 mb-4">
    	&nbsp;
    </div>
	
	 <!-- Content Column -->
      <div class="col-lg-10 mb-4">
      <br>
      <h2 class="display-4">&nbsp;신간</h2>
      <hr>
      <br>
      <div class="row justify-content-around">
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">        
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21984/15/cover500/k622636607_2.jpg" alt=""></a>
	        <div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서1</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/19359/16/cover500/s432636215_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서2</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22160/14/cover500/k842636310_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서3</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/21265/76/cover500/k702636286_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서4</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/18827/60/cover500/8954655971_3.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서5</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22039/45/cover500/k662636816_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서6</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22370/49/cover500/k132636222_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서7</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
      <div class="col-lg-3 col-sm-6 portfolio-item" style="display: inline-block;margin-bottom: 30px;">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="https://image.aladin.co.kr/product/22271/23/cover500/8932919550_1.jpg" alt=""></a>
        	<div class="card-body">
	            <h4 class="card-title">
	              <a href="#">도서8</a>
	            </h4>
	            <p class="card-text">책 소개</p>
	         </div>
        </div>
      </div>
    </div>
    </div><!-- row -->
	
	</div>
  <!-- /.container -->
</div>
  <!-- Footer -->
  <%@include file="inc/bottom.jsp" %>