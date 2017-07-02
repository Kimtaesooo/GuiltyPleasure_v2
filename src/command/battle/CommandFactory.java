package command.battle;

import controller.Command;

public class CommandFactory {
	private static CommandFactory instance = new CommandFactory();
	
	private CommandFactory(){
		
	}
	
	public static CommandFactory getInstance(){
		return instance;
	}
	public Command createCommand(String cmd){
		
		if(cmd.equals("MAKEROOM")){
			return new MakeRoomCommand();
		}
		else if(cmd.equals("EXIT")){
			return new ExitCommand();
		}
		return null;
	}
}
