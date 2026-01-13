<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/common.jsp" %>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>기타</span></h2>
			<ul class="menu">
				<li class="btn_sub on"><a href="#">운영자관리</a></li>
				<li><a href="contract_list.jsp">계약서</a></li>
				<li><a href="terms_list.jsp">이용약관</a></li>
				<li><a href="privacy_list.jsp">개인정보취급방침</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>기타</li>
						<li>운영자관리</li>
						<li>리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>운영자관리</h3>
				</div>
				<div class="list">
				<form method="post" action="operator_action.jsp">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:200px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">운영자 ID</th>
								<td><input type="text"  name="id" required style="width: 100%;" value=""></td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td><input type="text" name="pw" required style="width: 100%;"></td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td><input type="text" name="name" required style="width: 100%;"></td>
							</tr>
							<tr>
								<th scope="row">연락처</th>
								<td><input type="text" name="tel" required style="width: 100%;"></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td><input type="text" name="email" required style="width: 100%;"></td>
							</tr>
							<tr>
								<th scope="row">이용상태</th>
								<td>       
									<span><input type="radio" id="setting_01" name="setting" value='Y' checked><label for="setting_01">정상</label></span>
									<span><input type="radio" id="setting_02" name="setting" value='N'><label for="setting_02">정지</label></span>
									<span><input type="radio" id="setting_03" name="setting" value='D'><label for="setting_03">탈퇴</label></span>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area align_r mt20">
						<button type="submit" class="btn btn_search">저장</button>
						<a href="#" class="btn btn_search" style="color: #fff;">목록</a>
					</div>
					</form> 
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
