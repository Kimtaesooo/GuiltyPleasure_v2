package dao.quizmodule;

import java.util.ArrayList;
import java.util.Collections;

import dto.Quiz;

/**
 * 퀴즈와 관련된 작업을 하는클래스
 * */
public class CheckQuiz {
	Quiz quiz;
	int combo = 1;
	String answer = null;
	ArrayList<String> quizlist;
	public CheckQuiz() {
		super();
	}
	/**
	 * 퀴즈의 보기를 섞어 주는 클래스
	 * @param Quiz 퀴즈객체
	 * @see Quiz 퀴즈 정보를 저장하는 DTO클래스
	 * */
	public void setQuizList(Quiz quiz){
		quizlist = new ArrayList();
		String answer = quiz.getQ_answer();
		quizlist.add(quiz.getQ_answer());
		quizlist.add(quiz.getQ_wa_a());
		quizlist.add(quiz.getQ_wa_b());
		quizlist.add(quiz.getQ_wa_c());
		Collections.shuffle(quizlist);
	}
	
	/**
	 * 섞인퀴즈를 반환하는 클래스
	 * @see setQuizList(Quiz)
	 * @return ArrayList 퀴즈 보기가 섞인 리스트를 반환
	 * */
	public ArrayList getQuizList(){
		return quizlist;
	}
	
	/**
	 * 선택한 답과 정답이 맞는지 확인하는 메서드
	 * */
	public void setQuizCheck(String select) {
		this.quiz = quiz;
	}

	public void setQuiz(Quiz quiz){
		this.quiz = quiz;
	}
	
	public Quiz getQuiz(){
		return this.quiz;
	}
	
}
