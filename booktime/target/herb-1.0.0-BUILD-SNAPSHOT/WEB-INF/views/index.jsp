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
      <c:import url="/inc/categoryBar.do"></c:import>
      
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