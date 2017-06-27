/**
 * ajax module
 * write by kimHS
 * 
 */
var httpRequest = null;

function sendRequest(method, url, param, callback){
	httpRequest = new XMLHttpRequest();
	
	var httpMethod = method ? method : "GET";
		//method의 값이 null이나 넘어오지않으면 GET으로 하겠다는 명령어
	if(method !="GET" && httpMethod != "POST"){
		method = "GET";
		//method에 오타나 이상한값이 들어오게될경우의 조건식
	}
	var httpParam = (param==null || param=="") ? null : param;
	if(httpMethod =="GET" && httpParam != null){
			url = url +"?"+ httpParam;
		
	}
	httpRequest.open(httpMethod, url, true);
	httpRequest.onreadystatechange = callback;
		// 여기서 callback 함수의 이름을 onreadystatechange에 저장하는데 여기서 callback함수의 
		// 결과값을 의미하는 것이 아닌 주소를 임시로 저장하는 것이다.
		//onreadystatechange에 미리 주소만 저장하고 함수에있는 상황이 발생했을때 실행되는 것.
	httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=urf-8");
	httpRequest.send(httpMethod=="POST" ? httpParam : null);
}

