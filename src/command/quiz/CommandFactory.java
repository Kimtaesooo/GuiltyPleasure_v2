package command.quiz;

import controller.Command;

public class CommandFactory {
	private CommandFactory(){}
	private static CommandFactory instance = new CommandFactory();
	
	public static CommandFactory newInstance(){
		return instance;
	}
	
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
		if(cmd.equals("CHATING")){
			return new ChatingCommand();
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
		if(cmd.equals("CHATING")){
			return new ChatingCommand();
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