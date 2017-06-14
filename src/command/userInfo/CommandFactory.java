package command.userInfo;

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
		
		if(cmd.equals("RESTRICTION")){
			return new RestrictionCommand();
		}
		
		if(cmd.equals("QUIT")){
			return new QuitCommand();
		}
		if(cmd.equals("POP")){
			return new PopCommand();
		}
		if(cmd.equals("DELETERESTRICTION")){
			return new DeleteRestrictionCommand();
		}
		
		return null;
	}
}
