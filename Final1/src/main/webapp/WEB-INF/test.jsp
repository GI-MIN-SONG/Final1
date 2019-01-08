<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<meta name="author" content="tje" , inital-scale=1.0">
<meta name="description" content="더조은 미슐랭: 테마별 맛집 추천 어플리케이션">
<meta name="keywords" content="맛집, 맛집 추천">
<meta name="robots" content="all">
<title>더조은 미슐렝: 테마별 맛집 추천</title>

<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css'>
<link href="resources/css/style.css" rel="stylesheet">
<link href="resources/css/reset.css" rel="stylesheet">

<link href="resources/css/font-awesome.css" rel="stylesheet">


<script src="resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>


	<header id=header>
		<div class="container">
			<div class="quick">
				<a href="#">Login</a><a href="#">Sing Up</a> <a href="#">My Page</a>
			</div>
			<div class="title">
				<p>
					<a href="#"><img src=resources/img/title.jpg width=25%></a>
				</p>

			</div>
			<nav id="topMenu">
				<ul>
					<li class="topMenuLi"><a class="menuLink"
						href="#">필터1</a>
						<ul class="submenu">
							<li><a class="submenuLink longLink">1</a></li>
							<li><a class="submenuLink longLink">2</a></li>
							<li><a class="submenuLink longLink">3</a></li>
						</ul></li>
					<li>|</li>
					<li class="topMenuLi"><a class="menuLink"
						href="#">필터2</a>
						<ul class="submenu">
							<li><a class="submenuLink longLink">1</a></li>
							<li><a class="submenuLink longLink">2</a></li>
							<li><a class="submenuLink longLink">3</a></li>
						</ul></li>
					<li>|</li>
					<li class="topMenuLi"><a class="menuLink"
						href="#">필터3</a>
						<ul class="submenu">
							<li><a class="submenuLink longLink">1</a></li>
							<li><a class="submenuLink longLink">2</a></li>
							<li><a class="submenuLink longLink">3</a></li>
						</ul></li>
					<li>|</li>
					<li class="topMenuLi"><a class="menuLink"
						href="#">필터4</a>
						<ul class="submenu">
							<li><a class="submenuLink longLink">1</a></li>
							<li><a class="submenuLink longLink">2</a></li>
							<li><a class="submenuLink longLink">3</a></li>
						</ul></li>
				</ul>
				<div class="main-search-bar">
				<form>
					<fieldset>
						<input type="search" />
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</fieldset>
				</form>
			</div>
			</nav>
			<br><br>
			
			<div class="foodtype">
				<ul>
					<li><a href="#">전체</a></li>
					<li><a href="#">치킨</a></li>
					<li><a href="#">양식</a></li>
					<li><a href="#">중식</a></li>
					<li><a href="#">한식</a></li>
					<li><a href="#">일식</a></li>
					<li><a href="#">분식</a></li>
					<li><a href="#">디저트</a></li>
					<li><a href="#">전체리뷰</a></li>
				</ul>
			</div>
		</div>
	</header>

	<main>
	<section id="contents">
		<div class="container">
			<h2 class="blind">반응형 웹사이트 컨텐츤</h2>
			<table class="foodimg">
				<tr>
					<td><a
						href="http://terms.naver.com/entry.nhn?docId=1988755&cid=48164&categoryId=48203"
						target="_blank"> <img src=resources/img/1.jpg width=100% hight=100%></a>
						<h3>카레</h3>
						<h4>종각역</h4></td>
					<td><a
						href="http://terms.naver.com/entry.nhn?docId=1990165&cid=48164&categoryId=48203"
						target="_blank"> <img src=resources/img/2.jpg width=100% hight=100%></a>
						<h3>카레</h3>
						<h4>종각역</h4></td>
					<td><a
						href="http://terms.naver.com/entry.nhn?docId=1988410&cid=48164&categoryId=48207"
						target="_blank"> <img src=resources/img/3.jpg width=100% hight=100%></a>
						<h3>카레</h3>
						<h4>종각역</h4></td>
				</tr>
				<tr>
					<td><a
						href="http://terms.naver.com/entry.nhn?docId=1988570&cid=48163&categoryId=48201"
						target="_blank"> <img src=resources/img/4.jpg width=100%></a>
						<h3>카레</h3>
						<h4>종각역</h4></td>
					<td><a
						href="http://terms.naver.com/entry.nhn?docId=1988462&cid=48161&categoryId=48196"
						target="_blank"> <img src=resources/img/5.jpg width=100%></a>
						<h3>카레</h3>
						<h4>종각역</h4></td>
					<td><a
						href="http://terms.naver.com/entry.nhn?docId=1988407&cid=48161&categoryId=48196"
						target="_blank"> <img src=resources/img/6.jpg width=100%></a>
						<h3>카레</h3>
						<h4>종각역</h4></td>
				</tr>
			</table>
		</div>
	</section>
	</main>
	<footer id=footer>
		<br>
		<div class=footer-title>
			<h1>
				<a href="#">T J E - M</a>
			</h1>
		</div>
		<div class="icon">
			<ul>
				<li><a href="#"><i class="fa fa-facebook"
						aria-hidden="true"></i><span>페이스북</span></a></li>
				<li><a href="#"><i class="fa fa-instagram"
						aria-hidden="true"></i><span>인스타그램</span></a></li>
			</ul>
		</div>
		<small>
			<p>
				㈜ TJE-402-KDJ<br>서울특별시 종로구 더조은 아카데미, 4층 402호 <br>대표이사: 김다정<br>사업자
				등록번호: 123-12-12345 <br>통신판매업 신고번호: 2018-서울종로-12345<br>고객센터:
				02-123-4567<br> <br> <span class="copyrights">©
					2018 T J E - M i c h e l i n Co., Ltd. All rights reserved.</span>
			</p>
		</small>
		</div>
	</footer>
</body>
</html>