<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
 <%@ include file="../inc/header.jsp" %>

<script type="text/javascript">
	$(function() {
		function updateClock(){
			var now = new Date(),
				second = now.getSeconds() * 6,
				minute = now.getMinutes() * 6 + second / 60,
				hour = ((now.getHours() % 12) / 12) * 360 + 90 + minute / 12;

			$('#hour').css("transform", "rotate(" + hour + "deg)");
			$('#minute').css("transform", "rotate(" + minute + "deg)");
			$('#second').css("transform", "rotate(" + second + "deg)");
		}
		function updateCal() {
			var now = new Date();
			var hh = ("00" + now.getHours()).substr(-2);
			var mm = ("00" + now.getMinutes()).substr(-2);
			var ss = ("00" + now.getSeconds()).substr(-2);
			var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
			$('#caly').text(now.getFullYear());
			$('#calm').text(months[now.getMonth()]);
			$('#cald').text(now.getDate());
			$('#calt').text(hh + ":" + mm + ":" + ss);
		}
		function timedUpdate () {
			updateClock();
			updateCal();
			setTimeout(timedUpdate, 1000);
		}
		timedUpdate();
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var g_m = $('.graph_tab');
		//var g_c = $('.org_con > div');
		g_m.each(function() {
			$(this).children().each(function(i){
				this.num = i
			});
		});

		g_m.children().click(function() {
			$(this).siblings().removeClass('on');
			$(this).addClass('on');
			var g_c = $(this).parent().siblings(".main_graph").children("div");
			g_c.removeClass('on');
			g_c.eq(this.num).addClass('on');
		});
	});
