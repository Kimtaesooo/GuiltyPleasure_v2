<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/showModalDialogCallee.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sub.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css">
<link href="${pageContext.request.contextPath}/font/NotoSansKR.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		getDialogArguments();
		var varParam = window.dialogArguments;
		var info = varParam.trim().split(' ');
		var returninfo = '';
		for(var i=0; i<info.length; i++){
			var sInfo = info[i].split("=");
			$("#erasetable").append('<tr><th>'+sInfo[0]+'</th><td><input type="checkbox" id="sInfo[1]" value="'+sInfo[1]+'"/></td></tr>');
		}
		$("#erasetable").append('<tr><td colspan="2" style="text-align: right;"><input type="button" id="del" value="삭제" class="btnStyle2 midBlack"/> <input type="button" id="cancel" class="btnStyle2 midBlue" value="취소"/></td></tr>');
	
		$("#del").click(function(){
			if(confirm('사용자의 제재를 삭제하겠습니까?')){				
				$("input:checkbox").each(function(){
					if(this.checked){
						returninfo += this.value+" ";
					}
				});
				
				if(returninfo.length==0){
					alert('선택된 내역이 없습니다.');
					return false;
				}
				
				setReturnValue(returninfo);
				
				parent.window.returnValue = returninfo;
				parent.window.close();
			}
			
		});
		$("#cancel").click(function(){
			parent.window.close();
		});
	});
	
	
	
	
</script>
</head>
<body>
<div class="subCC">
<h2 class="subTitle">제재 내역 삭제</h2>
<hr class="margin20">
<table class="infoTable" id="erasetable">
		<colgroup>
			<col style="width:50%;">
			<col style="width:50%;">
		</colgroup>

	
</table>
</div>
</body>
</html>