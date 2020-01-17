<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<style>
body {
	margin: 0;
	font-size: 0.88rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	text-align: left;
}

i {
	font-style: italic
}
img{
	margin-right:50px;
}
.container {
	margin-top: 100px
}

.card {
	box-shadow: 0 0.46875rem 2.1875rem rgba(4, 9, 20, 0.03), 0 0.9375rem
		1.40625rem rgba(4, 9, 20, 0.03), 0 0.25rem 0.53125rem
		rgba(4, 9, 20, 0.05), 0 0.125rem 0.1875rem rgba(4, 9, 20, 0.03);
	border-width: 0;
	transition: all .2s
}

.card-header:first-child {
	border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0
}

.card-header {
	display: flex;
	align-items: center;
	border-bottom-width: 1px;
	padding-top: 0;
	padding-bottom: 0;
	padding-right: 0.625rem;
	height: 3.5rem;
	background-color: #fff
}

.widget-subheading {
	color: #858a8e;
}

.card-header.card-header-tab .card-header-title {
	display: flex;
	align-items: center;
	white-space: nowrap
}

.card-header .header-icon {
	font-size: 1.65rem;
	margin-right: 0.625rem
}

.card-header.card-header-tab .card-header-title {
	display: flex;
	align-items: center;
	white-space: nowrap
}

.btn-actions-pane-right {
	margin-left: auto;
	white-space: nowrap
}

.text-capitalize {
	text-transform: capitalize !important
}

.scroll-area-sm {
	height: 288px;
	overflow-x: hidden
}

.list-group-item {
	position: relative;
	display: block;
	padding: 0.75rem 1.25rem;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.125)
}

.list-group {
	display: flex;
	flex-direction: column;
	padding-left: 0;
	margin-bottom: 0
}

.todo-indicator {
	position: absolute;
	width: 4px;
	height: 60%;
	border-radius: 0.3rem;
	left: 0.625rem;
	top: 20%;
	opacity: .6;
	transition: opacity .2s
}

.bg-warning {
	background-color: #f7b924 !important
}

.widget-content {
	padding: 1rem;
	flex-direction: row;
	align-items: center
}

.widget-content .widget-content-wrapper {
	display: flex;
	flex: 1;
	position: relative;
	align-items: center
}

.widget-content .widget-content-right.widget-content-actions {
	visibility: hidden;
	opacity: 0;
	transition: opacity .2s
}

.widget-content .widget-content-right {
	margin-left: auto
}

.btn:not (:disabled ):not (.disabled ) {
	cursor: pointer
}

.btn {
	position: relative;
	transition: color 0.15s, background-color 0.15s, border-color 0.15s,
		box-shadow 0.15s
}

.btn-outline-success {
	color: #3ac47d;
	border-color: #3ac47d
}

.btn-outline-success:hover {
	color: #fff;
	background-color: #3ac47d;
	border-color: #3ac47d
}

.btn-outline-success:hover {
	color: #fff;
	background-color: #3ac47d;
	border-color: #3ac47d
}

.btn-primary {
	color: #fff;
	background-color: #3f6ad8;
	border-color: #3f6ad8
}

.btn {
	position: relative;
	transition: color 0.15s, background-color 0.15s, border-color 0.15s,
		box-shadow 0.15s;
	outline: none !important
}

.card-footer {
	background-color: #fff
}
</style>
<!-- Breadcrumbs-->
<ol class="breadcrumb">
	<li class="breadcrumb-item"><a href="#">관리 홈</a></li>
	<li class="breadcrumb-item active">노출관리</li>
</ol>

<!-- https://bbbootstrap.com/snippets/todo-task-list-badges-71324362-->
<div class="card mb-3">
	<div class="card-header">
		<i class="fa fa-tasks"></i>&nbsp;추천도서 목록
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<ul class=" list-group list-group-flush">
				<li class="list-group-item">
					<div class="custom-checkbox custom-control">
						<input class="custom-control-input" id="checkbox0" type="checkbox"><label
							class="custom-control-label" for="checkbox0">&nbsp;</label>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox1"
										type="checkbox"><label class="custom-control-label"
										for="checkbox1">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox2"
										type="checkbox"><label class="custom-control-label"
										for="checkbox2">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox3"
										type="checkbox"><label class="custom-control-label"
										for="checkbox3">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox4"
										type="checkbox"><label class="custom-control-label"
										for="checkbox4">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox5"
										type="checkbox"><label class="custom-control-label"
										for="checkbox5">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox6"
										type="checkbox"><label class="custom-control-label"
										for="checkbox6">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox7"
										type="checkbox"><label class="custom-control-label"
										for="checkbox7">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
				<li class="list-group-item">
					<div class="widget-content p-0">
						<div class="widget-content-wrapper">
							<div class="widget-content-left mr-2">
								<div class="custom-checkbox custom-control">
									<input class="custom-control-input" id="checkbox8"
										type="checkbox"><label class="custom-control-label"
										for="checkbox8">&nbsp;</label>
								</div>
							</div>
							<div class="widget-content-left flex2">
								<div class="widget-content">
									<img align="left"
										src="https://image.aladin.co.kr/product/22210/44/coversum/k392636511_1.jpg">
									<div class="widget-heading">해빗</div>
									<div class="widget-subheading">웬디 우드</div>
									<br>
									<p>방황하여도, 자신과 기쁘며, 봄바람을 천하를 것이다. <br>모래뿐일 희망의 곳으로 가치를 보이는 인간은 얼음과 같이, 스며들어 보라.</p>
								</div>
								
							</div>
							<div class="widget-content-right">
								<button class="border-0 btn-transition btn btn-outline-success">
									상세보기</button>
								<button class="border-0 btn-transition btn btn-outline-danger">
									삭제</button>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="d-block text-right card-footer">
		<button class="mr-2 btn btn-link btn-sm">메인보기</button>
		<button class="btn btn-primary">추천도서 추가하기</button>
	</div>
</div>
<%@ include file="inc/bottom.jsp"%>