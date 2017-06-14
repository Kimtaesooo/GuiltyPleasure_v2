package command.myInfo;

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
		
		if(cmd.equals("MYINFO")){
			return new MyinfoCommand();
		}
		
		if(cmd.equals("MYBATTLEINFO")){
			return new MybattleInfoCommand();
		}
		
		if(cmd.equals("MAIN")){
			return new MainCommand();
		}
		if(cmd.equals("DELETE")){
			return new DeleteCommand();
		}
		return null;
	}
}
