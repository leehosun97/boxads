<? include "../inc/popup_header.php" ?>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:540px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">옵션세트추가</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write">
						<table class="mt15 mb10">
							<caption>옵션세트추가</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="width:auto;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">옵션세트명</th>
									<td><input type="text" title="옵션세트명" /></td>
								</tr>
								<tr>
									<th scope="row">필수여부</th>
									<td><input type="text" title="옵션세트명" /></td>
								</tr>
							</tbody>
						</table>
						<div class="write_btn align_r mb10">
							<button class="btn_add">추가</button>
						</div>
					</div>
					<div class="list">
						<table class="mt0 type_col">
							<caption>항목 가격 입력</caption>
							<colgroup>
								<col style="width:51%;">
								<col style="width:auto;">
							</colgroup>
							<thead>
								<th>항목명</th>
								<th>가격</th>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" title="항목명" /></td>
									<td class="align_c"><input type="text" title="가격"  style="width:135px;"/> 원</td>
								</tr>
							</tbody>
						</table>
						<div class="write_btn align_c mt10">
							<button class="btn_modify">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>