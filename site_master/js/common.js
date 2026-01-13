function setToday(){
	var today = new Date();
	$('#datepicker1').val(today.format('yyyy-MM-dd'));
	$('#datepicker2').val(today.format('yyyy-MM-dd'));
}
function setWeek(){
	var today = new Date();
	$('#datepicker2').val(today.format('yyyy-MM-dd'));
	today.setDate(today.getDate()-7);
	$('#datepicker1').val(today.format('yyyy-MM-dd'));
}
function setMonth(m){
	var today = new Date();
	$('#datepicker2').val(today.format('yyyy-MM-dd'));
	today.setMonth(today.getMonth()-m);
	$('#datepicker1').val(today.format('yyyy-MM-dd'));
}


// DATE FORMAT
Date.prototype.format = function(f) {
	if (!this.valueOf())
		return " ";

	var weekName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];
	var d = this;

	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
		switch ($1) {
		case "yyyy":
			return d.getFullYear();
		case "yy":
			return (d.getFullYear() % 1000).zf(2);
		case "MM":
			return (d.getMonth() + 1).zf(2);
		case "dd":
			return d.getDate().zf(2);
		case "E":
			return weekName[d.getDay()];
		case "HH":
			return d.getHours().zf(2);
		case "hh":
			return ((h = d.getHours() % 12) ? h : 12).zf(2);
		case "mm":
			return d.getMinutes().zf(2);
		case "ss":
			return d.getSeconds().zf(2);
		case "a/p":
			return d.getHours() < 12 ? "오전" : "오후";
		default:
			return $1;
		}
	});
};

$(function(){
	

// 게시글 체크박스
var checkboxes = $(":checkbox.justone");
	$('.chkAll').click(function() {		
	    var checkthis = $(this);
	    if (checkthis.is(':checked')) {
	        checkboxes.prop('checked', true);
	    } else {        
	        checkboxes.prop('checked', false);
	    }
	});
	
	$(":checkbox.justone").change(function(){
		var chkAll = $('.chkAll');
	    var chk = $(":checkbox.justone");
	    if(chk.length != chk.filter(":checked").length){
	    	chkAll.prop('checked', false);
	    } else {
	    	chkAll.prop('checked', true);
	    }
	});
	
	$(".btn_b_del").on("click", function() {
		if($('.justone:checked').length == 0){
			alert("선택된 게시글이 없습니다.");
			return false;
		} else {
			if(confirm("선택한 게시물을 삭제하시겠습니까?")){
				var idxArr = new Array();
				$('.justone:checked').each(function(){
					console.log($(this).val());
					idxArr.push($(this).val());
				})
				
				$("input[name=idx]").val(idxArr);	
				$("form").attr("action", "../action/delete_admin_board.jsp");				
				$("form").submit();				
			}			
		}
		
	})
})

String.prototype.string = function(len) {
	var s = '', i = 0;
	while (i++ < len) {
		s += this;
	}
	return s;
};
String.prototype.zf = function(len) {
	return "0".string(len - this.length) + this;
};
Number.prototype.zf = function(len) {
	return this.toString().zf(len);
};

// 엑셀 다운로드
function excel_download(tag,action){
	var $form = $(tag).closest('form');
	$form.attr('action',action + '.jsp');
	$form.submit();
	$form.attr('action','?');
}