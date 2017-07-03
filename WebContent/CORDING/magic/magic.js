/**
 * magic module
 * write by kimHS
 * 
 */
var httpRequest = null;

function answerCheck(answer, number){
	var result= false;
	if(number==2){
		result = answer=="궁전"||answer=="성"?  true :  false;
		return result
	}if(number==3){
		result = answer=="컵"||answer=="머그컵"?  true :  false;
		return result
	}if(number==4){
		result = answer=="꽃"?  true :  false;
		return result
	}if(number==5){
		result = answer=="격자무늬"||answer=="네모"?  true :  false;
		return result
	}if(number==6){
		result = answer=="독수리"||answer=="이글"?  true :  false;
		return result
	}if(number==7){
		result = answer=="사슬"?  true :  false;
		return result
	}if(number==8){
		result = answer=="해골"||answer=="스컬"?  true :  false;
		return result
	}if(number==9){
		result = answer=="용"||answer=="용머리"?  true :  false;
		return result
	}if(number==10){
		result = answer=="톱니바퀴"||answer=="톱니"?  true :  false;
		return result
	}if(number==11){
		result = answer=="지니"||answer=="요정"?  true :  false;
		return result
	}if(number==12){
		result = answer=="다지기"||answer=="바구니"?  true :  false;
		return result
	}if(number==13){
		result = answer=="책상"||answer=="의자"?  true :  false;
		return result
	}if(number==14){
		result = answer=="ufo"||answer=="원반"?  true :  false;
		return result
	}if(number==15){
		result = answer=="곰인형"||answer=="곰돌이"?  true :  false;
		return result
	}if(number==16){
		result = answer=="비행기"?  true :  false;
		return result
	}if(number==17){
		result = answer=="스프링"||answer=="유전자"||answer=="유전자모양"?  true :  false;
		return result
	}if(number==18){
		result = answer=="뫼비우스의띠"||answer=="고무줄"?  true :  false;
		return result
	}if(number==19){
		result = answer=="은하계"||answer=="태양계"?  true :  false;
		return result
	}if(number==20){
		result = answer=="밤하늘"||answer=="최면술"?  true :  false;
		return result
	}
}