</script>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<div class="container clearfix">
			<div class="dash_content clearfix">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>DASHBOARD</li>
					</ul>
				</div>
				<div class="dashboard clearfix">
					<div class="graph_wrap">
						<div class="graph_list clearfix">
							<div class="graph_tit relative">
								<h2>
									<span>Statistic graph</span>
								</h2>
								<ul class="btn_wrap clearfix">
									<li>
										<select>
											<option>This Week</option>
										</select>
									</li>
									<li>
										<a href="#">이동</a>
									</li>
								</ul>
							</div>
							<ul class="graph_tab">
								<li class="bg01 on">
									<p>
										<span class="num">56123</span>
										<span class="txt">접속자 통계</span>
									</p>
								</li>
								<li class="bg02">
									<p>
										<span class="num">&#65510; 150,000원</span>
										<span class="txt">정산결과 통계</span>
									</p>
								</li>
								<li class="bg03">
									<p>
										<span class="num">159456</span>
										<span class="txt">고객관리</span>
									</p>
								</li>
							</ul>
							<div class="main_graph">
								<div class="on">
									<p class="txt">방문자수 현황</p>
									<iframe src="../graph/graph01.php?dummy=<? //= rand() ?>"></iframe>
								</div>
								<div>
									<p class="txt">정산결과 통계</p>
									<iframe src="../graph/graph02.php?dummy=<? //= rand() ?>"></iframe>
								</div>
								<div>
									<p class="txt">고객관리</p>
									<iframe src="../graph/graph03.php?dummy=<? //= rand() ?>"></iframe>
								</div>
							</div>
						</div>
						<div class="clock">
							<h2 class="tit"><span>Appointment</span></h2>
							<div class="clock_area">
								<div class="hero-circle">
									<div class="hero-face">
										<div id="hour" class="hero-hour"></div>
										<div id="minute" class="hero-minute"></div>
										<div id="second" class="hero-second"></div>
										<span class="circle"></span>
									</div>
								</div>
								<div class="status">
									<div id="caly" ></div>
									<span class="hypen">/</span>
									<div id="calm" ></div>
									<div id="cald" ></div>
									<div id="calt" ></div>
								</div>
							</div>
							<div class="new_event">
								<p class="txt">New Event <span>(+4)</span></p>
								<!-- <div class="type01 clearfix">
									<div class="type_left">
										<span class="ico01">판매</span>
									</div>
									<div class="type_right">
										<p class="tit">홍길동님 (상품판매 85,000원)</p>
										<span>2017. 01. 21</span>
										<a href="#" class="move">move</a>
									</div>
								</div> -->
								<!-- <div class="type02 clearfix">
									<div class="type_left">
										<span class="ico02">출금</span>
									</div>
									<div class="type_right">
										<p class="tit">홍길동님 (포인트 차감 85,000p)</p>
										<span>2017. 01. 21</span>
										<a href="#" class="move">move</a>
									</div>
								</div> -->
								<!-- <div class="type03 clearfix">
									<div class="type_left">
										<span class="ico03">게시판</span>
									</div>
									<div class="type_right">
										<p class="tit">사이트 가입문의 드립니다.</p>
										<span>2017. 01. 21</span>
										<a href="#" class="move">move</a>
									</div>
								</div> -->
								<div class="type04 clearfix">
									<div class="type_left">
										<span class="ico04">회원</span>
									</div>
									<div class="type_right">
										<p class="tit">홍길동님 (일반회원)</p>
										<span>2017. 01. 21</span>
										<a href="#" class="move">move</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="notice_wrap">
						<div class="notice">
							<div class="title">
								<h2 class="txt">공지사항</h2>
								<a href="#" class="write">쓰기</a>
								<a href="#" class="move">이동</a>
							</div>
							<ul class="list">
								<li>
									<i class="ico_notice">전체</i>
									<div class="caption">
										<a href="../sub/view.php">세종학당재단 임시공휴일 실시 안내  ♠</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">542</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">541</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">540</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">539</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
							</ul>
						</div>
						<div class="notice">
							<div class="title">
								<h2 class="txt">공지사항</h2>
								<a href="#" class="write">쓰기</a>
								<a href="#" class="move">이동</a>
							</div>
							<ul class="list">
								<li>
									<i class="ico_notice">전체</i>
									<div class="caption">
										<a href="../sub/view.php">세종학당재단 임시공휴일 실시 안내  ♠</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">542</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">541</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">540</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
								<li>
									<i class="notice_num">539</i>
									<div class="caption">
										<a href="../sub/view.php">해외 한국문화가 있는 날 안내문</a>
										<span class="txt">세종학당재단 임시공휴일 실시 안내에 대한 내요을  전체공지합니다.</span>
									</div>
									<span class="date">2016. 05. 30  16:00</span>
								</li>
							</ul>
						</div>
					</div>
		
					<div class="sub_wrap">
						<div class="graph_list graph_sub clearfix">
							<div class="graph_tit relative">
								<h2>
									<span>Statistic graph</span>
								</h2>
								<ul class="btn_wrap clearfix">
									<li>
										<select>
											<option>This Week</option>
										</select>
									</li>
									<li>
										<a href="#">이동</a>
									</li>
								</ul>
							</div>
							<ul class="graph_tab">
								<li class="bg01 on">
									<p>
										<span class="num">56123</span>
										<span class="txt">접속자 통계</span>
									</p>
								</li>
								<li class="bg02">
									<p>
										<span class="num">&#65510; 150,000원</span>
										<span class="txt">정산결과 통계</span>
									</p>
								</li>
							</ul>
							<div class="main_graph">
								<div class="on">
									<p class="txt">방문자수 현황</p>
									<iframe src="../graph/graph04.php?dummy=<? //= rand() ?>"></iframe>
								</div>
								<div>
									<p class="txt">정산결과 통계</p>
									<iframe src="../graph/graph05.php?dummy=<? //= rand() ?>"></iframe>
								</div>
							</div>
						</div>
						<div class="graph_list graph_sub no_tab clearfix">
							<div class="graph_tit relative">
								<h2>
									<span>Statistic graph</span>
								</h2>
								<ul class="btn_wrap clearfix">
									<li>
										<select>
											<option>This Week</option>
										</select>
									</li>
									<li>
										<a href="#">이동</a>
									</li>
								</ul>
							</div>
							<div class="main_graph no_tab">
								<div class="on">
									<p class="txt">방문자수 현황</p>
									<iframe src="../graph/graph06.php?dummy=<? //= rand() ?>"></iframe>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>