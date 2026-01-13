<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%@ include file="../inc/header.jsp"%>
<%	
	StringBuffer str = new StringBuffer();
	
	// 카테고리 리스트
	str.append(" select * from tbl_category where c_type = 'B' and c_name != '기타' order by c_order asc ");	
	ArrayList<HashMap<String, String>> cateList = dbconn.getSql2ListMap(conn, str);
	pageContext.setAttribute("cateList", cateList);

%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>설정</span></h2>
			<%@ include file="../inc/lnb.jsp" %>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>설정</li>
						<li>카테고리</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>카테고리</h3>
				</div>
				<div class="list">
					<table class="search" style="width: 40%;">
						<caption>검색</caption>
						<colgroup>
							<col style="width:150px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">카테고리 추가</th>
							<td>
								<input type="text" title="키워드" style="width:82%" id="addIn">
								<button onclick="insert_new_category()" type="button" class="month on">등록</button>
							</td>
						</tr>
					</table>
					<div class="search_wrap">
						<table class="search_list pl20 category_table">
							<caption>카테고리</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:18%;">
								<col>
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox" class="chkAll"> 
									</th>
									<th>순서</th>
									<th scope="col">카테고리 명</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody id="tblList">
								<c:forEach items="${cateList}" var="cate">
								<tr>								
									<td><input type="checkbox" value="${cate.c_idx}" name="cidx" class="justone"></td>
									<td class="c_upt"><p onclick="set_input(this,'order')">${cate.c_order}</p></td>
									<td class="c_upt"><p onclick="set_input(this,'name')">${cate.c_name}</p></td>
									<td>
										<button onclick="delete_category(this)" type="button" class="del_btn">삭제</button>
									</td>
								</tr>
								</c:forEach>							
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<input id="c_type" type="hidden" value="B">
							<div class="fl_l">
							</div>
							<div class="fl_r">
<!-- 								<button type="submit" class="btn">저장</button> -->
								<a href="javascript:delete_selected_category();" class="btn btn_del"><span>선택삭제</span></a>
							</div>	
						</div>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="../js/category.js"></script>
</body>
</html>
