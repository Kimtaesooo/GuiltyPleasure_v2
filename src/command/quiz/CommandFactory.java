package command.quiz;

import controller.Command;
/**
 * 커맨드 팩토리 클래스
 * @author 김현수
 * */
public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	/**
	 * CommandFactory instance를 생성하는 메서드
	 * */
	public static CommandFactory newInstance(){
		return instance;
	}
	/**
	 * @param String cmd 커맨드를 생성할때 매개변수로 값을 주어 원하는 인스턴스를 생성한다
	 * @return Instance String매개변수에 따라 command객체를 반환한다.
	 * 
	 * */
	public Command createCommand(String cmd){
		if (cmd.equals("QUIZ_GET")) {
			return new QuizgetCommand();
		}
		if (cmd.equals("QUIZ_CHECK")) {
		}
		
		if (cmd.equals("QUIZ_REGI")) {
			return new QuziRegisterCommand();
		}
		
		if(cmd.equals("QUIZ_RESULT")){
			return new QuizResultCommand();
		}
		
		if(cmd.equals("QREGI_BOARD_LIST")){
			return new QBoradRegisterCommand();
		}
		
		if(cmd.equals("QREGI_BOARD_GET")){
			return new QBRGetCommand();
		}
		
		if(cmd.equals("MQUIZ_REGI")){
			return new MQuziRegisterCommand();
		}
		if(cmd.equals("UPDATE")){
			return new UpdateQuizCommand();
		}
		if(cmd.equals("DELETE")){
			return new DeleteQuizCommand();
		}
		if(cmd.equals("REG")){
			return new RegQuizCommand();
		}
		if(cmd.equals("MAGIC")){
			return new MagiceyeCommand();
			}
		if(cmd.equals("GIVEUP")){
			return new GiveupCommand();
		}
		
		return null;
	}	
}