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
 h2{
 font-family:'Black Han Sans', sans-serif;
 color:#00bcd5;
 }
 .margin10{
 margin-bottom:10px; margin-right:10px;
 }
 .card-title a{
 font-family:'Nanum Myeongjo', serif;
 font-weight:bold;
 color:#374047;
 }
 .card-img-top{
 	height:300px;
 }
  .card-body{
 	height:150px;
 }

</style>  
  
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
      <h2>&nbsp; <i class="fas fa-book" style="color: #d3d3d3 "></i>&nbsp; 추천도서</h2>
      <hr style="border: thin solid;color:#00bcd5;">
      <br>
      <div class="row justify-content-around">
<%@include file="recomend.jsp" %>
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
      <h2>&nbsp;<i class="fas fa-book" style="color: #d3d3d3 "></i>&nbsp; 베스트 셀러</h2>
      <hr style="border: thin solid;color:#00bcd5;">
      <br>
      <div class="row justify-content-around">  
    	<%@include file="bestseller.jsp" %>
    </div><!-- row -->
	
	</div>
	</div>
  <!-- /.container -->
</div>
  <!-- Footer -->
  <%@include file="inc/bottom.jsp" %>