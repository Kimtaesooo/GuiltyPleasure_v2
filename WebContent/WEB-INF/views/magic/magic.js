/**
 * magic module
 * write by kimHS
 * 
 */
var httpRequest = null;

function answerCheck(answer, number){
	var result= false;
	if(number==2){
		result = answer=="����"||answer=="��"?  true :  false;
		return result
	}if(number==3){
		result = answer=="��"||answer=="�ӱ���"?  true :  false;
		return result
	}if(number==4){
		result = answer=="��"?  true :  false;
		return result
	}if(number==5){
		result = answer=="���ڹ���"||answer=="�׸�"?  true :  false;
		return result
	}if(number==6){
		result = answer=="������"||answer=="�̱�"?  true :  false;
		return result
	}if(number==7){
		result = answer=="�罽"?  true :  false;
		return result
	}if(number==8){
		result = answer=="�ذ�"||answer=="����"?  true :  false;
		return result
	}if(number==9){
		result = answer=="��"||answer=="��Ӹ�"?  true :  false;
		return result
	}if(number==10){
		result = answer=="��Ϲ���"||answer=="���"?  true :  false;
		return result
	}if(number==11){
		result = answer=="����"||answer=="����"?  true :  false;
		return result
	}if(number==12){
		result = answer=="������"||answer=="�ٱ���"?  true :  false;
		return result
	}if(number==13){
		result = answer=="å��"||answer=="����"?  true :  false;
		return result
	}if(number==14){
		result = answer=="ufo"||answer=="����"?  true :  false;
		return result
	}if(number==15){
		result = answer=="������"||answer=="������"?  true :  false;
		return result
	}if(number==16){
		result = answer=="�����"?  true :  false;
		return result
	}if(number==17){
		result = answer=="������"||answer=="������"||answer=="�����ڸ��"?  true :  false;
		return result
	}if(number==18){
		result = answer=="����콺�Ƕ�"||answer=="����"?  true :  false;
		return result
	}if(number==19){
		result = answer=="���ϰ�"||answer=="�¾��"?  true :  false;
		return result
	}if(number==20){
		result = answer=="���ϴ�"||answer=="�ָ��"?  true :  false;
		return result
	}
}