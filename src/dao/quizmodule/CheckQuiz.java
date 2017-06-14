package dao.quizmodule;

import java.util.ArrayList;
import java.util.Collections;

import dto.Quiz;

public class CheckQuiz {
	Quiz quiz;
	int combo = 0;
	String answer = null;
	ArrayList<String> quizlist;
	public CheckQuiz() {
		super();
	}
	//퀴즈를 섞는 메서드
	public void setQuizList(Quiz quiz){
		quizlist = new ArrayList();
		String answer = quiz.getQ_answer();
		quizlist.add(quiz.getQ_answer());
		quizlist.add(quiz.getQ_wa_a());
		quizlist.add(quiz.getQ_wa_b());
		quizlist.add(quiz.getQ_wa_c());
		Collections.shuffle(quizlist);
	}
	
	//섞인 퀴즈를 반환한다.
	public ArrayList getQuizList(){
		return quizlist;
	}
	
	//선택한 답과 정답이 맞는지 확인하는 메서드
	public void setQuizCheck(String select) {
		this.quiz = quiz;
	}

	public void setQuiz(Quiz quiz){
		this.quiz = quiz;
	}
	
	public Quiz getQuiz(){
		return this.quiz;
	}
	
	//이용자가 선택한 퀴즈의 보기를 String으로 가져온다. 그리고 여기서 확인
	public void setAnswer(String answer) {
		this.answer = answer;
		if(quiz.getQ_answer().equals(answer)){
			this.combo++;
		}else{
			this.combo = 0;
		}
	}

	//콤보화면에 뿌려질 combo를 리턴한다.
	public int getCombo() {
		return combo;
	}
	
	
	
	
}
