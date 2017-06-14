// ������ �̵� [1] [2] ... �ϴ� HTML �ڵ带 ���ؼ� �����ش�.
//	funcName : javascript 함수명 (��: gotoPage)
//	pageNum : 페이지번호
//	pageSize : 한화면에 보여지는 갯수
//	total : 총 갯수
//  cmd : 전송할떄 쓰는 옵션
function pageNav( funcName, pageNum, pageSize, total, cmd ,form){
	if( total < 1 )
		return "";

	var ret = "";
	var PAGEBLOCK = 10;
	var totalPages = Math.floor((total-1)/pageSize) + 1;

	var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;
	if( firstPage <= 0 ) // ?
		firstPage = 1;

	var lastPage = firstPage-1 + PAGEBLOCK;
	if( lastPage > totalPages )
		lastPage = totalPages;

	if( firstPage > PAGEBLOCK )
	{
		ret += navAnchor(funcName, 1, "<b title='처음으로'>&lt;&lt;</b>", cmd ,form) + "\n";
		ret += navAnchor(funcName, (firstPage-1), "<b title='10개전으로'>&lt;</b>", cmd ,form) + "\n";
	}

	for( i=firstPage; i<=lastPage; i++ )
	{
		if( pageNum == i ){
			if( i != lastPage ) ret += "<a class='active'><strong><u>" + i + "</u></strong></a>&nbsp;\n";
			else ret += "<a class='active'><strong><u>" + i + "</u></strong></a>&nbsp;\n";
		}
		else if( i == lastPage )
			ret += navAnchor(funcName, i, "" + i + "</a>", cmd ,form) + "&nbsp;\n";
		else
		  ret += navAnchor(funcName, i, "" + i + "" , cmd ,form) + "&nbsp;\n";
	}

	if( lastPage < totalPages )
	{
		ret += navAnchor(funcName, (lastPage+1), "<b title='10개앞으로'>&gt;</b>", cmd ,form) + "\n";
		ret += navAnchor(funcName, totalPages, "<b title='끝으로'>&gt;&gt;</b>", cmd ,form) + "\n";
	}
	return ret;
}

function navAnchor( funcName, pageNo, anchorText , cmd ,form)
{
	return "<a href='javascript:" + funcName + "(" + pageNo + ", &quot;" +cmd+ "&quot; , &quot;" +form+ "&quot;)' class='page'>" + anchorText + "</a>";
}

function gotoPage( num , cmd ,form) {
	var f = document.forms[form];
	f.cmd.value = cmd;
	f.pageno.value = num;
	f.submit();
}


