package controller;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		if (cmd.equals("QUIZ_GET")) {
			return new QuizgetCommand();
		}else if (cmd.equals("QUIZ_CHECK")) {
		}
		else if (cmd.equals("QUIZ_REGI")) {
			return new QuziRegisterCommand();
		}else if(cmd.equals("QUIZ_RESULT")){
			return new QuizResultCommand();
		}else if(cmd.equals("QREGI_BOARD_LIST")){
			return new QBoradRegisterCommand();
		}else if(cmd.equals("QREGI_BOARD_GET")){
			return new QBRGetCommand();
		}
		else{
		}
		return null;
	}	
}