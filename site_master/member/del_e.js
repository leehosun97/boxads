/**
 * 
 */
			// 1.모두 체크
			function allChk(obj){
				var chkObj = document.getElementsByName("RowCheck");
				var rowCnt = chkObj.length - 1;
				var check = obj.checked;
				
				if (check) {﻿
					for (var i=0; i<=rowCnt; i++){
					if(chkObj[i].type == "checkbox")
						chkObj[i].checked = true; 
					}
		      	} else {
		          	for (var i=0; i<=rowCnt; i++) {
		           	if(chkObj[i].type == "checkbox")
		               chkObj[i].checked = false; 
		          	}
		      	}  	
			} 

			//﻿2. 체크박스 선택된 것 삭제 처리 (N개) 
			function fn_userDel(){
				var userid = "";
				var memberChk = document.getElementsByName("RowCheck");
				var chked = false;
				var indexid = false;
			  
				for(i=0; i < memberChk.length; i++){
					if(memberChk[i].checked){
						if(indexid) userid = userid + '-';
			    
			   			userid = userid + memberChk[i].value;
			    		indexid = true;
			   		}
			  	}
			  	if(!indexid){
			  		alert("삭제할 사용자를 체크해 주세요");
			   		return;
			  	}
			  	var agree = confirm("삭제 하시겠습니까?");
			  	if (agree){
					document.userForm.action = "enterprise_delete.jsp?userid="+userid;
 					document.userForm.method = "post";
					document.userForm.submit();
				} 
			}
			
			function formatDate(d) {
				var month = '' + (d.getMonth() + 1);
				var day = '' + d.getDate();
				var year = d.getFullYear();

				if (month.length < 2)
					month = '0' + month;
				if (day.length < 2)
					day = '0' + day;

				return [ year, month, day ].join('-'); //yyyy-MM-dd
			}
			
			//날짜 표시
			function mydateselect() {
				console.log("============date=============");
				
				var d2 = new Date(); // day end
				var d1 = new Date(); // day start
				
				document.getElementById("datepicker2").value = formatDate(d2);
				
				if(document.getElementById('today').checked) {
					d1.setDate(d2.getDate() - 1); 					
				} else if(document.getElementById('week').checked) {
					d1.setDate(d2.getDate() - 7); 		
				} else if(document.getElementById('month').checked) {
					d1.setMonth(d2.getMonth() - 1); //values are 0-11		
				} else {
					d1.setMonth(d2.getMonth() - 6); //values are 0-11		
				}
				document.getElementById("datepicker1").value = formatDate(d1);
			}
			
			function initdatecheckbox() {
				var radios = document.getElementsByName("month");
				for(var i = 0; i < radios.length; i++){
				    if(radios[i].checked){
				        radios[i].checked=false;
				    }
				}
			}
			
/*			//var radio = <%=searchradio%>;
			function initradio() {
				switch ( radio ) {
				case 1 : 
					document.getElementById('today').checked = true;
					break;
				case 2 : 
					document.getElementById('week').checked = true;
					break;	
				case 3 : 
					document.getElementById('month').checked = true;
					break;
				case 4 : 
					document.getElementById('half').checked = true;
					break;		
				}
			}
			initradio();*/
			