package dao.battlemodule;

import java.util.List;

import dto.Quiz;

public class GetBattleQuiz {

	public String getQuiz(String br_type) {
		BattlePlay dao = new BattlePlay();
		Quiz quizdto = new Quiz();
		String quiz = "";
		String[] quizinfo = new String[4];
		List list = dao.getQuiz(br_type);
		quizdto = (Quiz) list.get(0);

		quizinfo[0] = quizdto.getQ_answer();
		quizinfo[1] = quizdto.getQ_wa_a();
		quizinfo[2] = quizdto.getQ_wa_b();
		quizinfo[3] = quizdto.getQ_wa_c();
		
		String[] quizinfo_shuffle = shuffle(quizinfo);

		quiz = quizdto.getQ_code() + ":" + quizdto.getQ_type() + ":" + quizdto.getQ_question() + ":"
				+ quizinfo_shuffle[0] + ":" + quizinfo_shuffle[1] + ":" + quizinfo_shuffle[2] + ":"
				+ quizinfo_shuffle[3] + ":";

		return quiz;
	}

	// 퀴즈 정답과 오답 순서를 랜덤으로 석어주는 메서드
	public String[] shuffle(String[] result) {
		int seed;
		String temp;
		for (int i = 0; i < 4; i++) {
			seed = (int) (Math.random() * 3) + 1;
			temp = result[i];
			result[i] = result[seed];
			result[seed] = temp;
		}

		return result;

	}

}
