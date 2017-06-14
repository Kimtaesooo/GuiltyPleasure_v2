package controller;

public class CommandFactory_hy {
	private CommandFactory_hy(){}
	private static CommandFactory_hy instance = new CommandFactory_hy();
	
	public static CommandFactory_hy newInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		if (cmd.equals("QUIZ_GET")) {
			return new QuizgetCommand();
		}else if (cmd.equals("QUIZ_CHECK")) {
			//return new QuziCheckCommand();
		}
		else if (cmd.equals("QUIZ_PUT")) {
		}else if(cmd.equals("QUIZ_RESULT")){
		}
		else{
		}
		return null;
	}
	
}
