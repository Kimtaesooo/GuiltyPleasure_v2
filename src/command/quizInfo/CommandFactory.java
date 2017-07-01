package command.quizInfo;

import controller.Command;
import controller.MainCommand;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();
	
	private CommandFactory(){
		
	}
	
	public static CommandFactory getInstance(){
		return instance;
	}
	public Command createCommand(String cmd){
		
		if(cmd.equals("LIST")){
			return new ListCommand();
		}
		
		if(cmd.equals("INFO")){
			return new InfoCommand();
		}
		
		if(cmd.equals("MAIN")){
			return new MainCommand();
		}
		if(cmd.equals("UPDATE")){
			return new UpdateCommand();
		}
		if(cmd.equals("DELETE")){
			return new DeleteCommand();
		}
		
		return null;
	}
}
